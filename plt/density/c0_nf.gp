topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse box
set xlabel font 'Garamond-Premier-Pro-Italic,16'
set ylabel font 'Garamond-Premier-Pro-Italic,16'
set xtics font ',12'
set ytics font ',12'
set title font ',18'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'c0_n.pdf'; else outfile=topdf.outfile.'c0_n.pdf'
if(!exist("yl")) yl=3.0
if(!exist("xl")) xl=5.4
if(!debug) set terminal postscript eps "Helvetica" 12 color solid enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica
if(!debug) set output outfile

set termoption dashed
set style line 1 lt 1 lw 1 lc 'black'
set style line 2 lt 2 lw 1 lc 'red'
set style line 3 lt 3 lw 1 lc 'blue'
set style line 4 lt 4 lw 1 lc 'orange'
set style line 5 lt 5 lw 1 lc 'purple'
set style line 6 lt 6 lw 1 lc 'cyan'

set bmargin 4.0
set multiplot layout 2,3
L=32
f1='N32U0locn.dat'
f2='N32U1locn.dat'

set ytics 0.2
set xlabel '{/Garamond-Premier-Pro-Italic Site j}'
set xrange [0:(L+1.0)]
set xtics L/4
set ylabel '<n_j >' offset 1.5,0
set yrange [0:1.1]

set title '(I.a)'
set key title "{/Garamond-Premier-Pro-Italic=16 {/Symbol W}_0}"  center bottom
plot f1 index 0 u ($1+1):3 w lp ls 1 t '0.0',\
     "" index 1 u ($1+1):3 w lp ls 2 t '0.5',\
     "" index 3 u ($1+1):3 w lp ls 3 t '1.5',\

unset key
set title '(I.b)'
set yrange [-0.1:0.6]
set ylabel '{/Symbol d} <n_j >' offset 1.5,0
plot f1 index 0 u ($1+1):($2-$3) w lp ls 1 t '0.0',\
     "" index 1 u ($1+1):($2-$3) w lp ls 2 t '0.5',\
     "" index 3 u ($1+1):($2-$3) w lp ls 3 t '1.5',\

set title '(I.c)'
plot sin(x)

set title '(II.a)'
set yrange [0:1.2]
set ylabel '<n_j >' offset 1.5
set key title "{/Garamond-Premier-Pro-Italic=16 {/Symbol W}_0}" center bottom
plot f2 index 0 u ($1+1):3 w lp ls 1 t '0.0',\
     "" index 1 u ($1+1):3 w lp ls 2 t '0.5',\
     "" index 3 u ($1+1):3 w lp ls 3 t '1.5',\

set title '(II.b)'
unset key
set yrange [-0.2:0.7]
set ylabel '{/Symbol d} <n_j >' offset 1.5,0
plot f2 index 0 u ($1+1):($2-$3) w lp ls 1 t '0.0',\
     "" index 1 u ($1+1):($2-$3) w lp ls 2 t '0.5',\
     "" index 3 u ($1+1):($2-$3) w lp ls 3 t '1.5',\


set title '(II.c)'
plot sin(x)

unset multiplot

if(debug) pause -1

if(!debug) set output
