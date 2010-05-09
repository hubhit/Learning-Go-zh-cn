# simple makefile
.PHONY: fig fig/*.svg

all:	fig go.pdf

go.pdf:	go.tex go-*.tex ex-*/*.tex src/*.go blocksbook.cls go.bib
	xelatex go.tex && bibtex go && makeindex go && xelatex go.tex && xelatex go.tex

fig:	fig/*.svg
	( cd fig; make all )

clean:
	rm -f go.lol go.aux *.log map.log go.pdf go.bbl go.blg go.toc go.ind go.lot go.lof
	rm -f go.ilg go.idx go.lgpl missfont.log doc_data.txt
	( cd src; make clean )

distclean: clean
	( cd fig; make clean )
