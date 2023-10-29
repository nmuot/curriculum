SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)

all:    clean $(PDFS) $(HTML)

pdf:   clean $(PDFS)
html:  clean $(HTML)

%.html: %.md style.css
	pandoc $< --standalone -t html -c style.css -o $@

%.pdf:  %.html
#weasyprint $< $@
	wkhtmltopdf --enable-local-file-access  $< $@
# pandoc $< -H header.tex -V papersize=a4paper -o $@

clean:
	rm -f *.html *.pdf
