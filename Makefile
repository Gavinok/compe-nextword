.PHONY: deps compile test
.SUFFIXES: .lua .fnl .ps .pdf .PDF .html

all: lua/compe-nextword.lua

lua/compe-nextword.lua: fnl/compe-nextword.fnl
	fennel --compile $< > $@
