# Makefile for the fourier transformation of the fermicorr

.PHONY: clean
clean:
	-rm *~ 
	-rm ./datproc/*~
	-rm ./bat/*~

L36: 
	echo 'gen fourtm of the fermion corr in BZ'
	-sh ./datproc/proc_L36.sh
	-sh ./bat/n36_34.sh
	-sh ./bat/n36_35.sh
	-sh ./bat/n36_36.sh
	-sh ./bat/n36_37.sh
	-sh ./bat/n36_38.sh

L8: 
	echo 'gen fourtm of the fermion corr in BZ'
	-sh ./datproc/proc_L8.sh
	-sh ./bat/n8_6.sh
	-sh ./bat/n8_7.sh
	-sh ./bat/n8_8.sh
	-sh ./bat/n8_9.sh
	-sh ./bat/n8_10.sh

L72: 
	echo 'gen fourtm of the fermion corr in BZ'
	-sh ./datproc/proc_L72.sh
	-sh ./bat/n72.sh

out: ./datproc/corr.cpp
	echo 'gen execute file'
	g++ -o ./datproc/out ./datproc/corr.cpp

null: 
	echo 'plt the fig of null case'
	sh ./bat/locf.sh
	sh ./bat/fcor.sh

t1:
	echo 'plt the case: t1 != c1'
	-sh ./bat/t1.sh
	-sh ./bat/t1_1.sh

u0:
	echo 'plt the dependence of U0'
	sh ./bat/u0.sh

t0: 
	echo 'plt the dependence of t0'
	sh ./bat/t0.sh

c0: 
	echo 'plt the dependence of c0'
	sh ./bat/c0.sh

test:
	echo 'plt the limit case: U0=0'
	-sh ./bat/limit0.sh
	-sh ./bat/limit_t0.sh
	-sh ./bat/limit_c0.sh
	-sh ./bat/limit1.sh

