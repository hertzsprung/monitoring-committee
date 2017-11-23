set term epslatex color size 6,4

set style data lines


set xlabel "Time (hours)"
set ylabel "Normalised energy"

set xtics 6

set multiplot layout 2,2

set title 'Fully-compressible Euler, uniform mesh'

set ytics 1e-7

set xzeroaxis

set xrange [0:48]
plot "`echo $atmostests_builddir`/arakawaKonor-uniform-lorenz/energy.dat" using ($1/3600):5 title "Lorenz", \
     "`echo $atmostests_builddir`/arakawaKonor-uniform-cp/energy.dat" using ($1/3600):5 title "Charney--Phillips"

set title 'Tracer transport, uniform mesh'

set xrange [0:17]
set yrange [-1e-4:1e-4]
set ytics autofreq

plot "`echo $atmostests_builddir`/arakawaKonorAdvect-uniform-lorenz/energy.dat" using ($1/3600):2 title "Lorenz", \
     "`echo $atmostests_builddir`/arakawaKonorAdvect-uniform-cp/energy.dat" using ($1/3600):2 title "Charney--Phillips"

set title 'Fully-compressible Euler, distorted mesh'

set xrange [0:48]
set yrange [*:*]
set ytics autofreq

plot "`echo $atmostests_builddir`/arakawaKonor-horizontalGrading-lorenz/energy.dat" using ($1/3600):5 title "Lorenz", \
     "`echo $atmostests_builddir`/arakawaKonor-horizontalGrading-cp/energy.dat" using ($1/3600):5 title "Charney--Phillips"

set title 'Tracer transport, distorted mesh'

set xrange [0:17]
set yrange [*:*]
set ytics autofreq

plot "`echo $atmostests_builddir`/arakawaKonorAdvect-horizontalGrading-lorenz/energy.dat" using ($1/3600):2 title "Lorenz", \
     "`echo $atmostests_builddir`/arakawaKonorAdvect-horizontalGrading-cp/energy.dat" using ($1/3600):2 title "Charney--Phillips"
