
INCLUDE_OPTS = -I../inc/ 
CC = gcc

CFLAGS = -g -Wall 

all: dataStructs.o heapSort.o directedGraph.o utils.o 

.c.o:
	$(CC) $(CFLAGS) $(INCLUDE_OPTS) -c $<; mv *.o ../obj
