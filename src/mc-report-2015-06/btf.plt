load 'tf.plt'

plot for [z=0:20] btf(schaerExp(x*1000), z*1000)/1000 notitle lt 1 lc 0
