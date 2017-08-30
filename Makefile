TEX = pdflatex -interaction nonstopmode
BIB = bibtex

PAPER = paper
BIBFILE = hyperledger.bib
BUNDLE = paper.pdf

all: $(PAPER).pdf

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof

$(PAPER).pdf: $(wildcard *.tex)  $(PAPER).bbl 
	$(TEX) $(PAPER) 
	$(TEX) $(PAPER)

$(PAPER).bbl: $(PAPER).tex $(BIBFILE)
	$(TEX) $(PAPER)
	$(BIB) $(PAPER)

