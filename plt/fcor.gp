topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font ',18'
set key font ',16'

if(!exist("outfile")) debug=1; else debug=0
if(exist("outfile")) outfile=topdf.outfile.'corf.pdf'
if(!exist("yl")) yl=2.1*2
if(!exist("xl")) xl=2.1*2 #5.6
if(!debug) set terminal postscript eps "Helvetica" 12 color solid enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica
if(!debug) set output outfile

prefix='FH_L'
fn='N'
fu='Chi40U0'
fd='dd'
ft0='t0'
fc0='c0'
postfix='fermicorf.dat'

if(!exist("dir")) dir="./"
if(!exist("L")) print 'pls set L'; exit
if(!exist("N")) print 'pls set N'; exit
if(!exist("U")) print 'pls set U'; exit
if(!exist("t0")) print 'pls set t0'; exit
if(!exist("c0")) print 'pls set c0'; exit
if(!exist("row")) print 'pls set row'; exit
if(!exist("dd")) dd='0.00'
if(!exist("title")) title = 'measure of row '.row

file=dir.prefix.L.fn.N.fu.U.fd.dd.ft0.t0.fc0.c0.postfix

set style line 1 lt 1 lw 3 lc 'blue'
set style line 2 lt 2 lw 3 lc 'red'
set style line 3 lt 3 lw 3 lc 'orange'
set style line 4 lt 4 lw 3 lc 'green'
set style line 5 lt 5 lw 3 lc 'purple'
set style line 6 lt 6 lw 3 lc 'cyan'

set multiplot layout 2,2

set xlabel 'l'
set ylabel 'l'
set pm3d
set pm3d map
set palette model RGB defined ( 0.0 'blue', 1.0 'white', 2.0 'red' )
unset ztics
unset key
set size square
unset surface

r=2*row
set title "(a)"
splot file index r matrix w p

r=2*row+1
set title "(b)"
splot file index r matrix w p

set title "(c)"
unset pm3d
r=2*row
if(!debug){
	set key title '{/Garamond-Premier-Pro-Italic j_2-j_1}' 
	set ylabel "Re(".title.")"
}
plot file index r matrix u ($1):($2==($1)?$3:1/0) w p ls 1 t '0', file index r matrix u ($1):($2==($1+1)?$3:1/0) w p ls 2 t '1', file index r matrix u ($1):($2==($1+2)?$3:1/0) w p ls 3 t '2', file index r matrix u ($1):($2==($1+3)?$3:1/0) w p ls 4 t '3'

set title "(d)"
r=2*row+1
if(!debug){
	set ylabel "Im(".title.")"
}
plot file index r matrix u ($1):($2==($1)?$3:1/0) w  p ls 1 t '0', file index r matrix u ($1):($2==($1+1)?$3:1/0) w  p ls 2 t '1', file index r matrix u ($1):($2==($1+2)?$3:1/0) w  p ls 3 t '2', file index r matrix u ($1):($2==($1+3)?$3:1/0) w  p ls 4 t '3'

unset multiplot

if(debug) pause -1

if(!debug) set output
