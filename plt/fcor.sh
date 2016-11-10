#!/bin/bash

gnuplot -e "dir='../n8/'; L=8; N=7; U='1.00'; t0='0.00'; c0='0.50'; row=0; title= '<c@^{/Helvetica \262}_{j_1{/Symbol \255}}c@^{/Helvetica \262}_{j_1{/Symbol \257}}c_{j_2{/Symbol \257}}c_{j_2{/Symbol \255}}>'; " fcor.gp 
