set encoding iso_8859_1
set xlabel "Lattice parameter,a({\305})"
set ylabel "Cohensive energy per atom,E(eV)"
set title "My test"
set xrange [5.4304:5.4316]
set yrange [-4.3366001:-4.3365993]

plot "dc.txt" using 8:10 with lp pt 5 ps 2 
plot "dc.txt" using 9:10 with pt 5 ps 2
