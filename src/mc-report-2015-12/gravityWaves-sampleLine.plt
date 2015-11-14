set term epslatex color size 5,4
set style data linespoints

set multiplot layout 2,2 margins 0.05,0.9,0.1,0.9 spacing 0.1

set xrange [-0.1:0.1]
set yrange [0:1200]
set ylabel "$z$ (\\si{\\meter})" offset 3
set yzeroaxis

set key at 0.1875,1350 title "$\\Delta z$"
unset key

set label 1 "(a)" at -0.085,1100 center front
set title "Gravity waves BTF" offset 0,-1
plot "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-500dz/18000/sampleLine.dat" using 2:1 title '\SI{500}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-300dz/18000/sampleLine.dat" using 2:1 title '\SI{300}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-250dz/18000/sampleLine.dat" using 2:1 title '\SI{250}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-200dz/18000/sampleLine.dat" using 2:1 title '\SI{200}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-150dz/18000/sampleLine.dat" using 2:1 title '\SI{150}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-125dz/18000/sampleLine.dat" using 2:1 title '\SI{125}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-100dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-75dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-btf-250m-50dz/18000/sampleLine.dat" using 2:1 notitle

unset key
unset ylabel
set label 1 "(b)"
set title "Gravity waves cut cell"
set ytics format ""
plot "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-500dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-300dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-250dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-200dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-150dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-125dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-100dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-75dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/gravityWaves-cutCell-250m-50dz/18000/sampleLine.dat" using 2:1

set key at 0.1875,2130 title ""
unset key
set xlabel "$\\theta$ (\\si{\\kelvin})" offset 0,0.5
set ytics format "% h"
set ylabel "$z$ (\\si{\\meter})" offset 3
set label 1 "(c)"
set title "Thermal advection BTF"
plot "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-500dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-300dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-250dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-200dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-150dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-125dz/18000/sampleLine.dat" using 2:1 notitle, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-100dz/18000/sampleLine.dat" using 2:1 title '\SI{100}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-75dz/18000/sampleLine.dat" using 2:1 title '\SI{75}{\meter}', \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-btf-250m-50dz/18000/sampleLine.dat" using 2:1 title '\SI{50}{\meter}'

unset key
unset ylabel
set label 1 "(d)"
set title "Thermal advection cut cell"
set ytics format ""
plot "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-500dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-300dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-250dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-200dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-150dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-125dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-100dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-75dz/18000/sampleLine.dat" using 2:1, \
     "`echo $ATMOSTESTS_DIR`/build/thermalAdvection-cutCell-250m-50dz/18000/sampleLine.dat" using 2:1

unset multiplot
