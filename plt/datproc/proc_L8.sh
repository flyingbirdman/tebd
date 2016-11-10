#!/bin/bash

for val in $(ls ../n8/FH_L8*fermicorf.dat) 
do 
    ./datproc/out -L 8 -M 16 -in $val 
done
