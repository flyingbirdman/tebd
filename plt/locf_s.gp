topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font ',18'
set key font ',16'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'locf_s.pdf'; else outfile=topdf.outfile.'locf_s.pdf'
if(!exist("yl")) yl=1.6
if(!exist("xl")) xl=6.4
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
set multiplot layout 1,3
set xlabel '{/Garamond-Premier-Pro-Italic Site j}'

set title '(a)'
set ylabel '<{/Symbol s}^x_j>'
if(!exist("prefix")){
	r=5
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1,locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=5
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls i t word(var,i)
}

set title '(b)'
set ylabel ' <{/Symbol s}^y_j>'
if(!exist("prefix")){
	r=6
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1,locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=6
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls i t word(var,i)
}

set title '(c)'
set ylabel '<{/Symbol s}^z_j>'
if(!exist("prefix")){
	r=0
	plot locfile matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1,locfile matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	r=0
	plot for [i=1:numvar] prefix.word(var,i).postfix matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls i t word(var,i)
}

unset multiplot

if(debug) pause -1

if(!debug) set output
