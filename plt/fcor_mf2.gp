topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font ',18'
set key font ',16'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'corf_mf2.pdf'; else outfile=topdf.outfile.'corf_mf2.pdf'
if(!exist("yl")) yl=3.2
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

set xrange [-pi:pi]
set multiplot layout 2,2
set xlabel '{/Garamond-Premier-Pro-Italic k}'
set xtics ('-{/Symbol p}' -pi, '-{/Symbol p}/2' -pi/2, '0' 0, '{/Symbol p}/2' pi/2, '{/Symbol p}' pi)

set title '(a)'
set ylabel 'Re<D_{k,13}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=11
	plot locfile index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	r=11
	plot for [i=1:numvar] prefix.word(var,i).postfix index r u 1:2 w lp ls i t word(var,i)
}

set title '(b)'
set ylabel 'Re<D_{k,31}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=12
	plot locfile index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	r=12
	plot for [i=1:numvar] prefix.word(var,i).postfix index r u 1:2 w lp ls i t word(var,i)
}

set title '(c)'
set ylabel 'Re<D_{k,24}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=13
	plot locfile index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	r=13
	plot for [i=1:numvar] prefix.word(var,i).postfix index r u 1:2 w lp ls i t word(var,i)
}

set title '(d)'
set ylabel 'Re<D_{k,42}>' offset 0.5, 0.0
if(!exist("prefix")){
	r=14
	plot locfile index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	r=14
	plot for [i=1:numvar] prefix.word(var,i).postfix index r u 1:2 w lp ls i t word(var,i)
}

unset multiplot

if(debug) pause -1

if(!debug) set output
