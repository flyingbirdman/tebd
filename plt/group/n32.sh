#!/bin/bash

##############################

gnuplot -e "L=32; prefix='../../density/FH_L32N'; fix='Chi40U05.00dd0.00t00.00c0'; postfix1='locm.dat'; postfix2='fermicorf_bz.dat'; var='0.00 0.50 1.50'; numvar=3; outfile='./plt/c0_L32U5'; titlelabel='(c)';" c0_nf.gp  
gnuplot -e "L=32; prefix='../../density/FH_L32N'; fix='Chi40U05.00dd0.00t0'; postfix1='c00.00locm.dat'; postfix2='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50'; numvar=3; outfile='./plt/t0_L32U5'; titlelabel='(c)';" t0_nf.gp 


gnuplot -e "L=32; prefix='../../density/FH_L32N'; fix='Chi40U00.00dd0.00t00.00c0'; postfix1='locm.dat'; postfix2='fermicorf_bz.dat'; var='0.00 0.50 1.50'; numvar=3; outfile='./plt/c0_L32U0'; titlelabel='(a)';" c0_nf.gp  
gnuplot -e "L=32; prefix='../../density/FH_L32N'; fix='Chi40U00.00dd0.00t0'; postfix1='c00.00locm.dat'; postfix2='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50'; numvar=3; outfile='./plt/t0_L32U0'; titlelabel='(a)';" t0_nf.gp 

gnuplot -e "L=32; prefix='../../density/FH_L32N'; fix='Chi40U01.00dd0.00t00.00c0'; postfix1='locm.dat'; postfix2='fermicorf_bz.dat'; var='0.00 0.50 1.50'; numvar=3; outfile='./plt/c0_L32U1'; titlelabel='(b)';" c0_nf.gp  
gnuplot -e "L=32; prefix='../../density/FH_L32N'; fix='Chi40U01.00dd0.00t0'; postfix1='c00.00locm.dat'; postfix2='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50'; numvar=3; outfile='./plt/t0_L32U1'; titlelabel='(b)';" t0_nf.gp 
