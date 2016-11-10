#!/bin/bash

for val in $(ls ../n36/FH_L36*fermicorf.dat) 
do 
    ./datproc/out -L 36 -M 16 -in $val 
done
