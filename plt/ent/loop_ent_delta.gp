topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font 'Helvetica-Bold,18'
set key font ',14'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'loop_ent_delta_ppt.pdf'; else outfile=topdf.outfile.'loop_ent_delta_ppt.pdf'
if(!exist("yl")) yl=1.6
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

set multiplot layout 1,3

set grid xtics lt 3 lw 2 lc 'gray'
set format x ""
unset xlabel
#set logscale y
set ylabel '{/Symbol x}_i' offset 1, 0
set xtics ('{/Symbol G}' 0, 'X_1' 1.0, 'X' 1.5, 'M' 3.0, 'M_1' 3.70710678119, '{/Symbol G}' 5.12132034356, 'Y_1' 6.12132034356, 'Y' 6.62132034356, 'M' 8.12132034356)
set key top left

f32_1 = 'L32N32U00dd0.25ent.dat'
f32_2 = 'L32N32U01dd0.25ent.dat'
f32_3 = 'L32N32U05dd0.25ent.dat'
f32_10 = 'L32N32U00ent.dat'
f32_20 = 'L32N32U01ent.dat'
f32_30 = 'L32N32U05ent.dat'

#dy=0.465
#dx=0.20
dy=0
dx=0.1
set style line 11 lc rgb '#1F78B4' lt 1 lw 3 # dark blu
set arrow from graph 0.675-dx,0.615-dy to graph 0.925-dx,0.615-dy nohead ls 11
set arrow from graph 0.925-dx,0.615-dy to graph 0.925-dx,0.925-dy nohead ls 11
set arrow from graph 0.925-dx,0.925-dy to graph 0.675-dx,0.925-dy nohead ls 11
set arrow from graph 0.675-dx,0.925-dy to graph 0.675-dx,0.615-dy nohead ls 11
set arrow from graph 0.675-dx,0.615-dy to graph 0.925-dx,0.925-dy nohead ls 11
set arrow from graph 0.841-dx,0.615-dy to graph 0.841-dx,0.640-dy nohead ls 11
set arrow from graph 0.675-dx,0.822-dy to graph 0.700-dx,0.822-dy nohead ls 11
set arrow from graph 0.828-dx,0.835-dy to graph 0.854-dx,0.801-dy nohead ls 11

set label '0' at graph 0.620-dx, 0.590-dy tc rgb "blue"
set label '1' at graph 0.830-dx, 0.580-dy tc rgb "blue"
set label '1.5' at graph 0.900-dx, 0.580-dy tc rgb "blue"
set label '1' at graph 0.618-dx, 0.822-dy tc rgb "blue"
set label '1.5' at graph 0.600-dx, 0.925-dy tc rgb "blue"

set label '{/Symbol G}' at graph 0.687-dx, 0.570-dy tc rgb "blue"
set label 'X_1' at graph 0.830-dx, 0.510-dy tc rgb "blue"
set label 'X' at graph 0.900-dx, 0.510-dy tc rgb "blue"
set label 'Y_1' at graph 0.550-dx, 0.822-dy tc rgb "blue"
set label 'Y' at graph 0.550-dx, 0.925-dy tc rgb "blue"
set label 'M' at graph 0.945-dx, 0.915-dy tc rgb "blue"
set label 'M_1' at graph 0.854-dx, 0.755-dy tc rgb "blue"

set xrange [0:6.628]

set title '(a)'
plot f32_10 u 1:(-2.0* log($4)) w l ls 2 t '{/Symbol d}=0.00', \
     '' u 1:(-2.0* log($5)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($6)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($7)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($8)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($9)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($10)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($11)) w l ls 2 notitle, \
     f32_1 u 1:(-2.0* log($4)) w l ls 1 t '{/Symbol d}=0.25', \
     '' u 1:(-2.0* log($5)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($6)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($7)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($8)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($9)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($10)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($11)) w l ls 1 notitle, \

unset arrow
unset label

set title '(b)'
plot f32_20 u 1:(-2.0* log($4)) w l ls 2 t '{/Symbol d}=0.00', \
     '' u 1:(-2.0* log($5)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($6)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($7)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($8)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($9)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($10)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($11)) w l ls 2 notitle, \
     f32_2 u 1:(-2.0* log($4)) w l ls 1 t '{/Symbol d}=0.25', \
     '' u 1:(-2.0* log($5)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($6)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($7)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($8)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($9)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($10)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($11)) w l ls 1 notitle, \

set title '(c)'
plot f32_30 u 1:(-2.0* log($4)) w l ls 2 t '{/Symbol d}=0.00', \
     '' u 1:(-2.0* log($5)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($6)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($7)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($8)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($9)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($10)) w l ls 2 notitle, \
     '' u 1:(-2.0* log($11)) w l ls 2 notitle, \
     f32_3 u 1:(-2.0* log($4)) w l ls 1 t '{/Symbol d}=0.25', \
     '' u 1:(-2.0* log($5)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($6)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($7)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($8)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($9)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($10)) w l ls 1 notitle, \
     '' u 1:(-2.0* log($11)) w l ls 1 notitle, \

unset multiplot
if(debug) pause -1
if(!debug) set output
