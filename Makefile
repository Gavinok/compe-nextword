.PHONY: deps compile test
.SUFFIXES: .lua .fnl .ps .pdf .PDF .html

all: format lua/compe-nextword.lua

format: fnl/compe-nextword.fnl 
	fnlfmt --fix $<

lua/compe-nextword.lua: fnl/compe-nextword.fnl
	fennel --compile $< > $@
