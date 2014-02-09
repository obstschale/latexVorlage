DOCUMENT_NAME_ORIGINAL = dokumentation
DOCUMENT_NAME = project_name
OUTPUT_DIR    = output
ABGABE_DIR    = ../abgabe/

# Build the LaTeX document.
all: outputdir report cleanup

# Remove output directory.
clean:
	rm -rf $(OUTPUT_DIR)

# cleanup tempfiles
cleanup:
	rm -f $(DOCUMENT_NAME).aux $(DOCUMENT_NAME).acn $(DOCUMENT_NAME).glo $(DOCUMENT_NAME).ist $(DOCUMENT_NAME).lof $(DOCUMENT_NAME).lot $(DOCUMENT_NAME).lol $(DOCUMENT_NAME).out $(DOCUMENT_NAME).toc $(DOCUMENT_NAME).alg $(DOCUMENT_NAME).glg $(DOCUMENT_NAME).gls $(DOCUMENT_NAME).acr $(DOCUMENT_NAME).pdf $(DOCUMENT_NAME).blg $(DOCUMENT_NAME).bbl  $(DOCUMENT_NAME).fdb_latexmk $(DOCUMENT_NAME).synctex.gz

# Create LaTeX output directory.
outputdir:
	$(shell mkdir $(OUTPUT_DIR) 2>/dev/null)

# Generate PDF output from LaTeX input files.
report:
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	bibtex $(DOCUMENT_NAME)
	makeglossaries -q $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	cp $(DOCUMENT_NAME).pdf $(OUTPUT_DIR)

rename:
	mv $(DOCUMENT_NAME_ORIGINAL).tex $(DOCUMENT_NAME).tex
