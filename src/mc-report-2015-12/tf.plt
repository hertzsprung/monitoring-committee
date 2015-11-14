set term epslatex color size 1.35,1.6

set lmargin 0.1
set rmargin 0.1

set xrange [-10:10]
set yrange [0:20]
unset xtics
unset ytics

a = 5e3
zt = 20e3
hm = 1e3
htf_scaleHeight = 8e3
sleve_coarse = 15e3
sleve_fine = 2.5e3
sleve_lambda = 4e3

smooth(x) = cos(pi*x/a)**2
fine(x) = hm*exp(-(x/a)**2)
schaerExp(x) = fine(x) * smooth(x)

btf(h, z) = z + h * (1 - z / zt)
htf(h, z) = z < htf_scaleHeight ? z + h * cos(0.5*pi*z/htf_scaleHeight)**6 : z

sleve_h1(x) = 0.5 * smooth(x)
sleve_h2(x) = (2 * sleve_h1(x) * fine(x)) - sleve_h1(x)
sleve_b(z, s) = sinh(zt / s - z / s)/sinh(zt/s)
sleve(x, z) = z + sleve_h1(x) * sleve_b(z, sleve_coarse) + sleve_h2(x) * sleve_b(z, sleve_fine)

