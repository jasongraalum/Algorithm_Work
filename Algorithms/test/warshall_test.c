/*
 *  main.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Main program to read input file, build graph and run search functions
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include "directedGraph.h"
#include "utils.h"

int main(int argc, char* argv[])
{
   char *filename;
   struct boolMatrix **R;

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
}


