set term epslatex color colortext size 5.5,2.3

set tmargin 0.5
set xrange [0:10]
set yrange [7e-3:0.2]

set logscale y

set style data linespoints

set xlabel "Peak mountain height $h_0$ (\\si{\\kilo\\meter})"
set ylabel "$\\ell_2$ error" offset 2

set label "\\textit{BTF linearUpwind}" at 6.3,0.075 textcolor rgb "dark-violet"
set label "BTF cubicUpwind" at 6.3,0.04 textcolor rgb "dark-violet"
set label "\\textit{Cut cells linearUpwind}" at 6.3,0.15 textcolor rgb "#009e73"
set label "Cut cells cubicUpwind" at 6.3,0.054 textcolor rgb "#009e73"
set label "\\textit{Slanted cells linearUpwind}" at 1.25,0.15 textcolor rgb "#1a8acb"
set label "Slanted cells cubicUpwind" at 6.3,0.1 textcolor rgb "#1a8acb"

unset key

plot "`echo $ATMOSTESTS_DIR`/build/mountainAdvection-btf-collated-linearUpwind-1000/10000/l2errorT.txt" using ($1/1000):($2) lc 1 lw 2 dt 2 ps 1.5 pt 4, \
     "`echo $ATMOSTESTS_DIR`/build/mountainAdvection-btf-collated-cubicUpwind-1000/10000/l2errorT.txt" using ($1/1000):($2) lc 1 lw 2 dt 1 ps 1.5 pt 5, \
     "`echo $ATMOSTESTS_DIR`/build/mountainAdvection-cutCell-collated-linearUpwind-1000/10000/l2errorT.txt" using ($1/1000):($2) lc 2 lw 2 dt 2 ps 1.5 pt 8, \
     "`echo $ATMOSTESTS_DIR`/build/mountainAdvection-cutCell-collated-cubicUpwind-1000/10000/l2errorT.txt" using ($1/1000):($2) lc 2 lw 2 dt 1 ps 1.5 pt 9, \
     "`echo $ATMOSTESTS_DIR`/build/mountainAdvection-slantedCell-collated-linearUpwind-1000/10000/l2errorT.txt" using ($1/1000):($2) lc 3 lw 2 dt 2 ps 1.5 pt 6, \
     "`echo $ATMOSTESTS_DIR`/build/mountainAdvection-slantedCell-collated-cubicUpwind-1000/10000/l2errorT.txt" using ($1/1000):($2) lc 3 lw 2 dt 1 ps 1.5 pt 7
