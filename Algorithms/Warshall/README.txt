/*
 *  Jason Graalum
 *  November 23, 2016
 *  New Beginnings - Theory II
 *  Programming Assignment #5
 *
 */

Files/Directories:
./Makefile - root makefile for building program
./README.txt - this file
./typescript - output of test runs using testcases/graph4.txt and testcases/graph5.txt
./src - C code
   main.c - main program for assignment PA5
   dijkstra_sssp.c - implementation of Dijkstra's Single Source Shortest Path algorithm - using minHeap for sorting.
   Makefile - local makefile call by root makefile
./inc - Header file
   dijkstra_ssap.h - function prototypes
./common/(src/inc/obj) - Common Algorithms
   heapSort.c - Minimum heap sort implementation
   directedGraph.c - Directed Graph implementation and support.
   dataStructs.c - Implementation of various data structures - queue, stack, etc.
   utils.c - Various utility functions.
./obj - Compiled object code
   locaion of all object codes
./bin - Executables
   location of executable(created by root Makefile
./tests - Test graphs
   graph4.txt
   graph5.txt

To compile:
% make -B all

To run tests:
% make test4
% make test5

To run manually:
% ./bin/dijkstra 
<enter graph filename>
<enter source node>

OR
% ./bin/dijkstra <graph filename> <source node #>

