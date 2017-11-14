DEV_DIR=/home/rossi/.dev
THEME_DIR=$(DEV_DIR)/themes

add:
	sudo ln -s $(DEV_DIR)/dev.sh /usr/local/bin/dev

install:
	sudo gem install asciidoctor-pdf --pre
	sudo gem install coderay

pdft:
	asciidoctor-pdf *.adoc -a pdf-style=$(THEME_DIR)/docs.yml
	cp *.pdf pdf/
	rm *.pdf

pdfc:
	asciidoctor-pdf *.adoc -a pdf-style=$(THEME_DIR)/slides.yml
	cp *.pdf pdf/
	rm *.pdf