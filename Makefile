all: thesis.pdf

CHAPTERS=introduction.tex module-system.tex intuition.tex model.tex implementation.tex evaluation.tex related-work.tex conclusion.tex

LISTINGS=counter.rkt while-lang.rkt while-test.rkt while-expanded.rkt output.tex while-macro.rkt kernel.rkt kernel-bytecode.rkt

FIGURES=modules.tex demod-redex.pdf source.pdf compiled-lang.pdf compiled-eval-lang.pdf eval-reduction0.pdf eval-reduction1.pdf eval-reduction2.pdf eval-reduction3.pdf eval-reduction4.pdf eval-reduction5.pdf eval-reduction6.pdf bisim.tex

CHAPTERS_DIR=$(addprefix chapters/,$(CHAPTERS))
LISTINGS_DIR=$(addprefix listings/,$(LISTINGS))
FIGURES_DIR=$(addprefix figures/, $(FIGURES))

thesis.pdf: thesis.tex abstract.tex byumsphd.cls bib.bib $(CHAPTERS_DIR) $(LISTINGS_DIR) $(FIGURES_DIR)
	mkdir -p build
	pdflatex -output-directory=build -shell-escape thesis
	bibtex build/thesis
	pdflatex -output-directory=build -shell-escape thesis
	pdflatex -output-directory=build -shell-escape thesis
	cp build/thesis.pdf .

