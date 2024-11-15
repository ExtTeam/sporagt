#!/usr/bin/make
SHELL = /bin/bash

init:
	chmod +x ./sh/*.sh
tls:
	./sh/tls.sh