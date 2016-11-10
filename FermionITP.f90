PROGRAM Fermion_ITP
   !
   ! 
   ! Record of Revisions
   !	Date	Programmer	Description of change
   !	====	==========	=====================
   !   14/8/15   Yang Kai	v2.0 release
   !

   USE system_parameters
   USE TEBDtools_module
   USE io_module
   USE Hamiltonian_tools_module
   USE bose_hubbard_module
   USE fermi_hubbard_module
   USE heisenberg_module
   USE spinS_module
   USE rotation_module
   USE local_operations_module
   USE observables_module
   USE propagation_module
   
   USE fermi_s_hubbard_module
   
   IMPLICIT NONE
   INTEGER::narg,cptArg !#of arg & counter of arg
   CHARACTER(len=64)::name !Arg name
   CHARACTER(64) :: inputFileName
   LOGICAL:: lookForFile=.FALSE.
   LOGICAL:: fileExist

   TYPE(tensor), POINTER :: Gammas(:) !List of gamma tensors
   TYPE(vector), POINTER :: Lambdas(:) !List of Lambda vectors
   TYPE(vectorInt), POINTER :: LabelLeft(:), LabelRight(:) !Lists of
   !number conserving vectors
   TYPE(matrix), POINTER :: H(:) !Hamiltonian
   TYPE(measure) :: Measures !Measures derived type
   REAL(KIND=rKIND) :: tick, tock !Timing Variables
   CHARACTER(len=132) :: localName, avgName, CorrName,FermiCorrName,&
         entName, stub !File names
   INTEGER :: i,j,k !Dummy integers
   CHARACTER(4) :: tmpstr
   CHARACTER(64) :: fmtname
   INTEGER :: tmpdd
   COMPLEX(KIND=rKind) :: eye
   
   !Read in input parameters
   NAMELIST /SystemSettings/ systemSize, totNum, spin, BoundaryCond,&
         trotterOrder
   NAMELIST /FHParams/ jTunn, U0, mu0, V0, t0, t1, delta, omega0, omega1
   NAMELIST /ITPParams/ chiMin, chiMax, convCriterion1, convCriterion2,&
         stepsForJudge, dtITP, maxITPsteps, itpDir

   inputFileName='FermionITP.nml'
   narg=COMMAND_ARGUMENT_COUNT()
   IF(narg>0)THEN
      DO cptArg=1,narg
         CALL GET_COMMAND_ARGUMENT(cptArg,name)
         SELECT CASE(ADJUSTL(name))
         CASE("--file","-f")
            lookForFile=.TRUE.
         CASE default
            IF(lookForFile) THEN
               inputFileName=ADJUSTL(name)
               lookForFile=.FALSE.
            ENDIF
         END SELECT
      END DO
   END IF
   
   INQUIRE(FILE=inputFileName,EXIST=fileExist) ! check if it exist
   IF(.NOT.fileExist) THEN
      WRITE(*,*) 'file', inputfileName,'not found'
      STOP
   ENDIF

   OPEN(138,file=inputFileName)
   READ(138,SystemSettings)
   READ(138,FHParams)
   READ(138,ITPParams)
   CLOSE(138)

   !Print output to screen
   print_switch=.TRUE.
   !Number conservation
   IF(totNum==0) THEN
      ncswitch=.FALSE.
   ELSE
      ncswitch=.TRUE.
   END IF

   tmpdd=systemSize
   WRITE(tmpstr,'(I4)') tmpdd+1
   fmtname='('//TRIM(ADJUSTL(tmpstr))//'E30.15e3)'

   !Convert to rKind reals
   jTunn=jTunn*1.0_rKind
   U0=U0*1.0_rKind
   mu0=mu0*1.0_rKind
   t0=t0*1.0_rKind
   t1=t1*1.0_rKind
   delta=delta*1.0_rKind
   omega0=omega0*1.0_rKind
   omega1=omega1*1.0_rKind
   convCriterion1=convCriterion1*1.0_rKind
   convCriterion2=convCriterion2*1.0_rKind
   eye = CMPLX(0.0, 1.0)
   
   !Define local dimension based on spin
   spinSize=FLOOR(2.0_rKind*spin+1.0_rKind)
   maxFilling=spinSize
   localSize=spinSFermiLocalDim()

   IF(print_Switch) THEN
      PRINT *, 'Beginning Fermion ITP Case study.'
      PRINT *, systemSize,'sites',totNum,'particles',maxFilling,'particles&
            & allowed per site'
      PRINT *, 'spin',spin
      PRINT *, 'Hubbard params: t0',t0, 'omega0',omega0,'delta',delta,'U',U0,'mu',mu0
      PRINT *, 'ITP parameters: chi1,2',chiMin,chiMax
      PRINT *, 'convergence criteria',convCriterion1,convCriterion2
      PRINT *, 'dt',dtITP,'maxITPsteps',maxITPsteps
      PRINT *, 'Order of trotter expansion',trotterOrder
      IF(BoundaryCond=='O') THEN
         PRINT *, 'Open boundary conditions'
      ELSE IF(BoundaryCond=='P') THEN
         PRINT *, 'Periodic boundary conditions'
      END IF
   END IF
   !Begin timing
   CALL CPU_TIME(tick)

   !Allocate Hamiltonian
   IF(BoundaryCond=='O') THEN
      CALL AllocateOps(H,systemSize-1,localSize*localSize)
   ELSE
      CALL AllocateOps(H,systemSize,localSize*localSize)
   END IF
   CALL CreateFermiSops()  
   CALL CreateOptionalOps()
   CALL fermi_s2_Hamiltonian(H,t0,t1,omega0,omega1,delta,U0, mu0, V0=V0)
   !Allocate the Gammas & Labdas
   CALL AllocateGamLam(Gammas, Lambdas, chiMin)


   !Define initial state and propagate in imaginary time to find the
   !ground state
   IF(ncswitch) THEN
      CALL AllocateLabel(LabelLeft, LabelRight, chiMin)
      !Define the initial state consistent with number conservation
      CALL InitialSetNC(Gammas, Lambdas, LabelLeft, LabelRight, 1)
      !Propagate in imaginary time
      CALL ImagTimePropNC(H, Gammas, Lambdas, LabelLeft, LabelRight&
            , chiMin, 1)
      !Number non-conserving routines
   ELSE
      !Define the initial state
      CALL AllStates(Gammas,Lambdas)
      !Propagate in imaginary time
      CALL ImagTimeProp(H, Gammas, Lambdas, chiMin,1)
   END IF


   !Allocate necessary measures
   CALL AllocateMeasures(Measures,14, 2, 3, 16, 1)
   !Define local measures
   Measures%local(1)%op=0.0_rKind
   Measures%local(2)%op=0.0_rKind
   Measures%local(3)%op=0.0_rKind
   Measures%local(4)%op=0.0_rKind
   Measures%local(5)%op=0.0_rKind
   Measures%local(6)%op=0.0_rKind
   Measures%local(7)%op=0.0_rKind
   Measures%local(8)%op=0.0_rKind
   Measures%local(9)%op=0.0_rKind
   Measures%local(10)%op=0.0_rKind
   Measures%local(11)%op=0.0_rKind
   Measures%local(12)%op=0.0_rKind
   Measures%local(13)%op=0.0_rKind
   Measures%local(14)%op=0.0_rKind
   ! Measures%local(15)%op=0.0_rKind
   ! Measures%local(16)%op=0.0_rKind
   ! Measures%local(17)%op=0.0_rKind
   !sigmaz: a_opS(1)**H a_opS(1) - a_opS(2)**H a_opS(2)
   Measures%local(1)%op=Measures%local(1)%op+MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)&
         - MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr)
   !n: a_opS(1)**H a_opS(1) + a_opS(2)**H a_opS(2)
   Measures%local(2)%op=Measures%local(2)%op+MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)&
         + MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr)
   !delta: a_opS(2) a_opS(1)
   Measures%local(3)%op=Measures%local(3)%op+MATMUL(a_opS(2)%mr,a_opS(1)%mr)
   !a_opS(1)**H a_opS(1) * a_opS(1)**H a_opS(1)+a_opS(2)**H a_opS(2) * a_opS(2)**H a_opS(2)
   Measures%local(4)%op=Measures%local(4)%op+MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr),MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)) + MATMUL(MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr),MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr)) 
   !interaction: a_opS(1)**H a_opS(2)**H a_opS(2) a_opS(1)
   Measures%local(5)%op=Measures%local(5)%op+MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr),TRANSPOSE(a_opS(2)%mr)),MATMUL(a_opS(2)%mr,a_opS(1)%mr))
   !sigma_x
   Measures%local(6)%op=Measures%local(6)%op+MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(2)%mr)&
         + MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(1)%mr)
   !sigma_y
   Measures%local(7)%op=Measures%local(7)%op+MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(2)%mr)&
         - MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(1)%mr)
   !d_{1,2,3,4}
   ! Measures%local(8)%op=Measures%local(8)%op+(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)&
   !       +eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))/SQRT(2.0) 
   ! Measures%local(9)%op=Measures%local(9)%op+(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)&
   !       -eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))/SQRT(2.0) 
   ! Measures%local(10)%op=Measures%local(10)%op+(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)&
   !       +eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))/SQRT(2.0) 
   ! Measures%local(11)%op=Measures%local(11)%op+(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)&
   !       -eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))/SQRT(2.0) 

   !d_{1,2}
   Measures%local(8)%op=Measures%local(8)%op+0.5*MATMUL(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)), a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))
   !d_{3,4}
   Measures%local(9)%op=Measures%local(9)%op+0.5*MATMUL(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)), a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   !d_{1,4}
   Measures%local(10)%op=Measures%local(10)%op+0.5*MATMUL(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)), a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   !d_{2,3}
   Measures%local(11)%op=Measures%local(11)%op+0.5*MATMUL(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)), a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   !d_{1,3}
   Measures%local(12)%op=Measures%local(12)%op+0.5*MATMUL(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)), a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   !d_{2,4}
   Measures%local(13)%op=Measures%local(13)%op+0.5*MATMUL(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),  a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   
   Measures%local(14)%op=Measures%local(14)%op+MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)+MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr), MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)+MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr))
   ! DO k=1,localSize
   !    WRITE(*, FMT=fmtname) (Measures%local(3)%op(k,j), j=1,localSize)
   ! END DO

   ! DO k=1,localSize
   !    WRITE(*, FMT=fmtname) (Measures%local(4)%op(k,j), j=1,localSize)
   ! END DO
   
   ! DO k=1,localSize
   !    WRITE(*, FMT=fmtname) (Measures%local(5)%op(k,j), j=1,localSize)
   ! END DO      
   
   !Define average measures
   !Number

   Measures%avg(1)%op=0.0_rKind
   Measures%avg(2)%op=0.0_rKind
   DO i=1, spinSize,1
      Measures%avg(1)%op=Measures%avg(1)%op+MATMUL(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr)
   END DO
   Measures%avg(2)%op=Measures%avg(2)%op+MATMUL(a_opS(2)%mr,a_opS(1)%mr)

   !Define correlation functions
   Measures%corr(1)%op=0.0_rKind
   Measures%corr(2)%op=0.0_rKind
   Measures%corr(3)%op=0.0_rKind
   DO i=1, spinSize,1
      !single particle density matrix      
      Measures%corr(1)%op=Measures%corr(1)%op+TensorProd(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr)
      !<n_i n_i'>
      Measures%corr(2)%op=Measures%corr(2)%op+TensorProd(MATMUL(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr),MATMUL(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr))
   END DO
   !<Delta_i**H Delta_i'>
   Measures%corr(3)%op=Measures%corr(3)%op+TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),TRANSPOSE(a_opS(2)%mr)),MATMUL(a_opS(2)%mr,a_opS(1)%mr))

   !Define correlation functions with fermi phases
   Measures%fermicorr(1)%op=0.0_rKind
   Measures%fermicorr(2)%op=0.0_rKind
   Measures%fermicorr(3)%op=0.0_rKind
   Measures%fermicorr(4)%op=0.0_rKind
   Measures%fermicorr(5)%op=0.0_rKind
   Measures%fermicorr(6)%op=0.0_rKind
   Measures%fermicorr(7)%op=0.0_rKind
   Measures%fermicorr(8)%op=0.0_rKind
   Measures%fermicorr(9)%op=0.0_rKind
   Measures%fermicorr(10)%op=0.0_rKind
   Measures%fermicorr(11)%op=0.0_rKind
   Measures%fermicorr(12)%op=0.0_rKind
   Measures%fermicorr(13)%op=0.0_rKind
   Measures%fermicorr(14)%op=0.0_rKind
   Measures%fermicorr(15)%op=0.0_rKind
   Measures%fermicorr(16)%op=0.0_rKind

   DO i=1,spinSize,1
      !single particle density matrix
      Measures%fermicorr(1)%op=Measures%fermicorr(1)%op+TensorProd(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr)
      Measures%fermicorr(2)%op=Measures%fermicorr(2)%op+TensorProd(MATMUL(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr),MATMUL(TRANSPOSE(a_opS(i)%mr),a_opS(i)%mr))
   END DO   
   Measures%fermicorr(3)%op=Measures%fermicorr(3)%op+TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),TRANSPOSE(a_opS(2)%mr)),MATMUL(a_opS(2)%mr,a_opS(1)%mr))
   ! <d_1(i') d_2(i)>
   Measures%fermicorr(4)%op=Measures%fermicorr(4)%op&
         +0.5*TensorProd(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))
   ! <d_2(i') d_1(i)>
   Measures%fermicorr(5)%op=Measures%fermicorr(5)%op&
         +0.5*TensorProd(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))
   ! <d_3(i') d_4(i)>
   Measures%fermicorr(6)%op=Measures%fermicorr(6)%op&
         +0.5*TensorProd(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)),a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   ! <d_4(i') d_3(i)>
    Measures%fermicorr(7)%op=Measures%fermicorr(7)%op&
         +0.5*TensorProd(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)),a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   ! <d_1(i') d_4(i)>
   Measures%fermicorr(8)%op=Measures%fermicorr(8)%op&
         +0.5*TensorProd(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   ! <d_4(i') d_1(i)>
    Measures%fermicorr(9)%op=Measures%fermicorr(9)%op&
         +0.5*TensorProd(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)),a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))
   ! <d_2(i') d_3(i)>
   Measures%fermicorr(10)%op=Measures%fermicorr(10)%op&
         +0.5*TensorProd(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   ! <d_3(i') d_2(i)>
    Measures%fermicorr(11)%op=Measures%fermicorr(11)%op&
         +0.5*TensorProd(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)),a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))
   ! <d_1(i') d_3(i)>
   Measures%fermicorr(12)%op=Measures%fermicorr(12)%op&
         +0.5*TensorProd(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   ! <d_3(i') d_1(i)>
   Measures%fermicorr(13)%op=Measures%fermicorr(13)%op&
         +0.5*TensorProd(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)+eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)),a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)+eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))
   ! <d_2(i') d_4(i)>
   Measures%fermicorr(14)%op=Measures%fermicorr(14)%op&
         +0.5*TensorProd(a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)),a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)))
   ! <d_4(i') d_2(i)>
   Measures%fermicorr(15)%op=Measures%fermicorr(15)%op&
         +0.5*TensorProd(a_opS(2)%mr+TRANSPOSE(a_opS(2)%mr)-eye*(a_opS(1)%mr-TRANSPOSE(a_opS(1)%mr)),a_opS(1)%mr+TRANSPOSE(a_opS(1)%mr)-eye*(a_opS(2)%mr-TRANSPOSE(a_opS(2)%mr)))

   Measures%fermicorr(16)%op=Measures%fermicorr(16)%op+TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)+MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr), MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr)+MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr))

   !Evaluate the given measures
   CALL EvaluateMeasures(Measures, Gammas, Lambdas, H)

   DO i=1,systemSize
      !Add diagonal elements to spdm
      Measures%corr(1)%VALUE(i,i)=Measures%local(2)%VALUE(i)
      Measures%fermicorr(1)%VALUE(i,i)=Measures%local(2)%VALUE(i)
      Measures%corr(2)%VALUE(i,i)=Measures%local(4)%VALUE(i)
      Measures%fermicorr(2)%VALUE(i,i)=Measures%local(4)%VALUE(i)
      Measures%corr(3)%VALUE(i,i)=Measures%local(5)%VALUE(i)
      Measures%fermicorr(3)%VALUE(i,i)=Measures%local(5)%VALUE(i)
      ! 8 -> d1, 9 -> d2, 10 -> d3, 11 -> d4
      Measures%fermicorr(4)%VALUE(i,i)=Measures%local(8)%VALUE(i)
      Measures%fermicorr(5)%VALUE(i,i)=-Measures%local(8)%VALUE(i)
      Measures%fermicorr(6)%VALUE(i,i)=Measures%local(9)%VALUE(i)
      Measures%fermicorr(7)%VALUE(i,i)=-Measures%local(9)%VALUE(i)
      Measures%fermicorr(8)%VALUE(i,i)=Measures%local(10)%VALUE(i)
      Measures%fermicorr(9)%VALUE(i,i)=-Measures%local(10)%VALUE(i)
      Measures%fermicorr(10)%VALUE(i,i)=Measures%local(11)%VALUE(i)
      Measures%fermicorr(11)%VALUE(i,i)=-Measures%local(11)%VALUE(i)
      Measures%fermicorr(12)%VALUE(i,i)=Measures%local(12)%VALUE(i)
      Measures%fermicorr(13)%VALUE(i,i)=-Measures%local(12)%VALUE(i)
      Measures%fermicorr(14)%VALUE(i,i)=Measures%local(13)%VALUE(i)
      Measures%fermicorr(15)%VALUE(i,i)=-Measures%local(13)%VALUE(i)

      Measures%fermicorr(16)%VALUE(i,i)=Measures%local(14)%VALUE(i)
   END DO

   DO i=1,systemSize
      !Form fluctuations from <n^2> and <n>^2
      Measures%local(4)%VALUE(i)=SQRT(Measures%local(14)%VALUE(i)-Measures%local(2)%VALUE(i)**2)
   END DO

   !Create file names
   CALL SetupFH_s2_Name(stub,itpDir)
   CALL appendBaseName(stub,'dd',2,delta)
   CALL appendBaseName(stub,'t0',2,t0)
   CALL appendBaseName(stub,'c0',2,omega0)
   CALL copyName(stub,localName)
   CALL copyName(stub,avgName)
   CALL copyName(stub,CorrName)
   CALL copyName(stub,FermiCorrName)
   CALL copyName(stub,entName)
   CALL appendBaseName(localName,'locm.dat')
   CALL appendBaseName(avgName,'avgm.dat')
   CALL appendBaseName(CorrName,'corf.dat')
   CALL appendBaseName(FermiCorrName,'fermicorf.dat')
   CALL appendBaseName(entName,'ent.dat')

   !Open files
   CALL openunit(localName,170)
   CALL openunit(avgName,171)
   ! CALL openunit(CorrName,172)  
   CALL openunit(FermiCorrName,173)
   CALL openunit(entName,174)

   !Record measures
   CALL myRecordOneSiteOb(170, REAL(Measures%local(1)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(1)%VALUE))
   CALL myRecordOneSiteOb(170, REAL(Measures%local(2)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(2)%VALUE))
   CALL myRecordOneSiteOb(170, REAL(Measures%local(3)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(3)%VALUE))
   CALL myRecordOneSiteOb(170, REAL(Measures%local(4)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(4)%VALUE))
   CALL myRecordOneSiteOb(170, REAL(Measures%local(5)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(5)%VALUE))
   CALL myRecordOneSiteOb(170, REAL(Measures%local(6)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(6)%VALUE))
   CALL myRecordOneSiteOb(170, REAL(Measures%local(7)%VALUE))
   CALL myRecordOneSiteOb(170, AIMAG(Measures%local(7)%VALUE))

   ! CALL myRecordOneSiteOb(170, REAL(Measures%local(8)%VALUE))
   ! CALL myRecordOneSiteOb(170, AIMAG(Measures%local(8)%VALUE))
   ! CALL myRecordOneSiteOb(170, REAL(Measures%local(9)%VALUE))
   ! CALL myRecordOneSiteOb(170, AIMAG(Measures%local(9)%VALUE))
   ! CALL myRecordOneSiteOb(170, REAL(Measures%local(10)%VALUE))
   ! CALL myRecordOneSiteOb(170, AIMAG(Measures%local(10)%VALUE))
   ! CALL myRecordOneSiteOb(170, REAL(Measures%local(11)%VALUE))
   ! CALL myRecordOneSiteOb(170, AIMAG(Measures%local(11)%VALUE))
   ! CALL myRecordOneSiteOb(170, REAL(Measures%local(12)%VALUE))
   ! CALL myRecordOneSiteOb(170, AIMAG(Measures%local(12)%VALUE))
   ! CALL myRecordOneSiteOb(170, REAL(Measures%local(13)%VALUE))
   ! CALL myRecordOneSiteOb(170, AIMAG(Measures%local(13)%VALUE))


   WRITE(171, '(2E30.15e3)') REAL(Measures%avg(1)%VALUE), Measures%avg(2)%VALUE, Measures%en
   ! CALL myRecordTwoSiteOb(172, REAL(Measures%corr(1)%VALUE))
   ! CALL myRecordTwoSiteOb(172, AIMAG(Measures%corr(1)%VALUE))
   ! CALL myRecordTwoSiteOb(172, REAL(Measures%corr(2)%VALUE))
   ! CALL myRecordTwoSiteOb(172, AIMAG(Measures%corr(2)%VALUE))
   ! CALL myRecordTwoSiteOb(172, REAL(Measures%corr(3)%VALUE))
   ! CALL myRecordTwoSiteOb(172, AIMAG(Measures%corr(3)%VALUE))

   CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(1)%VALUE))
   CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(1)%VALUE))
   CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(2)%VALUE))
   CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(2)%VALUE))
   CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(3)%VALUE))
   CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(3)%VALUE))

   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(4)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(4)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(5)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(5)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(6)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(6)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(7)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(7)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(8)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(8)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(9)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(9)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(10)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(10)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(11)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(11)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(12)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(12)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(13)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(13)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(14)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(14)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(15)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(15)%VALUE))
   ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(16)%VALUE))
   ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(16)%VALUE))
   ! ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(17)%VALUE))
   ! ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(17)%VALUE))
   ! ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(18)%VALUE))
   ! ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(18)%VALUE))
   ! ! CALL myRecordTwoSiteOb(173, REAL(Measures%fermicorr(19)%VALUE))
   ! ! CALL myRecordTwoSiteOb(173, AIMAG(Measures%fermicorr(19)%VALUE))

   WRITE(174, '(1E30.15e3)') Measures%ent%qme
   WRITE(174, *)
   WRITE(174, *)
   CALL myRecordOneSiteOb(174, Measures%ent%vn)
   WRITE(174, *)
   WRITE(174, *)
   CALL myRecordOneSiteOb(174, Measures%ent%chain(1:systemSize))
   WRITE(174, *)
   WRITE(174, *)
   WRITE(174, '(1E30.15e3)') Lambdas(systemSize/2)%v

   !Close files
   CLOSE(170)
   CLOSE(171)
   ! CLOSE(172)
   CLOSE(173)
   CLOSE(174)

   !Clean up
   IF(ncswitch) THEN
      CALL DeallocateLabel(LabelLeft, LabelRight)
   END IF

   CALL DeallocateGamLam(Gammas, Lambdas)
   CALL DeallocateMeasures(Measures)

   CALL DestroyFermiSops()
   IF(BoundaryCond=='O') THEN
      CALL DeallocateOps(H,systemSize-1)
   ELSE
      CALL DeallocateOps(H,systemSize)
   END IF

   !End the timing routine
   CALL CPU_TIME(tock)
   PRINT *, 'Fermion ITP Case study exited normally!'
   PRINT *, 'Time taken=',tock-tick,'seconds!'


END PROGRAM Fermion_ITP
