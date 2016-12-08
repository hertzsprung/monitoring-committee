set term epslatex color size 4.5,3.5
set termoption dashed

set multiplot layout 2,2

set style data lines

set lmargin 4
set rmargin 1
set tmargin 0.2
set bmargin 2

set xrange [-75:75]
set yrange [0:15]
set xtics 25 format ""
set ytics 5 offset 0.5

a = 25e3
hm = 3e3
lambda = 8e3

schaerCos(x) = abs(x) < a ? hm*cos(pi*x/(2*a))**2 * cos(pi*x/lambda)**2 : 0

set parametric
set trange [-25:25]

set ylabel "$z$ (\\si{\\kilo\\meter})" offset 2.5
set label 1 "(a)" at -65,13.5 center front
set title "Horizontal flow on BTF grid" offset 0,-0.9
plot t, schaerCos(t*1000)/1000 notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-horizontal-cubicUpwind-btf/10000/T_diff.contour.positive" using ($1/1000):($2/1000) notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-horizontal-cubicUpwind-btf/10000/T_diff.contour.negative" using ($1/1000):($2/1000) notitle dt 3 lc rgbcolor '#ff0000'

unset ylabel
set label 1 "(b)" at -65,13.5 center front
set title "Horizontal flow on cut cell grid" offset 0,-0.9
plot t, schaerCos(t*1000)/1000 notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-horizontal-cubicUpwind-cutCell/10000/T_diff.contour.positive" using ($1/1000):($2/1000) notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-horizontal-cubicUpwind-cutCell/10000/T_diff.contour.negative" using ($1/1000):($2/1000) notitle dt 3 lc rgbcolor '#ff0000'

set xlabel "$x$ (\\si{\\kilo\\meter})" offset 0,0.5
set xtics 25 format "%h"
set ylabel "$z$ (\\si{\\kilo\\meter})" offset 2.5
set label 1 "(c)" at -65,13.5 center front
set title "TF flow on BTF grid" offset 0,-0.9
plot t, schaerCos(t*1000)/1000 notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-terrainFollowing-cubicUpwind-btf/10000/T_diff.contour.positive" using ($1/1000):($2/1000) notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-terrainFollowing-cubicUpwind-btf/10000/T_diff.contour.negative" using ($1/1000):($2/1000) notitle dt 3 lc rgbcolor '#ff0000'

unset ylabel
set label 1 "(d)" at -65,13.5 center front
set title "TF flow on cut cell grid" offset 0,-0.9
plot t, schaerCos(t*1000)/1000 notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-terrainFollowing-cubicUpwind-cutCell/10000/T_diff.contour.positive" using ($1/1000):($2/1000) notitle lt 1 lc 0, \
"`echo $ATMOSTESTS_DIR`/build/advection-terrainFollowing-cubicUpwind-cutCell/10000/T_diff.contour.negative" using ($1/1000):($2/1000) notitle dt 3 lc rgbcolor '#ff0000'

unset multiplot
