NAME:=ataskaita
TEX_FILE:=$(NAME).tex
PDF_FILE:=$(NAME).pdf

.PHONY: pdf ubuntu wordcount check clean

pdf:
	latexmk -lualatex -halt-on-error $(TEX_FILE)
	open kursinis.pdf || xdg-open $(PDF_FILE)

ubuntu:
	@echo "Diegiamas LaTeX (LuaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full

wordcount:
	texcount -total -utf8 $(TEX_FILE)

check:
	chktex $(TEX_FILE)

clean:
	git clean -dfX
