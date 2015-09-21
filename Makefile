all: thesis.pdf

CHAPTERS=introduction.tex module-system.tex intuition.tex model.tex implementation.tex evaluation.tex related-work.tex conclusion.tex

LISTINGS=obj.rkt while-lang.rkt while-test.rkt output.tex

FIGURES=modules.tex

CHAPTERS_DIR=$(addprefix chapters/,$(CHAPTERS))
LISTINGS_DIR=$(addprefix listings/,$(LISTINGS))
FIGURES_DIR=$(addprefix figures/, $(FIGURES))

thesis.pdf: thesis.tex abstract.tex $(CHAPTERS_DIR) $(LISTINGS_DIR) $(FIGURES_DIR)
	mkdir -p build
	pdflatex -output-directory=build -shell-escape thesis
	bibtex build/thesis
	pdflatex -output-directory=build -shell-escape thesis
	pdflatex -output-directory=build -shell-escape thesis
	cp build/thesis.pdf .

