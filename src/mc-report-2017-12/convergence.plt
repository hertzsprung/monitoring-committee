set term epslatex color size 5,2.5
set output 'convergence.tex'

set style data linespoints

set logscale

set format x "$10^{%L}$"
set format y "$10^{%L}$"

set xrange[0.001:0.1]
set yrange[*:0.5]

set xlabel "$\\max(\\Delta x)$"

set key tmargin

set multiplot layout 1,2 margins 0.1, 0.95, 0.18, 0.8 spacing 0.15, 0.12

set ylabel "$\\ell_2$ error" offset 1.2

#set key inside bottom right

plot '/home/jshaw/high-order-transport/1d/build/cubicFit.l2.dat' using 1:2 lw 2 title 'cubicFit', \
     '/home/jshaw/high-order-transport/1d/build/highOrderFit.l2.dat' using 1:2 lw 2 title 'highOrderFit', \
     1e2*x**2 lc 0 dt 2 lw 1.5 notitle, \
     1e5*x**4 lc 0 dt 4 lw 1.5 notitle

set ylabel "$\\ell_\\infty$ error"

plot '/home/jshaw/high-order-transport/1d/build/cubicFit.linf.dat' using 1:2 lw 2 notitle, \
     '/home/jshaw/high-order-transport/1d/build/highOrderFit.linf.dat' using 1:2 lw 2 notitle, \
     1e2*x**2 lc 0 dt 2 lw 1.5 title '$x^2$', \
     1e5*x**4 lc 0 dt 4 lw 1.5 title '$x^4$'
