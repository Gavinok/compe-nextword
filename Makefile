.PHONY: deps compile test
.SUFFIXES: .lua .fnl .ps .pdf .PDF .html

all: lua/compe_nextword.lua

lua/compe_nextword.lua: fnl/compe_nextword.fnl
	fennel --compile $< > $@
