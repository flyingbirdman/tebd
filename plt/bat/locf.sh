#!/bin/bash

gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N35Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N35U04d00t00c00'" locf_n.gp 
gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N35Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N35U04d00t00c00'" locf_s.gp
gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N35Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N35U04d00t00c00'" locf_mf.gp

gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N36Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N36U04d00t00c00'" locf_n.gp 
gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N36Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N36U04d00t00c00'" locf_s.gp
gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N36Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N36U04d00t00c00'" locf_mf.gp 

gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N37Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N37U04d00t00c00'" locf_n.gp 
gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N37Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N37U04d00t00c00'" locf_s.gp
gnuplot -e "L=36; locfile='../ITPDATA/FH_L36N37Chi40U04.00dd0.00t00.00c00.00locm.dat'; outfile='./fig/L36N37U04d00t00c00'" locf_mf.gp 

