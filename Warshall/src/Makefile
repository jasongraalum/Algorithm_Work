COMMON_DIR = ../common/inc

INCLUDE_OPTS = -I../inc/ -I$(COMMON_DIR)
CC = gcc

CFLAGS = -g -Wall 

all: main.o warshall.o 

.c.o:
	$(CC) $(CFLAGS) $(INCLUDE_OPTS) -c $<; mv *.o ../obj
