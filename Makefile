PHONY: all

all:
	argbash -o integrate integrate.m4
	chmod +x integrate

install:
	install integrate /usr/local/bin/integrate

uninstall:
	rm /usr/local/bin/integrate
