#!/bin/bash

# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50locm.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'" locf_n.gp 
# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50locm.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'" locf_s.gp
# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50locm.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'" locf_mf.gp 

# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50fermicorf_bz.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'" fcor_n.gp 
# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50fermicorf_bz.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'"  fcor_mf0.gp
# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50fermicorf_bz.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'"  fcor_mf1.gp
# gnuplot -e "L=72; locfile='../n8/FH_L8N8Chi40U00.50dd0.00t00.00c00.50fermicorf_bz.dat'; outfile='./n8/L8N8U00.50d00t00c00.50'"  fcor_mf2.gp


gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_mf0.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_mf1.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_mf2.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_mf0_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_mf1_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" fcor_mf2_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" locf_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" locf_s.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N72U00d00t00c00'" locf_mf.gp 

########################

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_mf0.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_mf1.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_mf2.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_mf0_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_mf1_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00fermicorf_bz.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" fcor_mf2_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" locf_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" locf_s.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U0'; postfix='dd0.00t00.00c00.00locm.dat'; var='0.50 2.00 8.00 '; numvar=3; outfile='./n72/u0_L72N73U00d00t00c00'" locf_mf.gp 

 ##########################

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50 '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_mf0.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_mf1.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_mf2.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_mf0_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_mf1_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" fcor_mf2_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" locf_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" locf_s.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N72U00.50d00t00c00'" locf_mf.gp 

 ##########################

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_mf0.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_mf1.gp

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_mf2.gp  

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_mf0_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_mf1_i.gp

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" fcor_mf2_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" locf_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" locf_s.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t00.00c0'; postfix='locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/c0_L72N73U00.50d00t00c00'" locf_mf.gp 

 ##########################
gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_mf0.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_mf1.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_mf2.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_mf0_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_mf1_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" fcor_mf2_i.gp

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" locf_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" locf_s.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N72Chi40U00.50dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N72U00.50d00t00c00'" locf_mf.gp 

#########################

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_mf0.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_mf1.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_mf2.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_mf0_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_mf1_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00fermicorf_bz.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" fcor_mf2_i.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" locf_n.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" locf_s.gp 

gnuplot -e "L=72; prefix='../n72/FH_L72N73Chi40U00.50dd0.00t0'; postfix='c00.00locm.dat'; var='0.00 0.50  1.50  '; numvar=3; outfile='./n72/t0_L72N73U00.50d00t00c00'" locf_mf.gp 

