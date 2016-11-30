
INCLUDE_OPTS = -I../include/ 
CC = gcc

CFLAGS = -g -Wall 

all: DFA.o Matrix.o Heap.o DirectedGraph.o Stack.o Queue.o Utilities.o 

.c.o:
	$(CC) $(CFLAGS) $(INCLUDE_OPTS) -c $<; mv *.o ../obj
