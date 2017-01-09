/*
 *  main.c
 *
 *  Jason Graalum
 *  November 15, 2016 *  New Beginnings - Theory II *  Programming Assignment #4
 *
 *  Main program to read input file, build graph and run search functions
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include "directedGraph.h"
#include "utils.h"
#include "warshall.h"

int main(int argc, char* argv[])
{
   char *filename;
   struct DirectedGraph *dgraph1;
   struct boolMatrix **R;


// struct dijData **data;

   if(argc == 1)
   {
      printf("Enter directed graph filename: ");
      filename = readLineFromFile(stdin,MAX_FILENAME_LEN);
   }
   else if(argc == 2)
   {
      filename = argv[1];
   }

   printf("Reading data from %s\n", filename);
   dgraph1 = readDirectedGraphFromFile(filename);
   if(dgraph1 == NULL)
   {
      printf("Error reading graph from %s\n", filename);
      return(-1);
   }
   printDirectedGraphInfo(dgraph1);
   printDirectedGraphVertices(dgraph1);
   printDirectedGraphAdjMatrix(dgraph1);

   R = warshall(dgraph1);

   for(int k = 0; k < dgraph1->vertex_cnt; k++)
      printBoolMatrix(R[k]);

}


