set term epslatex color size 1.35,1.6

set lmargin 0.1
set rmargin 0.1

set xrange[0:4]
set yrange[0:3]
set xtics 1
set ytics 1

set grid 
set xtics format ""
set ytics format ""

set style fill pattern border

set parametric
set arrow from 2.1,1.3 to 1.95,0.95 filled
set label "$\\ast$" at 2.15,1.4 center front
set label "$\\ast$" at 2.2,0.95 center front
set label "$\\ast$" at 3.9,1.9 center front

plot '-' using 1:2 with filledcurves fillcolor rgbcolor '#999999' notitle, \
     'shave-curve.dat' using 1:2 smooth csplines notitle lt -1 lw 2
0 0.2
0.88 1
1 1
1 0
0 0
0.02

1 1
1 1.3
0.88 1
1 1

1 1
1.87 1
1 1.3
1 1

1 0
2 0
2 0.85
1.87 1
1 1
1 0 

2 0 
3 0
3 1
2.56 1
2 0.85
2 0

2.56 1
2.91 2
3    2
3    1
2.56 1

2.91 2
3    2
3    2.2
2.91 2

3 1
4 1
4 1.5
3.74 2
3 2
3 1

3 2
3.74 2
3 2.2
3 2

3 0
4 0
4 1
3 1
3 0

e

