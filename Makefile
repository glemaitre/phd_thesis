BASENAME=thesis
NAME=$(BASENAME).tex
PDF=$(BASENAME).pdf
LATEX_COMPILER=pdflatex
LATEX_FLAGS=-shell-escape
BIB_COMPILER=bibtex

pdf:
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)
	$(BIB_COMPILER) $(BASENAME)
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)

clean:
	find . -name "*.aux" -o -name "*.bb" -o -name "*.bl" -o -name "*.lo" -o -name "*.lo" -o -name "*.soc" | xargs rm -f
	find . -name "*.nl" -o -name "*.ou" -o -name "*.to" -o -name "*.bc" -o -name "*.run.xml" | xargs rm -f
	find . -name "*.bbl" -o -name "*.blg" -o -name "*.fdb_latexmk" -o -name "*.fls" -o -name "*.log" | xargs rm -f
	find . -name "*.toc" -o -name "*.synctex.gz" -o -name "*.acn" -o -name "*.glo" -o -name "*.ist" | xargs rm -f
	find . -name "*.lof" -o -name "*.lot" -o -name "*.out" -o -name "*.acr" -o -name "*.alg" | xargs rm -f
	find . -name "*.glg" -o -name "*.gls" -o -name "*.glsdefs" -o -name "*.cb" -o -name "*.cb2" | xargs rm -f
