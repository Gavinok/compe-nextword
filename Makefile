.PHONY: deps compile test
.SUFFIXES: .lua .fnl .ps .pdf .PDF .html
SRCFILE=compe-nextword

all: format lua/$(SRCFILE).lua

format: fnl/$(SRCFILE).fnl 
	fnlfmt --fix $<

lua/$(SRCFILE).lua: fnl/$(SRCFILE).fnl
	fennel --compile $< > $@
