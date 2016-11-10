topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font 'Helvetica-Bold,18'
set key font ',14'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'deg.pdf'; else outfile=topdf.outfile.'deg.pdf'
if(!exist("yl")) yl=2.0
if(!exist("xl")) xl=5.4
if(!debug) set terminal postscript eps "Helvetica" 12 color solid dl 1.5 enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica
if(!debug) set output outfile


#set termoption dashed
set tmargin 3.5
set style line 1 lt 7 lw 3 lc 'black'
set style line 2 lt 2 lw 3 lc 'red'
set style line 3 lt 1 lw 3 lc 'blue'
set style line 4 lt 4 lw 3 lc 'green'
set style line 5 lt 5 lw 3 lc 'purple'
set style line 6 lt 6 lw 3 lc 'cyan'

set multiplot layout 1,2

set grid xtics lt 3 lw 2 lc 'gray'
set format x ""
unset xlabel
#set logscale y
set ylabel '{/Symbol x}_i' offset 1.5, 0
set xtics ('{}' 3.5, '' 6.0)
#set key left top

# dy=0.465
# dx=0.04
# set style line 11 lc rgb '#1F78B4' lt 1 lw 3 # dark blu
# set arrow from graph 0.675-dx,0.615-dy to graph 0.925-dx,0.615-dy nohead ls 11
# set arrow from graph 0.925-dx,0.615-dy to graph 0.925-dx,0.925-dy nohead ls 11
# set arrow from graph 0.925-dx,0.925-dy to graph 0.675-dx,0.925-dy nohead ls 11
# set arrow from graph 0.675-dx,0.925-dy to graph 0.675-dx,0.615-dy nohead ls 11
# set arrow from graph 0.675-dx,0.615-dy to graph 0.925-dx,0.925-dy nohead ls 11
# set arrow from graph 0.841-dx,0.615-dy to graph 0.841-dx,0.640-dy nohead ls 11
# set arrow from graph 0.675-dx,0.822-dy to graph 0.700-dx,0.822-dy nohead ls 11
# set arrow from graph 0.828-dx,0.835-dy to graph 0.854-dx,0.801-dy nohead ls 11

# set label '0' at graph 0.620-dx, 0.590-dy tc rgb "blue"
# set label '1' at graph 0.830-dx, 0.580-dy tc rgb "blue"
# set label '1.5' at graph 0.900-dx, 0.580-dy tc rgb "blue"
# set label '1' at graph 0.618-dx, 0.822-dy tc rgb "blue"
# set label '1.5' at graph 0.600-dx, 0.925-dy tc rgb "blue"

# set label '{/Symbol G}' at graph 0.687-dx, 0.570-dy tc rgb "blue"
# set label 'X_1' at graph 0.830-dx, 0.510-dy tc rgb "blue"
# set label 'X' at graph 0.900-dx, 0.510-dy tc rgb "blue"
# set label 'Y_1' at graph 0.550-dx, 0.822-dy tc rgb "blue"
# set label 'Y' at graph 0.550-dx, 0.925-dy tc rgb "blue"
# set label 'M' at graph 0.945-dx, 0.905-dy tc rgb "blue"
# set label 'M_1' at graph 0.854-dx, 0.755-dy tc rgb "blue"

# f32_11 = 'L32N32U00dd0.25ent.dat'
# f32_12 = 'L32N32U01dd0.25ent.dat'
# f32_13 = 'L32N32U05dd0.25ent.dat'

f32_11 = 'L32N32U00dd0.00ent.dat'
f32_12 = 'L32N32U01dd0.00ent.dat'
f32_13 = 'L32N32U05dd0.00ent.dat'

len=5.0
dy=-0.075
dx=0.03
set bmargin 2.5
set label '{/Garamond-Premier-Pro-Italic=16 O}' at graph 0.00/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 X_1}' at graph 0.5/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 X_2}' at graph 1.0/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 X_3}' at graph 1.5/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 O}' at graph 2.1/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 Y_1}' at graph 2.6/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 Y_2}' at graph 3.1/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 O}' at graph 3.65/len+dx, dy
set label '{/Garamond-Premier-Pro-Italic=16 M_1}' at graph 4.15/len+dx,dy
set label '{/Garamond-Premier-Pro-Italic=16 M_2}' at graph 4.6/len+dx, dy

set bar 0.000000 front
set title '(a)'
set xrange [0.3:]
set yrange [0.0:15]
plot f32_11 u 5:6:3:4  ls 1 with xerrorbars notitle, \
     '' u  7:8:3:4  ls 1 with xerrorbars notitle, \
     '' u 9:10:3:4 ls 1 with xerrorbars notitle, \
     '' u 11:12:3:4  ls 1 with xerrorbars notitle, \
     '' u 13:14:3:4  ls 1 with xerrorbars notitle, \
     '' u 15:16:3:4  ls 1 with xerrorbars notitle, \
     '' u 17:18:3:4  ls 1 with xerrorbars notitle, \
     '' u 19:20:3:4  ls 1 with xerrorbars notitle, \

#unset label
#unset arrow
set title '(b)'
plot f32_12 u 5:6:3:4  ls 1 with xerrorbars notitle, \
     '' u  7:8:3:4  ls 1 with xerrorbars notitle, \
     '' u 9:10:3:4  ls 1 with xerrorbars notitle, \
     '' u 11:12:3:4  ls 1 with xerrorbars notitle, \
     '' u 13:14:3:4  ls 1 with xerrorbars notitle, \
     '' u 15:16:3:4  ls 1 with xerrorbars notitle, \
     '' u 17:18:3:4  ls 1 with xerrorbars notitle, \
     '' u 19:20:3:4  ls 1 with xerrorbars notitle, \

# set title '(I.c)'
# plot f32_13 u 5:6:3:4  ls 1 with xerrorbars notitle, \
#      '' u  7:8:3:4  ls 1 with xerrorbars notitle, \
#      '' u 9:10:3:4  ls 1 with xerrorbars notitle, \
#      '' u 11:12:3:4 ls 1 with xerrorbars notitle, \
#      '' u 13:14:3:4  ls 1 with xerrorbars notitle, \
#      '' u 15:16:3:4  ls 1 with xerrorbars notitle, \
#      '' u 17:18:3:4  ls 1 with xerrorbars notitle, \
#      '' u 19:20:3:4  ls 1 with xerrorbars notitle, \

unset multiplot
if(debug) pause -1
if(!debug) set output
