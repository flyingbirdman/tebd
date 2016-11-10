#Makefile for the Fermi Case Study Wrapper
#----------------------------------------------
OFLAGS = -O3 -ffree-line-length-none #Set the optimization flags
LIBFLAGS = -llapack -lblas #Link the LAPACK and BLAS libraries
MC = gfortran #Specify the compiler
server = kyang@intel37.phy.cuhk.edu.hk
#-----------------------------------
#List objects
#-----------------------------------
OBJS = system_parameters.o TEBDtools_module.o io_module.o Hamiltonian_tools_module.o bose_hubbard_module.o fermi_hubbard_module.o heisenberg_module.o spinS_module.o rotation_module.o local_operations_module.o observables_module.o  propagation_module.o 

#-----------------------------------
#Object compilation rules
#-----------------------------------


#Modules	
system_parameters.o : system_parameters.f90
		$(MC) $(OFLAGS) -c system_parameters.f90

TEBDtools_module.o : ../../VidalCore_v_2.0/TEBDtools_module.f90
		$(MC) $(OFLAGS) -c ../../VidalCore_v_2.0/TEBDtools_module.f90

io_module.o : ../../ToolsCore_v_2.0/io_module.f90
		$(MC) $(OFLAGS) -c ../../ToolsCore_v_2.0/io_module.f90

Hamiltonian_tools_module.o : ../../HamiltonianCore_v_2.0/Hamiltonian_tools_module.f90
		$(MC) $(OFLAGS) -c ../../HamiltonianCore_v_2.0/Hamiltonian_tools_module.f90

bose_hubbard_module.o : ../../HamiltonianCore_v_2.0/bose_hubbard_module.f90
		$(MC) $(OFLAGS) -c ../../HamiltonianCore_v_2.0/bose_hubbard_module.f90

fermi_hubbard_module.o : ../../HamiltonianCore_v_2.0/fermi_hubbard_module.f90
		$(MC) $(OFLAGS) -c ../../HamiltonianCore_v_2.0/fermi_hubbard_module.f90

heisenberg_module.o : ../../HamiltonianCore_v_2.0/heisenberg_module.f90
		$(MC) $(OFLAGS) -c ../../HamiltonianCore_v_2.0/heisenberg_module.f90

spinS_module.o : ../../HamiltonianCore_v_2.0/spinS_module.f90
		$(MC) $(OFLAGS) -c ../../HamiltonianCore_v_2.0/spinS_module.f90

rotation_module.o : ../../HamiltonianCore_v_2.0/rotation_module.f90
		$(MC) $(OFLAGS) -c ../../HamiltonianCore_v_2.0/rotation_module.f90

local_operations_module.o : ../../VidalCore_v_2.0/local_operations_module.f90
		$(MC) $(OFLAGS) -c ../../VidalCore_v_2.0/local_operations_module.f90

observables_module.o : ../../VidalCore_v_2.0/observables_module.f90
		$(MC) $(OFLAGS) -c ../../VidalCore_v_2.0/observables_module.f90

propagation_module.o : ../../VidalCore_v_2.0/propagation_module.f90
		$(MC) $(OFLAGS) -c ../../VidalCore_v_2.0/propagation_module.f90

#optial_Modules
fermi_s_hubbard_module.o : ./fermi_s_hubbard_module.f90
		$(MC) $(OFLAGS) -c ./fermi_s_hubbard_module.f90

#Main Programs	
FermionITP.o : FermionITP.f90 
		$(MC) $(OFLAGS) -c FermionITP.f90


#-----------------------------------
#Primary rules
#-----------------------------------

ITP :  $(OBJS) fermi_s_hubbard_module.o FermionITP.o
	$(MC) $(OFLAGS)  -o Execute_ITP fermi_s_hubbard_module.o FermionITP.o $(OBJS) $(LIBFLAGS)

clean: #removes all old *.o and *.mod files
	rm *.o
	rm *.mod
	rm Execute*

touch : #go through all of the *.f90 source files in the Core folders, touching them (updating the timestamp, forcing 'make' to recompile them)
	touch *.f90
	cd ../../VidalCore_v_2.0/
	touch *.f90
	cd ../../ToolsCore_v_2.0/
	touch *.f90
	cd ../../HamiltonianCore_v_2.0/
	touch *.f90

down:
	scp $(server):~/project/tebd/case/fermi/ITPDATA/* ./ITPDATA/
	ssh $(server) "cd ~/project/tebd/case/fermi/ ; cp ITPDATA/* DATA_back/ ; rm ITPDATA/*"

upcode:
	scp *.f90 $(server):~/project/tebd/case/fermi/

upconfig:	
	scp sub/*.qsub $(server):~/project/tebd/case/fermi/sub/
	scp input/*.nml $(server):~/project/tebd/case/fermi/input/

sITP:
	ssh $(server) "cd ~/project/tebd/case/fermi ; make ITP"

sclean:
	ssh $(server) "cd ~/project/tebd/case/fermi ; make clean"

srun:
	ssh $(server) "cd ~/project/tebd/case/fermi ; screen -dmS local sh sub/test.qsub"
	ssh $(server) "cd ~/project/tebd/case/fermi ; screen -dmS local sh sub/test_1.qsub"

n16boost:
	ssh kyang@intel34.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_5.qsub"
	ssh kyang@intel34.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_6.qsub"
	ssh kyang@intel28.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_7.qsub"
	ssh kyang@intel28.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_8.qsub"
	ssh kyang@intel26.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_9.qsub"
	ssh kyang@intel26.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_10.qsub"
	ssh kyang@intel33.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_1.qsub"
	ssh kyang@intel33.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_2.qsub"
	ssh kyang@intel41.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_3.qsub"
	ssh kyang@intel41.phy.cuhk.edu.hk "cd ~/project/tebd/case/fermi ; screen -dmS local sh n16sub/n15boost_4.qsub"

n16upconfig:
	scp n16sub/* $(server):~/project/tebd/case/fermi/n16sub/

n16down1:
	scp $(server):~/project/tebd/case/fermi/ITPDATA/*L16N15* ./n16/
	ssh $(server) "cd ~/project/tebd/case/fermi/ ; cp ITPDATA/*L16N15* n16data/ ; rm ITPDATA/*L16N15* "

n16down2:
	scp $(server):~/project/tebd/case/fermi/ITPDATA/*L16N16*U00.00* ./n16/
	scp $(server):~/project/tebd/case/fermi/ITPDATA/*L16N16*U01.00* ./n16/
	scp $(server):~/project/tebd/case/fermi/ITPDATA/*L16N16*U05.00* ./n16/
#	ssh $(server) "cd ~/project/tebd/case/fermi/ ; cp ITPDATA/*L16N16* n16data/ ; rm ITPDATA/*L16N16* "
