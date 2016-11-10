topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font ',18'
set key font ',16'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'locf_mf.pdf'; else outfile=topdf.outfile.'locf_mf.pdf'
if(!exist("yl")) yl=4.8
if(!exist("xl")) xl=4.8
if(!debug) set terminal postscript eps "Helvetica" 12 color solid enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica 
if(!debug) set output outfile

if(!exist("locfile") && !exist("prefix")) print 'pls set localfile or prefix'; exit
if(!exist("L")) print 'pls set L'; exit 
if(!exist("prefix")) unset key
if(exist("prefix") && !exist("postfix")) print 'pls set postfix'; exit
if(exist("prefix") && !exist("var")) print 'pls set var'; exit
if(exist("prefix") && !exist("numvar")) print 'pls set numvar'; exit

set style line 1 lt 1 lw 3 lc 'blue'
set style line 2 lt 2 lw 3 lc 'red'
set style line 3 lt 3 lw 3 lc 'orange'
set style line 4 lt 4 lw 3 lc 'green'
set style line 5 lt 5 lw 3 lc 'purple'
set style line 6 lt 6 lw 3 lc 'cyan'

set xrange [0.5:(L+0.5)]
set multiplot layout 3,2
set xlabel '{/Garamond-Premier-Pro-Italic Site j}'
set ytics ('-1' -1, '0' 0, '1' 1)
set yrange [-1:1]

set title '(a)'
set ylabel 'Im<d_{j,1}d_{j,2}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=7
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=7
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls i t word(var,i)
}

set title '(b)'
set ylabel 'Im<d_{j,3}d_{j,4}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=8
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=8
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls i t word(var,i)
}

set title '(c)'
set ylabel 'Im<d_{j,1}d_{j,4}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=9
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=9
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls i t word(var,i)
}

set title '(d)'
set ylabel 'Im<d_{j,2}d_{j,3}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=10
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=10
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls i t word(var,i)
}

set title '(e)'
set ylabel 'Im<d_{j,1}d_{j,3}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=11
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=11
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls i t word(var,i)
}

set title '(f)'
set ylabel 'Im<d_{j,2}d_{j,4}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=12
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=12
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls i t word(var,i)
}
unset multiplot

if(debug) pause -1

if(!debug) set output
