topdf='|epstopdf --filter --outfile='
set key spacing 1.3 samplen 2.5 right top reverse
set xlabel font 'Garamond-Premier-Pro-Italic,18'
set ylabel font 'Garamond-Premier-Pro-Italic,18'
set xtics font ',14'
set ytics font ',14'
set title font ',18'
set key font ',16'

if(!exist("debug")) debug=0
if(!exist("outfile")) outfile=topdf.'n.pdf'; else outfile=topdf.outfile.'.pdf'
if(!exist("yl")) yl=3.0
if(!exist("xl")) xl=5.4
if(!debug) set terminal postscript eps "Helvetica" 12 color solid enhanced size xl,yl
	       			   #font : sans, yuanti SC, Times, Helvetica 
if(!debug) set output outfile

if(!exist("locfile1") && !exist("prefix")) print 'pls set localfile or prefix'; exit
if(!exist("L")) print 'pls set L'; exit 
if(!exist("prefix")) unset key
if(exist("prefix") && !exist("postfix1")) print 'pls set postfix1'; exit
if(exist("prefix") && !exist("postfix2")) print 'pls set postfix2'; exit
if(exist("prefix") && !exist("fix")) print 'pls set fix'; exit
if(exist("prefix") && !exist("var")) print 'pls set var'; exit
if(exist("prefix") && !exist("numvar")) print 'pls set numvar'; exit

set style line 1 lt 1 lw 3 lc 'black'
set style line 2 lt 2 lw 3 lc 'red'
set style line 3 lt 3 lw 3 lc 'blue'
set style line 4 lt 4 lw 3 lc 'green'
set style line 5 lt 5 lw 3 lc 'purple'
set style line 6 lt 6 lw 3 lc 'cyan'

set bmargin 4.0
set multiplot layout 2,3
set key title "{/Garamond-Premier-Pro-Italic t_0}"

set label '(N=L-2)' at screen 0.175, 0.875 font ',18'
set label '<n_{k{/Symbol \255}}+n_{k{/Symbol \257}}>' at screen 0.025,0.65 rotate by 90 font 'Garamond-Premier-Pro-Italic,18'
set yrange [0:2.0]
set xlabel '{/Garamond-Premier-Pro-Italic k}'
set xrange [-pi:pi]
set xtics ('-{/Symbol p}' -pi, '-{/Symbol p}/2' -pi/2, '0' 0, '{/Symbol p}/2' pi/2, '{/Symbol p}' pi)
set lmargin screen 0.075
set tmargin screen 0.925
set rmargin screen 0.345
set bmargin screen 0.575
unset key
if(!exist("prefix")){
	r=0
	plot locfile2 index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	j=1
	r=0
	num=L-2
	plot for [i=1:numvar] prefix.num.fix.word(var,i).postfix2 index r u 1:2 w lp ls i t word(var,i)
}

set lmargin screen 0.395
set tmargin screen 0.925
set rmargin screen 0.665
set bmargin screen 0.575
set label titlelabel at screen 0.50, 0.975 font ',18'
set label '(N=L-1)' at screen 0.50, 0.875 font ',18'
if(!exist("prefix")){
	r=0
	plot locfile2 index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	j=2
	r=0
	num=L-1
	plot for [i=1:numvar] prefix.num.fix.word(var,i).postfix2 index r u 1:2 w lp ls i t word(var,i)
}

set lmargin screen 0.715
set tmargin screen 0.925
set rmargin screen 0.985
set bmargin screen 0.575
set label '(N=L)' at screen 0.825, 0.875 font ',18'
set key font ',16' bottom right box
if(!exist("prefix")){
	r=0
	plot locfile2 index r u 1:2 w lp ls 1, "" index r u 1:3 w lp ls 2
}else{
	j=3
	r=0	
	num=L
	plot for [i=1:numvar] prefix.num.fix.word(var,i).postfix2 index r u 1:2 w lp ls i t word(var,i)
}

set label '<n_{j{/Symbol \255}}+n_{j{/Symbol \257}}>' at screen 0.025,0.175 rotate by 90 font 'Garamond-Premier-Pro-Italic,18'
set yrange [0:1.4]
set xlabel '{/Garamond-Premier-Pro-Italic Site j}'
set xrange [0.5:(L+0.5)]
set xtics L/4
set lmargin screen 0.075
set tmargin screen 0.450
set rmargin screen 0.345
set bmargin screen 0.10
unset key
if(!exist("prefix")){
	r=1
	plot locfile1 matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile1 matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	j=1
	r=1	
	num=L-2
	plot for [i=1:numvar] prefix.num.fix.word(var,i).postfix1 matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls i t word(var,i)
}

set lmargin screen 0.395
set tmargin screen 0.450
set rmargin screen 0.665
set bmargin screen 0.10
if(!exist("prefix")){
	r=1
	plot locfile1 matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile1 matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	j=2
	r=1	
	num=L-1
	plot for [i=1:numvar] prefix.num.fix.word(var,i).postfix1 matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls i t word(var,i)
}

set lmargin screen 0.715
set tmargin screen 0.450
set rmargin screen 0.985
set bmargin screen 0.10
set key font ',16' bottom right box
if(!exist("prefix")){
	r=1
	plot locfile1 matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls 1, locfile1 matrix u ($1+1):($2==(2*r+1)?$3:1/0) w lp ls 2
}else{
	j=3
	r=1	
	num=L
	plot for [i=1:numvar] prefix.num.fix.word(var,i).postfix1 matrix u ($1+1):($2==(2*r)?$3:1/0) w lp ls i t word(var,i)
}

unset multiplot

if(debug) pause -1

if(!debug) set output
