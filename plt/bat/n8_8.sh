#!/bin/bash

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf0_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf1_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" fcor_mf2_i.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.20 1.00 5.00 '; numvar=3; outfile='./n8/u0_L8N8U00d00t00c00'" locf_mf.gp 
 ##########################

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix=''; var='0.00 0.10 0.50 1.50 '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf0_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf1_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" fcor_mf2_i.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.20d00t00c00'" locf_mf.gp 

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf0_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf1_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" fcor_mf2_i.gp
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.20dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.20d00t00c00'" locf_mf.gp 

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix=''; var='0.00 0.10 0.50 1.50 '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf_i.gp 
# gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf0_i.gp 
# gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf1_i.gp 
# gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" fcor_mf2_i.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U01.00d00t00c00'" locf_mf.gp 

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf_i.gp 
# gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf0_i.gp 
# gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf1_i.gp 
# gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" fcor_mf2_i.gp
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U01.00dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U01.00d00t00c00'" locf_mf.gp 

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix=''; var='0.00 0.10 0.50 1.50 '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf0_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf1_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" fcor_mf2_i.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.10 0.50 1.50  '; numvar=4; outfile='./n8/c0_L8N8U00.00d00t00c00'" locf_mf.gp 

gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf0.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf1.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf2.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf0_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf1_i.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" fcor_mf2_i.gp
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" locf_n.gp 
#gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" locf_s.gp 
gnuplot -e "L=8; prefix='../n8/FH_L8N8Chi40U00.00dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50 1.50  '; numvar=3; outfile='./n8/t0_L8N8U00.00d00t00c00'" locf_mf.gp 

