all: build install

build:
	bash bin/build.sh

install:
	bash bin/install.sh

start:
	node rfid.js --debug
