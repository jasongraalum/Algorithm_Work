/*
 *  main.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *  Programming Assignment #4
 *
 *  Main program to read input file, build graph and run search functions
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include "Algorithms.h"
#include "Utilities.h"
#include "DirectedGraph.h"
#include "dijkstra_sssp.h"

int main(int argc, char* argv[])
{
   char *filename;
   unsigned int source_node = 0;
   struct DirectedGraph *dgraph1;

   struct dijData {
      int **path;
      int distance;
   };

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
   else if(argc == 3)
   {
      filename = argv[1];
      sscanf(argv[2],"%u",&source_node);
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

//   data = malloc(sizeof(struct dijData*)*dgraph1->vertex_cnt);

   if((source_node < 1) || (source_node > dgraph1->vertex_cnt))
   {
      printf("Enter source node number(1 - %d):",dgraph1->vertex_cnt);
      scanf("%u",&source_node);
   }

   dijkstra_sssp(dgraph1,source_node);
}


