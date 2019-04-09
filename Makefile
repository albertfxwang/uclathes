
#
# uclathes Makefile
# Copyright (C) 1995 by John Heidemann, <johnh@isi.edu>
#

FILES=README \
	demo.tex demo.dvi demo.pdf \
	demo_techreport.tex demo_techreport.pdf \
	thesis_spec.tex thesis_spec.pdf \
	uclathes.cls uclath12.clo uclathti.clo uclathma.clo \
	uclathes.bst Makefile

all:  latex ps pdf

tar: $(FILES)
	tar cvf uclathes.tar $(FILES)

tar.gz:
	@echo "Make all before doing make tar.gz"
	tar czvf uclathes.tar.gz $(FILES)

DVIPS=dvips
PS2PDF=ps2pdf14

latex latex.xwang::
	latex xwang
	bibtex xwang
	latex xwang
	bibtex xwang
	latex xwang

ps xwang.ps::
	$(DVIPS) xwang

pdf xwang.pdf::
	$(PS2PDF) xwang.ps xwang.pdf

clean:
	rm -f *.aux *.toc *.lot *.lof *.dvi *.log *.ps *.bbl *.blg *.out

paper:
	pdflatex xwang
	bibtex xwang
	pdflatex xwang
	bibtex xwang
	pdflatex xwang

