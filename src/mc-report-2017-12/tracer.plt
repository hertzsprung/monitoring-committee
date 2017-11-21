set term epslatex color size 4,2.5
set output 'tracer.tex'

set style data linespoints
set yrange [-0.2:1.2]
set xlabel "$x$"
set ylabel "$\\phi$" offset 2

plot '/home/jshaw/high-order-transport/1d/build/0.dat' using 1:2 lw 2 dt 3 lc 0 title 'Initial', \
     '/home/jshaw/high-order-transport/1d/build/1.dat' using 1:2 lw 3 lc 0 title 'Final'
