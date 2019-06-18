set terminal png transparent nocrop enhanced size 450,320 font "arial,8"
set output 'test.png'
set key inside left top vertical Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 50, 50
set title "Simple Plots"
set title  font ",20" norotate
plot [-10:10] sin(x),atan(x),cos(atan(x))
