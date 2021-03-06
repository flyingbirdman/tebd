topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font 'Helvetica-Bold,18'
set key font ',14'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'loop_ent.pdf'; else outfile=topdf.outfile.'loop_ent.pdf'
if(!exist("yl")) yl=3.2
if(!exist("xl")) xl=6.4
if(!debug) set terminal postscript eps "Helvetica" 12 color solid dl 1.5 enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica
if(!debug) set output outfile


set termoption dashed
set tmargin 3.5
set style line 1 lt 1 lw 3 lc 'black'
set style line 2 lt 2 lw 3 lc 'red'
set style line 3 lt 1 lw 3 lc 'blue'
set style line 4 lt 4 lw 3 lc 'green'
set style line 5 lt 5 lw 3 lc 'purple'
set style line 6 lt 6 lw 3 lc 'cyan'

set multiplot layout 2,3

set grid xtics lt 3 lw 2 lc 'gray'
set format x ""
unset xlabel
set logscale y
set ylabel '{/Symbol x}_i' offset 2.5, 0
set xtics ('{/Symbol G}' 0, 'X_1' 1.0, 'X' 1.5, 'M' 3.0, 'M_1' 3.70710678119, '{/Symbol G}' 5.12132034356, 'Y_1' 6.12132034356, 'Y' 6.62132034356, 'M' 8.12132034356)
set key left top

f32_1 = 'L32N31U00ent.dat'
f32_2 = 'L32N31U01ent.dat'
f32_3 = 'L32N31U05ent.dat'

f16_1 = 'L16N15U00ent.dat'
f16_2 = 'L16N15U01ent.dat'
f16_3 = 'L16N15U05ent.dat'

set style line 11 lc rgb '#1F78B4' lt 1 lw 3 # dark blu
set arrow from graph 0.675,0.615 to graph 0.925,0.615 nohead ls 11
set arrow from graph 0.925,0.615 to graph 0.925,0.925 nohead ls 11
set arrow from graph 0.925,0.925 to graph 0.675,0.925 nohead ls 11
set arrow from graph 0.675,0.925 to graph 0.675,0.615 nohead ls 11
set arrow from graph 0.675,0.615 to graph 0.925,0.925 nohead ls 11
set arrow from graph 0.841,0.615 to graph 0.841,0.640 nohead ls 11
set arrow from graph 0.675,0.822 to graph 0.700,0.822 nohead ls 11
set arrow from graph 0.828,0.835 to graph 0.854,0.801 nohead ls 11

set label '0' at graph 0.620, 0.590 tc rgb "blue"
set label '1' at graph 0.830, 0.580 tc rgb "blue"
set label '1.5' at graph 0.900, 0.580 tc rgb "blue"
set label '1' at graph 0.618, 0.822 tc rgb "blue"
set label '1.5' at graph 0.600, 0.925 tc rgb "blue"

set label '{/Symbol G}' at graph 0.687, 0.570 tc rgb "blue"
set label 'X_1' at graph 0.830, 0.510 tc rgb "blue"
set label 'X' at graph 0.900, 0.510 tc rgb "blue"
set label 'Y_1' at graph 0.550, 0.822 tc rgb "blue"
set label 'Y' at graph 0.550, 0.925 tc rgb "blue"
set label 'M' at graph 0.945, 0.915 tc rgb "blue"
set label 'M_1' at graph 0.854, 0.755 tc rgb "blue"

set title '(I.a)' 
plot f16_1 u 1:(-2* log($4)) w l ls 2 t 'L=16,N=15', \
     '' u 1:(-2* log($5)) w l ls 2 notitle, \
     '' u 1:(-2* log($6)) w l ls 2 notitle, \
     '' u 1:(-2* log($7)) w l ls 2 notitle, \
     f32_1 u 1:(-2* log($4)) w l ls 1 t 'L=32,N=31', \
     '' u 1:(-2* log($5)) w l ls 1 notitle, \
     '' u 1:(-2* log($6)) w l ls 1 notitle, \
     '' u 1:(-2* log($7)) w l ls 1 notitle, \

unset arrow
unset label

set title '(I.b)'
plot f16_2 u 1:(-2* log($4)) w l ls 2 t 'L=16,N=15', \
     '' u 1:(-2* log($5)) w l ls 2 notitle, \
     '' u 1:(-2* log($6)) w l ls 2 notitle, \
     '' u 1:(-2* log($7)) w l ls 2 notitle, \
     f32_2 u 1:(-2* log($4)) w l ls 1 t 'L=32,N=31', \
     '' u 1:(-2* log($5)) w l ls 1 notitle, \
     '' u 1:(-2* log($6)) w l ls 1 notitle, \
     '' u 1:(-2* log($7)) w l ls 1 notitle, \

