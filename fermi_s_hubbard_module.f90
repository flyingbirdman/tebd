MODULE fermi_s_hubbard_module
   !
   ! Purpose: Module to construct spin-S Fermi-Hubbard (BH) model operators/Hamiltonian
   !for more general case
   !
   ! Record of Revisions
   !	Date	Programmer	Description of change
   !	====	==========	=====================
   !   13/8/15   Yang Kai	v2.0 release
   !
   USE system_parameters
   USE TEBDtools_module
   USE io_module
   USE Hamiltonian_tools_module

   IMPLICIT NONE

   INTERFACE myRecordOneSiteOb    
      MODULE PROCEDURE myRecordOneSiteOb_r,myRecordOneSiteOb_c
   END INTERFACE myRecordOneSiteOb

   INTERFACE myRecordTwoSiteOb
      MODULE PROCEDURE myRecordTwoSiteOb_r,myRecordTwoSiteOb_c
   END INTERFACE myRecordTwoSiteOb

   REAL(KIND=rKind) :: t0 !Tunneling energy 1
   REAL(KIND=rKind) :: t1 !Tunneling energy 2
   REAL(KIND=rKind) :: omega0   !on-site spin coupling
   REAL(KIND=rKind) :: omega1   !Tunneling between different spin
   REAL(KIND=rKind) :: delta    !detuning energy
   TYPE(matrix) :: fttot_opS !fermi Tunneling operator

