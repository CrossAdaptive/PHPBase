project := PHPBase
version := 1.1

arch    := $(shell uname)
cpu     := $(shell uname -m)
maxtext := tools/MaxText/maxtext/bin/$(arch)-$(cpu)/maxtext
quasi   := tools/Quasi/_bin/$(arch)-$(cpu)/quasi

all: release

php: $(quasi)
	$(quasi) -f _gen source/mt/*.txt

release: php
	mkdir -p share/mt
	cat source/mt/*.txt > share/mt/$(project)-$(version).mt.txt

clean:
	rm -rf _gen

$(quasi):
	make -C tools quasi
