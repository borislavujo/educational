#!/bin/bash

# a script for random generation of multiplication arithmetic problems
# generates $1 pages of 150 integer multiplication problems similar to Victor Cheng's https://www.caseinterview.com/math
# this file compiles the numbers produced by nahprikl.tex using pdflatex
#
# usage:
#   $  ./crtab.sh 47
# where 47 is the number of pages
#
# requirements
#   1. octave
#   2. pdflatex
#
# 23/03/2015

# simple preamble of the latex files
echo "\\documentclass{article}" > prikl.tex
echo "\\usepackage[margin=1.2cm]{geometry}" >> prikl.tex
echo "\\begin{document}" >> prikl.tex
echo "\\begin{center}" >> prikl.tex
echo "\\large" >> prikl.tex
cp prikl.tex ries.tex

# for each page
for iPage in $(seq $1)
do
    echo "\\begin{tabular}{p{3cm} p{2cm} p{3cm} p{2cm} p{3cm} p{2cm}}" >> prikl.tex
    echo "\\hline" >> prikl.tex
    echo "\\begin{tabular}{p{3cm} p{2cm} p{3cm} p{2cm} p{3cm} p{2cm}}" >> ries.tex
    echo "\\hline" >> ries.tex

# 150 problems are arranged into 5 blocks, 3 columns and 10 lines in each
    for i in $(seq 5)
    do
	octave -q nahprikl.m
	awk '(NR>5 && NR<16){print $1, "x", $2, "&&", $3, "x", $4, "&&", $5, "x", $6, "&\\\\"}' Z >> prikl.tex
	echo "\\hline" >> prikl.tex
	awk '(NR>5 && NR<16){print $1, "x", $2, "&", $3, "&", $4, "x", $5, "&", $6, "&", $7, "x", $8, "&", $9, "\\\\"}' RR >> ries.tex
	echo "\\hline" >> ries.tex
    done
    echo "\\end{tabular}" >> prikl.tex
    echo "\\end{tabular}" >> ries.tex
    echo "\\newpage" >> prikl.tex
    echo "\\newpage" >> ries.tex
done

# end of file
echo "\\end{center}" >> prikl.tex
echo "\\end{document}" >> prikl.tex
echo "\\end{center}" >> ries.tex
echo "\\end{document}" >> ries.tex

# compile and clean
pdflatex prikl.tex
pdflatex ries.tex
rm *aux *log *tex RR Z *~
