.PHONY: all format
.SUFFIXES: .lua .fnl
SRCFILE=compe-nextword

all: format lua/$(SRCFILE).lua

format: fnl/$(SRCFILE).fnl 
	fnlfmt --fix $<

lua/$(SRCFILE).lua: fnl/$(SRCFILE).fnl
	fennel --compile $< > $@
