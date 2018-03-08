#!/usr/local/bin/gnuplot --persist
# gnuplot -c insertion_plot.gp result.png seg9mul3.csv seg4mul3.csv
set title "Insertion Rate"
set xlabel "Items inserted"
set ylabel "Rate KB/s"
set grid
set term png
set output ARG1
set samples 100000
if (ARG4 ne "" ) plot ARG4 with lines title ARG4, ARG3 with lines title ARG3, ARG2 with lines title ARG2; quit
if (ARG3 ne "" ) plot ARG2 with lines title ARG2, ARG3 with lines title ARG3; quit
plot ARG2 with lines title ARG2
