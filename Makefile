DEV_DIR=/home/rossi/.dev
THEME_DIR=$(DEV_DIR)/themes
THEME_DIGINAMIC=$(THEME_DIR)/asciidoctor-playground/slides/themes/diginamic-light-theme.yml
THEME_DIGINAMIC_FONT_DIR=$(THEME_DIR)/asciidoctor-playground/slides/themes/fonts/diginamic

add:
	sudo ln -s $(DEV_DIR)/dev.sh /usr/local/bin/dev

install:
	sudo gem install asciidoctor-pdf --pre
	sudo gem install coderay

pdft:
	asciidoctor-pdf *.adoc -a pdf-style=$(THEME_DIR)/docs.yml
	cp *.pdf pdf/
	rm *.pdf
	rm *.png

pdftdigi:
	asciidoctor-pdf *.adoc -r asciidoctor-diagram -a pdf-style=$(THEME_DIR)/docs-diginamic.yml
	cp *.pdf pdf/
	rm *.pdf
	rm *.png

pdfc:
	asciidoctor-pdf *.adoc -r asciidoctor-diagram -a pdf-style=$(THEME_DIR)/slides.yml
	cp *.pdf pdf/
	rm *.pdf
	rm *.png

pdfdigi:
	asciidoctor-pdf *.adoc -r asciidoctor-diagram -a pdf-style=$(THEME_DIGINAMIC) -a pdf-fontsdir=$(THEME_DIGINAMIC_FONT_DIR)
	cp *.pdf pdf/
	rm *.pdf
	rm *.png

rmnodemodules:
	find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +

gbs:
	gitbook serve

gbi:
	gitbook install

gbis:
	gitbook install && gitbook serve