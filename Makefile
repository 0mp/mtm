CC       := gcc
CFLAGS   ?= -O3 -std=c99 -Wall -pedantic
FEATURES ?= -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE_EXTENDED
HEADERS  ?= -DNCURSESW_INCLUDE_H="<ncursesw/curses.h>"
LIBPATH  ?=
DESTDIR  ?= /usr/local
LIBS     ?= -lncursesw -lutil

all: mtm

mtm: tmt.c mtm.c config.h
	$(CC) $(CFLAGS) $(FEATURES) -o $@ $(HEADERS) tmt.c mtm.c $(LIBPATH) $(LIBS)

config.h: config.def.h
	cp -i config.def.h config.h

install: mtm
	cp mtm $(DESTDIR)/bin
	cp mtm.1 $(DESTDIR)/share/man/man1

clean:
	rm -f *.o mtm