set title '(I.c)'
plot f16_3 u 1:(-2* log($4)) w l ls 2 t 'L=16,N=15', \
     '' u 1:(-2* log($5)) w l ls 2 notitle, \
     '' u 1:(-2* log($6)) w l ls 2 notitle, \
     '' u 1:(-2* log($7)) w l ls 2 notitle, \
     f32_3 u 1:(-2* log($4)) w l ls 1 t 'L=32,N=31', \
     '' u 1:(-2* log($5)) w l ls 1 notitle, \
     '' u 1:(-2* log($6)) w l ls 1 notitle, \
     '' u 1:(-2* log($7)) w l ls 1 notitle, \

f16_1 = 'L16N16U00ent.dat'
f16_2 = 'L16N16U01ent.dat'
f16_3 = 'L16N16U05ent.dat'

f32_1 = 'L32N32U00ent.dat'
f32_2 = 'L32N32U01ent.dat'
f32_3 = 'L32N32U05ent.dat'


set title '(II.a)'
plot f16_1 u 1:(-2* log($4)) w l ls 2 t 'L=16,N=16', \
     '' u 1:(-2* log($5)) w l ls 2 notitle, \
     '' u 1:(-2* log($6)) w l ls 2 notitle, \
     '' u 1:(-2* log($7)) w l ls 2 notitle, \
     '' u 1:(-2* log($8)) w l ls 2 notitle, \
     '' u 1:(-2* log($9)) w l ls 2 notitle, \
     '' u 1:(-2* log($10)) w l ls 2 notitle, \
     '' u 1:(-2* log($11)) w l ls 2 notitle, \
     f32_1 u 1:(-2* log($4)) w l ls 1 t 'L=32,N=32', \
     '' u 1:(-2* log($5)) w l ls 1 notitle, \
     '' u 1:(-2* log($6)) w l ls 1 notitle, \
     '' u 1:(-2* log($7)) w l ls 1 notitle, \
     '' u 1:(-2* log($8)) w l ls 1 notitle, \
     '' u 1:(-2* log($9)) w l ls 1 notitle, \
     '' u 1:(-2* log($10)) w l ls 1 notitle, \
     '' u 1:(-2* log($11)) w l ls 1 notitle, \

set title '(II.b)'
plot f16_2 u 1:(-2* log($4)) w l ls 2 t 'L=16,N=16', \
     '' u 1:(-2* log($5)) w l ls 2 notitle, \
     '' u 1:(-2* log($6)) w l ls 2 notitle, \
     '' u 1:(-2* log($7)) w l ls 2 notitle, \
     '' u 1:(-2* log($8)) w l ls 2 notitle, \
     '' u 1:(-2* log($9)) w l ls 2 notitle, \
     '' u 1:(-2* log($10)) w l ls 2 notitle, \
     '' u 1:(-2* log($11)) w l ls 2 notitle, \
     f32_2 u 1:(-2* log($4)) w l ls 1 t 'L=32,N=32', \
     '' u 1:(-2* log($5)) w l ls 1 notitle, \
     '' u 1:(-2* log($6)) w l ls 1 notitle, \
     '' u 1:(-2* log($7)) w l ls 1 notitle, \
     '' u 1:(-2* log($8)) w l ls 1 notitle, \
     '' u 1:(-2* log($9)) w l ls 1 notitle, \
     '' u 1:(-2* log($10)) w l ls 1 notitle, \
     '' u 1:(-2* log($11)) w l ls 1 notitle, \

set title '(II.c)'
plot f16_3 u 1:(-2* log($4)) w l ls 2 t 'L=16,N=16', \
     '' u 1:(-2* log($5)) w l ls 2 notitle, \
     '' u 1:(-2* log($6)) w l ls 2 notitle, \
     '' u 1:(-2* log($7)) w l ls 2 notitle, \
     '' u 1:(-2* log($8)) w l ls 2 notitle, \
     '' u 1:(-2* log($9)) w l ls 2 notitle, \
     '' u 1:(-2* log($10)) w l ls 2 notitle, \
     '' u 1:(-2* log($11)) w l ls 2 notitle, \
     f32_3 u 1:(-2* log($4)) w l ls 1 t 'L=32,N=32', \
     '' u 1:(-2* log($5)) w l ls 1 notitle, \
     '' u 1:(-2* log($6)) w l ls 1 notitle, \
     '' u 1:(-2* log($7)) w l ls 1 notitle, \
     '' u 1:(-2* log($8)) w l ls 1 notitle, \
     '' u 1:(-2* log($9)) w l ls 1 notitle, \
     '' u 1:(-2* log($10)) w l ls 1 notitle, \
     '' u 1:(-2* log($11)) w l ls 1 notitle, \

unset multiplot
if(debug) pause -1
if(!debug) set output
