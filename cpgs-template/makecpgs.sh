rm *bbl *blg *lof *aux *log *lot *toc

pdflatex cpgs.tex
bibtex cpgs.aux
pdflatex cpgs.tex
pdflatex cpgs.tex

rm *bbl *blg *lof *aux *log *lot *toc
