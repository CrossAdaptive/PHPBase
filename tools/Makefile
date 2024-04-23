arch := $(shell uname)
cpu  := $(shell uname -m)

quasi := Quasi/_bin/$(arch)-$(cpu)/quasi


all: extract maxtext mysqlscripts quasi

extract: Extract Extract/bin/$(arch)-$(cpu)/extract

Extract/bin/$(arch)-$(cpu)/extract:
	make -C Extract

Extract:
	git clone https://github.com/danielbradley/Extract.git

maxtext: MaxText MaxText/maxtext/bin/$(arch)-$(cpu)/maxtext

MaxText/maxtext/bin/$(arch)-$(cpu)/maxtext:
	export OSTYPE
	make -C MaxText/maxtext all

MaxText:
	git clone https://github.com/danielbradley/MaxText.git

mysqlscripts: MySQLScripts ../mysql.sh

../mysql.sh:
	make -C MySQLScripts install

MySQLScripts:
	git clone https://github.com/danielbradley/MySQLScripts.git

quasi: Quasi $(quasi)

Quasi:
	git clone https://github.com/danielbradley/Quasi.git

$(quasi):
	make -C Quasi

clean:
	rm -rf Extract MaxText MySQLScripts Quasi
	rm  -f ../backup.sh
	rm  -f ../install.sh
	rm  -f ../mysql.sh
