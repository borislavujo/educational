reset
set terminal postscript enhanced color
unset key
set mxtics 4
set mytics 4
set mztics 4
set xtics 0.4
set ytics 0.4
set ztics 0.2
set format y " %.1f"
set format x " %.1f"
set format z " %.1f"
set output "bubble.eps"
splot "Xyz" u 1:2:3 w lines lt 1 lw 5 lc rgb "#FF9966" , \
"Xyz2" u 1:2:3 w lines lt 1 lw 5 lc rgb "#FF9966"
