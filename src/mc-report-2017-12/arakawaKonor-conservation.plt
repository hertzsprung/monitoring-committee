set term epslatex color size 6,2.5

set style data lines

set xlabel "Time (hours)"
set ylabel "Total energy change" offset 1
set ytics format "$\\num{%2.1e}$"

set xtics 6

set multiplot layout 1,2 margins 0.18, 0.98, 0.4, 0.94 spacing 0.2, 0.1

set key outside bottom center

set title '(a) Fully-compressible Euler'

set xrange [0:48]
plot "`echo $atmostests_builddir`/arakawaKonor-uniform-lorenz/energy.dat" using ($1/3600):5 lc 6 lw 1.5 title 'Lorenz', \
     "`echo $atmostests_builddir`/arakawaKonor-uniform-cp/energy.dat" using ($1/3600):5 lc 7 lw 1.5 title 'Charney--Phillips', \
     "`echo $atmostests_builddir`/arakawaKonor-horizontalGrading-lorenz/energy.dat" using ($1/3600):5 lc 6 dt 2 lw 1.5 notitle, \
     "`echo $atmostests_builddir`/arakawaKonor-horizontalGrading-cp/energy.dat" using ($1/3600):5 lc 7 dt 2 lw 1.5 notitle


set title '(b) Tracer transport'

unset ylabel
set xrange [0:12]
set ylabel "Total tracer change" offset 1

plot 0 lc 0 lw 1.5 title 'Uniform mesh', \
     0 lc 0 dt 2 lw 1.5 title 'Distorted mesh', \
     "`echo $atmostests_builddir`/arakawaKonorAdvect-uniform-lorenz/energy.dat" using ($1/3600):2 lc 6 lw 1.5 notitle, \
     "`echo $atmostests_builddir`/arakawaKonorAdvect-uniform-cp/energy.dat" using ($1/3600):2 lc 7 lw 1.5 notitle, \
     "`echo $atmostests_builddir`/arakawaKonorAdvect-horizontalGrading-lorenz/energy.dat" using ($1/3600):2 lc 6 dt 2 lw 1.5 notitle, \
     "`echo $atmostests_builddir`/arakawaKonorAdvect-horizontalGrading-cp/energy.dat" using ($1/3600):2 lc 7 dt 2 lw 1.5 notitle
