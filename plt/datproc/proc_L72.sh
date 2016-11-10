#!/bin/bash

for val in $(ls ../n72/FH_L72*fermicorf.dat) 
do 
    ./datproc/out -L 72 -M 16 -in $val 
done
