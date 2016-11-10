topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,20'
set cblabel font 'Garamond-Premier-Pro-Italic,16'
set cbtics font ',16'
set xtics font ',14'
set ytics font ',14'
set title font ',18'
set key font ',16'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'scan_ent.pdf'; else outfile=topdf.outfile.'scan_ent.pdf'
if(!exist("yl")) yl=3.0
if(!exist("xl")) xl=6.4
if(!debug) set terminal postscript eps "Helvetica" 12 color solid enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica
if(!debug) set output outfile

set yrange [0:1.0]
set xrange [0:1.5]
set xtics ('0' 0, '1' 1, '1.5' 1.5) offset 0,0
set ytics ('0' 0, '1' 1, '1.5' 1.5) offset 0,0
unset ztics
unset key

set pm3d
set pm3d map
unset surface
set cbrange [1:4]
set cbtics ('1' 1.1, '2' 2, '4' 3.9)
set palette model RGB defined (0.8 'green', 1.2 'green', 1.2 'white', 1.8 'white', 1.8 'red', 2.2 'red', 2.2 'white', 3.8 'white', 3.8 'blue', 4.2 'blue')
#set palette model RGB defined (1 'green', 2 'red', 4 'blue')

set multiplot layout 2,3 scale 1.0, 1.0
file = 'n16_degent.dat'
unset colorbox
set label 'L=16, N=16' at graph 0.55, 0.8 font 'Garamond-Premier-Pro-Italic,20'
set label '(II.a)' at screen 0.15, 0.96 font ', 18'
set label '(II.b)' at screen 0.45, 0.96 font ', 18'
set label '(II.c)' at screen 0.75, 0.96 font ', 18'
set ylabel "t_0" offset 1.0, 0.0 font 'Garamond-Premier-Pro-Italic,20'

set tmargin screen 0.925
set lmargin screen 0.05
set rmargin screen 0.30
set bmargin screen 0.525
plot file index 0 u ($1):($2):3  w p pt 2 lw 2 palette 

unset ylabel
set lmargin screen 0.35
set rmargin screen 0.60
plot file index 1 u ($1):($2):3  w p pt 2 lw 2 palette 

set lmargin screen 0.65
set rmargin screen 0.90
plot file index 2 u ($1):($2):3  w p pt 2 lw 2 palette 

unset label
file = 'n32_degent.dat'
set ylabel "t_0" offset 1.0, 0.0 font 'Garamond-Premier-Pro-Italic,20' 
set xlabel "{/Symbol W}_0" offset 0.0, 1.0
unset title
set label 'L=32, N=32' at graph 0.55, 0.8 font 'Garamond-Premier-Pro-Italic,20' 
unset colorbox
unset lmargin
set tmargin screen 0.475
set lmargin screen 0.05
set rmargin screen 0.30
set bmargin screen 0.075
plot file index 0 u ($1):($2):3  w p pt 2 lw 2 palette 

unset ylabel
set lmargin screen 0.35
set rmargin screen 0.60
plot file index 1 u ($1):($2):3  w p pt 2 lw 2 palette 

set lmargin screen 0.65
set rmargin screen 0.90
set colorbox user origin 0.925,0.2 size 0.015, 0.6
set cblabel "multiplicity of Schmidt eigenvalues" offset 1.0, 0.0
plot file index 2 u ($1):($2):3  w p pt 2 lw 2 palette 

unset multiplot

set output