CONTAINS
   SUBROUTINE CreateOptionalOps()
      ALLOCATE(fttot_opS%m(localSize*localSize, localSize*localSize), STAT=statInt)
      IF(statInt.NE.0) THEN
         PRINT *, 'Failed to allocate one for FermiSops'
      END IF
   END SUBROUTINE CreateOptionalOps

   SUBROUTINE fermi_s2_Hamiltonian(H ,t0, t1, omega0, omega1, delta, U0, mu0,V0, extPot)
      !
      !Purpose: Create TEBD form of Hubbard model.
      !
      IMPLICIT NONE
      TYPE(matrix), POINTER :: H(:)
      REAL(KIND=rKind), INTENT(IN) :: mu0, U0, t0, t1, omega0, omega1, delta
      REAL(KIND=rKind), INTENT(IN), OPTIONAL :: extPot(:), V0
      INTEGER :: i,k 

      IF(BoundaryCond=='P') THEN
         STOP "Periodic Boundary conditions not supported for Fermionic systems!"
      END IF

      IF(ABS(spin-0.5_rKind).GT.0.01_rKind) THEN
         STOP 'Warning! Only for spin-1/2 system'
      END IF
      
      fttot_opS%m=0.0
      fttot_opS%m=fttot_opS%m&
            +(0.5_rKind*CMPLX(t0,-t1))*MATMUL(TRANSPOSE(TensorProd(a_opS(1)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(1)%mr))&
            +(0.5_rKind*CMPLX(t0,t1))*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(1)%mr)),TensorProd(a_opS(1)%mr,one_op%mr))&
            +(0.5_rKind*CMPLX(t0,t1))*MATMUL(TRANSPOSE(TensorProd(a_opS(2)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(2)%mr))&
            +(0.5_rKind*CMPLX(t0,-t1))*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(2)%mr)),TensorProd(a_opS(2)%mr,one_op%mr))& 
            +(0.5_rKind*omega1)*MATMUL(TRANSPOSE(TensorProd(a_opS(1)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(2)%mr))&
            +(0.5_rKind*omega1)*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(2)%mr)),TensorProd(a_opS(1)%mr,one_op%mr))&
            +(0.5_rKind*omega1)*MATMUL(TRANSPOSE(TensorProd(a_opS(2)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(1)%mr))&
            +(0.5_rKind*omega1)*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(1)%mr)),TensorProd(a_opS(2)%mr,one_op%mr))

      !Spin-independent part of Hamiltonian
      DO i = 1, (systemSize-1)
         H(i)%m = (-0.5_rKind*mu0)*TensorProd(ntot_opS%mr,one_op%mr)&
               +(-0.5_rKind*mu0)*TensorProd(one_op%mr,ntot_opS%mr)&
               +(0.5_rKind*delta)*TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr),one_op%mr)&
               +(0.5_rKind*delta)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr))&
               +(-0.5_rKind*delta)*TensorProd(MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr),one_op%mr)&
               +(-0.5_rKind*delta)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr))&
               +(0.5_rKind*omega0)*TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(2)%mr),one_op%mr)&
               +(0.5_rKind*omega0)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(2)%mr))&
               +(0.5_rKind*omega0)*TensorProd(MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(1)%mr),one_op%mr)&
               +(0.5_rKind*omega0)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(1)%mr))&
               +fttot_opS%m&
               +(-0.5_rKind*U0)*TensorProd(MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr), a_opS(1)%mr),MATMUL(TRANSPOSE(a_opS(2)%mr), a_opS(2)%mr)),one_op%mr)&
               +(-0.5_rKind*U0)*TensorProd(one_op%mr,MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr), a_opS(1)%mr),MATMUL(TRANSPOSE(a_opS(2)%mr), a_opS(2)%mr)))
      END DO

      H(1)%m= H(1)%m+(-0.5_rKind*mu0)*TensorProd(ntot_opS%mr,one_op%mr)&               
            +(0.5_rKind*delta)*TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr),one_op%mr)&
            +(-0.5_rKind*delta)*TensorProd(MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr),one_op%mr)&
            +(0.5_rKind*omega0)*TensorProd(MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(2)%mr),one_op%mr)&
            +(0.5_rKind*omega0)*TensorProd(MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(1)%mr),one_op%mr)&
            +(-0.5_rKind*U0)*TensorProd(MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr), a_opS(1)%mr),MATMUL(TRANSPOSE(a_opS(2)%mr), a_opS(2)%mr)),one_op%mr)! &
            ! +(0.5_rKind*CMPLX(t0,-t1))*MATMUL(TRANSPOSE(TensorProd(a_opS(1)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(1)%mr))&           
            ! +(0.5_rKind*CMPLX(t0,t1))*MATMUL(TRANSPOSE(TensorProd(a_opS(2)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(2)%mr))&            
            ! +(0.5_rKind*omega1)*MATMUL(TRANSPOSE(TensorProd(a_opS(1)%mr,one_op%mr)),TensorProd(fermiPhase_op%mr,a_opS(2)%mr))
      
      H(systemSize-1)%m= H(systemSize-1)%m+(-0.5_rKind*mu0)*TensorProd(one_op%mr,ntot_opS%mr)&
            +(0.5_rKind*delta)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(1)%mr))&
            +(-0.5_rKind*delta)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(2)%mr))&
            +(0.5_rKind*omega0)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(1)%mr),a_opS(2)%mr))&
            +(0.5_rKind*omega0)*TensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(2)%mr),a_opS(1)%mr))&
            +(-0.5_rKind*U0)*TensorProd(one_op%mr,MATMUL(MATMUL(TRANSPOSE(a_opS(1)%mr), a_opS(1)%mr),MATMUL(TRANSPOSE(a_opS(2)%mr), a_opS(2)%mr)))! &            
            ! +(0.5_rKind*CMPLX(t0,t1))*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(1)%mr)),TensorProd(a_opS(1)%mr,one_op%mr))&
            ! +(0.5_rKind*CMPLX(t0,-t1))*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(2)%mr)),TensorProd(a_opS(2)%mr,one_op%mr))& 
            ! +(0.5_rKind*omega1)*MATMUL(TRANSPOSE(TensorProd(fermiPhase_op%mr,a_opS(2)%mr)),TensorProd(a_opS(1)%mr,one_op%mr))      

      IF(PRESENT(extPot)) THEN
         DO k=1,spinSize
            DO i=1,(systemSize-1)
               H(i)%m=H(i)%m+0.5_rKind*extPot(i)*tensorProd(MATMUL(TRANSPOSE(a_opS(k)%mr),a_opS(k)%mr),one_op%mr)+0.5_rKind*extPot(i+1)*tensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(k)%mr),a_opS(k)%mr))
            END DO
            H(systemSize-1)%m=H(systemSize-1)%m+0.5_rKind*extPot(systemSize)*tensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(k)%mr),a_opS(k)%mr))
            H(1)%m=H(1)%m+0.5_rKind*extPot(1)*tensorProd(one_op%mr,MATMUL(TRANSPOSE(a_opS(k)%mr),a_opS(k)%mr))
         END DO
      END IF

      IF(PRESENT(V0)) THEN
         DO k=1,spinSize
            DO i=1,(systemSize-1)
               H(i)%m=H(i)%m+V0*tensorProd(MATMUL(TRANSPOSE(a_opS(k)%mr),a_opS(k)%mr),MATMUL(TRANSPOSE(a_opS(k)%mr),a_opS(k)%mr))
            END DO
         END DO
      END IF

   END SUBROUTINE fermi_s2_Hamiltonian

   SUBROUTINE SetupFH_S2_Name(baseName,diRectory)
      !
      !Purpose: Begin a file name in the directory diRectory that contains all Fermi Hubbard parameters
      !
      IMPLICIT NONE
      CHARACTER(len=*), INTENT(INOUT) :: baseName
      CHARACTER(len=*), INTENT(IN) :: diRectory

      CALL createFileName(baseName,diRectory)
      CALL appendBaseName(baseName,'FH_')
      CALL appendBaseName(baseName,'L',systemSize)
      IF(ncswitch) THEN
         CALL appendBaseName(baseName,'N',totNum)
      ELSE
         CALL appendBaseName(baseName,'mu',2,mu0)
      END IF
      CALL appendBaseName(baseName,'Chi',chiMax)
      CALL appendBaseName(baseName,'U0',2,U0)
      IF(V0.NE.0.0) THEN
         CALL appendBaseName(baseName,'V0',2,V0)
      END IF
      IF(ALLOCATED(extPot)) THEN
         CALL appendBaseName(baseName,'extPot')
      END IF

   END SUBROUTINE SetupFH_S2_Name


