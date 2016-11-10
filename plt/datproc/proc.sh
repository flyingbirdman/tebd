#!/bin/bash

for val in $(ls ../density/FH_L8*fermicorf.dat) 
do 
    ./datproc/out -L 8 -M 3 -in $val 
done

for val in $(ls ../density/FH_L16*fermicorf.dat) 
do 
    ./datproc/out -L 16 -M 3 -in $val 
done

for val in $(ls ../density/FH_L32*fermicorf.dat) 
do 
    ./datproc/out -L 32 -M 3 -in $val 
done

for val in $(ls ../density/FH_L64*fermicorf.dat) 
do 
    ./datproc/out -L 64 -M 3 -in $val 
done