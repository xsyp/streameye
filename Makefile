
ifdef DEBUG
	CFLAGS = -Wall -g -D_GNU_SOURCE
else
    CFLAGS = -Wall -O2 -D_GNU_SOURCE
endif

LDFLAGS = -lpthread
PREFIX = /usr/local

all: streameye

streameye.o: streameye.c streameye.h client.h common.h
	$(CC) $(CFLAGS) -c -o streameye.o streameye.c

client.o: client.c client.h streameye.h common.h
	$(CC) $(CFLAGS) -c -o client.o client.c

streameye: streameye.o client.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o streameye streameye.o client.o

install: streameye
	cp streameye $(PREFIX)/bin

clean:
	rm -f *.o
	rm -f streameye