!!!!!!!!!!!!!BEGIN INTERFACE myRecordOneSiteOb!!!!!!!!!!!!!!!!!!!!!
  SUBROUTINE myRecordOneSiteOb_r(fileid, Obs, timeN)
    !
    !Purpose: Record a matrix operator List on a file whose ID is fileid.	
    !
    IMPLICIT NONE
    REAL(KIND=rKind) :: Obs(systemSize)
    REAL(KIND=rKind), OPTIONAL :: timeN
    INTEGER, INTENT(IN) :: fileid
    INTEGER :: j,dd
    CHARACTER(4) :: mString
    CHARACTER(64) :: fmtName

    dd=systemSize
    IF(PRESENT(timeN)) THEN
       WRITE(mString,'(I4)') dd+1
       fmtName='('//TRIM(ADJUSTL(mString))//'E30.15e3)'

       WRITE(UNIT=fileid, FMT=fmtName) timeN, (Obs(j), j=1,dd)
    ELSE
       WRITE(mString,'(I4)') dd
       fmtName='('//TRIM(ADJUSTL(mString))//'E30.15e3)'

       WRITE(UNIT=fileid, FMT=fmtName) (Obs(j), j=1,dd)
    END IF

  END SUBROUTINE myRecordOneSiteOb_r

  SUBROUTINE myRecordOneSiteOb_c(fileid, Obs, timeN)
    !
    !Purpose: Record a matrix operator List on a file whose ID is fileid.	
    !
    IMPLICIT NONE
    COMPLEX(KIND=rKind) :: Obs(systemSize)
    REAL(KIND=rKind), OPTIONAL :: timeN
    INTEGER, INTENT(IN) :: fileid
    INTEGER :: j,dd
    CHARACTER(4) :: mString
    CHARACTER(64) :: fmtName

    dd=systemSize
    IF(PRESENT(timeN)) THEN
       WRITE(mString,'(I4)') 2*dd+1
       fmtName='('//TRIM(ADJUSTL(mString))//'E30.15e3)'

       WRITE(UNIT=fileid, FMT=fmtName) timeN, (REAL(Obs(j)), j=1,dd), (AIMAG(Obs(j)), j=1,dd)
    ELSE
       WRITE(mString,'(I4)') 2*dd
       fmtName='('//TRIM(ADJUSTL(mString))//'E30.15e3)'

       WRITE(UNIT=fileid, FMT=fmtName) (REAL(Obs(j)), j=1,dd), (AIMAG(Obs(j)), j=1,dd)
    END IF

  END SUBROUTINE myRecordOneSiteOb_c

!!!!!!!!!!!!!END INTERFACE myRecordOneSiteOb!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!BEGIN INTERFACE myRecordTwoSiteOb!!!!!!!!!!!!!!!!!!!!!

  SUBROUTINE myRecordTwoSiteOb_r(fileid, Obs)
    !
    !Purpose: Record a matrix operator List on a file whose ID is fileid.	
    !
    IMPLICIT NONE
    REAL(KIND=rKind) :: Obs(systemSize,systemSize)
    INTEGER, INTENT(IN) :: fileid
    INTEGER :: j,k,dd
    CHARACTER(4) :: mString
    CHARACTER(64) :: fmtName

    dd=systemSize
    WRITE(mString,'(I4)') dd
    fmtName='('//TRIM(ADJUSTL(mString))//'E30.15e3)'

    DO k=1,systemSize
       WRITE(UNIT=fileid, FMT=fmtName) (Obs(k,j), j=1,dd)
    END DO
    WRITE(fileid, *) 
    WRITE(fileid, *) 
  END SUBROUTINE myRecordTwoSiteOb_r

  SUBROUTINE myRecordTwoSiteOb_c(fileid, Obs)
    !
    !Purpose: Record a matrix operator List on a file whose ID is fileid.	
    !
    IMPLICIT NONE
    COMPLEX(KIND=rKind) :: Obs(systemSize,systemSize)
    INTEGER, INTENT(IN) :: fileid
    INTEGER :: j,k,dd
    CHARACTER(4) :: mString
    CHARACTER(64) :: fmtName

    dd=systemSize
    WRITE(mString,'(I4)') 2*dd
    fmtName='('//TRIM(ADJUSTL(mString))//'E30.15e3)'

    DO k=1,systemSize	
       WRITE(UNIT=fileid, FMT=fmtName) (REAL(Obs(k,j)), j=1,dd), (AIMAG(Obs(k,j)), j=1,dd)
    END DO
    WRITE(fileid, *)
    WRITE(fileid, *)
  END SUBROUTINE myRecordTwoSiteOb_c

END MODULE fermi_s_hubbard_module
