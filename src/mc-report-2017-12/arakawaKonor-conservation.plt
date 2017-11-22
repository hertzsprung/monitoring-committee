set term epslatex color size 6,4

set style data lines

set xrange [0:48]

set xlabel "Time (hours)"
set ylabel "Normalised energy"

set xtics 6

set multiplot layout 2,1

set title 'Uniform mesh'

set ytics 1e-7

set xzeroaxis

plot "`echo $atmostests_builddir`/arakawaKonor-uniform-lorenz/energy.dat" using ($1/3600):5 title "Lorenz", \
     "`echo $atmostests_builddir`/arakawaKonor-uniform-cp/energy.dat" using ($1/3600):5 title "Charney--Phillips"

set title 'Mesh with tilted horizontal surfaces'

set ytics 2e-4

plot "`echo $atmostests_builddir`/arakawaKonor-horizontalGrading-lorenz/energy.dat" using ($1/3600):5 title "Lorenz", \
     "`echo $atmostests_builddir`/arakawaKonor-horizontalGrading-cp/energy.dat" using ($1/3600):5 title "Charney--Phillips"
