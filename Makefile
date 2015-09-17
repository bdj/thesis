all: demod.pdf

CHAPTERS=introduction.tex module-system.tex intuition.tex model.tex implementation.tex evaluation.tex related-work.tex conclusion.tex

LISTINGS=obj.rkt while-lang.rkt while-test.rkt

CHAPTERS_DIR=$(addprefix chapters/,$(CHAPTERS))

LISTINGS_DIR=$(addprefix listings/,$(LISTINGS))

demod.pdf: demod.tex abstract.tex $(CHAPTERS_DIR) $(LISTINGS_DIR)
	mkdir -p build
	pdflatex -output-directory=build -shell-escape demod.tex
	bibtex build/demod
	pdflatex -output-directory=build -shell-escape demod.tex
	pdflatex -output-directory=build -shell-escape demod.tex
	cp build/demod.pdf .

