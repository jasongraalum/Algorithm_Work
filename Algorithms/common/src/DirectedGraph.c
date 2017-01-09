/*
 *  directedGraph.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Base functions to create and print a directed, weighted graph.
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include "DirectedGraph.h" 
#include "Utilities.h"

void printDirectedGraphInfo(struct DirectedGraph *dg)
{
   printf("###################\n");
   printf("Graph name: %s\n", dg->graph_name);
   printf("Vertex Count: %d\n", dg->vertex_cnt);
   printf("Edge Count: %d\n", dg->edge_cnt);
   printf("Starting Vertex: %d\n", dg->start_vertex);
   printf("Edge List:\n");
   for(int i = 0; i < dg->edge_cnt; i++)
      printf("\t(%d,%d,%d)\n", dg->edge[i].v1, dg->edge[i].v2,dg->edge[i].w);
   printf("###################\n");

   return;
}

void printDirectedGraphVertices(struct DirectedGraph *dg)
{
   for(int i = 0; i < dg->vertex_cnt; i++)
   {
      printf("Parent Vertex %u-> Children: ", dg->vertex[i]->n);
      for(int j = 0; j < dg->vertex[i]->child_cnt; j++)
      {
         printf("%d ", dg->vertex[i]->children[j]);
      }
      printf("\n");
   }
}

void printDirectedGraphAdjMatrix(struct DirectedGraph *dg)
{
   unsigned int n = dg->vertex_cnt;

   printf("Adjacency Matrix\n");
   printf("     ");
   for(int i = 0; i < n; i++)
      printf("%4d", i+1);
   printf("\n");

   printf("     ");
   for(int i = 0; i < n; i++)
      printf("----");
   printf("\n");

   for(int i = 0; i < n; i++)
   {
      printf("%4d|",i+1);
      for(int j = 0; j < n; j++)
      {
         printf("%4u",dg->adj->v[(i*n)+j]); 
      }
      printf("\n");
   }
}

   
int readWeightedEdges(struct DirectedGraph *dg1, FILE *ifp)
{

   dg1->edge = calloc(sizeof(struct Edge),dg1->edge_cnt);
   dg1->adj = malloc(sizeof(struct adjMatrix));
   dg1->adj->v = calloc(sizeof(int),dg1->vertex_cnt*dg1->vertex_cnt);
   // Read Ordered Pairs
   for(int i = 0; (i < dg1->edge_cnt) && !feof(ifp); i++)
   {
      unsigned int v1, v2, w;
      char line[100];
      fscanf(ifp,"%s\n", line);
      if(line[0] == '(')
      {
         if(sscanf(line,"(%u,%u,%u)", &v1, &v2, &w) != 3)
         {
            printf("Unable to read edge list from %s.\n",line);
            return(-1);
         }
      }
      else
      {
         sscanf(line,"%u",&v1);
         fscanf(ifp,"%u",&v2);
         fscanf(ifp,"%u",&w); 
      }
      if((v1 < 1) || (v1 > dg1->vertex_cnt) || (v2 < 1) || (v2 > dg1->vertex_cnt))
      {
         printf("Edge vertices out of range[1-%u]:(%u, %u)\n",dg1->vertex_cnt,v1,v2);
         return(-1);
      }
      dg1->edge[i].v1 = v1;
      dg1->edge[i].v2 = v2;
      dg1->edge[i].w = w;

      //
      // Build Adjacency Matrix
      //
      dg1->adj->v[((v1-1)*dg1->vertex_cnt)+(v2-1)] = w;

      //
      // Build Graph Tree
      //
      if(dg1->vertex[v2-1] == NULL)
      {
         dg1->vertex[v2-1] = malloc(sizeof(struct Vertex));
         dg1->vertex[v2-1]->n = v2;
         dg1->vertex[v2-1]->child_cnt = 0;
      }

      if(dg1->vertex[v1-1] == NULL)
      {
         dg1->vertex[v1-1] = malloc(sizeof(struct Vertex));
         dg1->vertex[v1-1]->n = v1;
         dg1->vertex[v1-1]->children = malloc(sizeof(unsigned int*));
         dg1->vertex[v1-1]->children[0] = v2;
         dg1->vertex[v1-1]->child_cnt = 1;
      }
      else
      {
         dg1->vertex[v1-1]->child_cnt = dg1->vertex[v1-1]->child_cnt + 1;
         unsigned int cnt = dg1->vertex[v1-1]->child_cnt;
         dg1->vertex[v1-1]->children = realloc(dg1->vertex[v1-1]->children, sizeof(unsigned int*)*cnt);
         dg1->vertex[v1-1]->children[cnt-1] = v2;
      }
   }
   for(int i = 0; i < dg1->vertex_cnt; i++)
   {
      if(dg1->vertex[i] == NULL)
      {
         dg1->vertex[i] = malloc(sizeof(struct Vertex));
         dg1->vertex[i]->n = i+1;
         dg1->vertex[i]->child_cnt = 0;
         dg1->vertex[i]->children = NULL;
      }
   }
   return(0);
}


struct DirectedGraph* readDirectedGraphFromFile(char *filename)
{
   struct DirectedGraph *dg1;
   FILE *ifp;
   char *line;

   ifp = fopen(filename,"r");

   if(ifp == NULL)
   {
      printf("Unable to open file(%s). Exitting.\n", filename);
      return(0);
   }

   dg1 = malloc(sizeof(struct DirectedGraph));

   // Read Graph Name
   line = NULL;
   line = readLineFromFile(ifp,MAX_LINE_LEN);
   if(line == NULL)
   {
      printf("Unable to read graph name.\n");
      return(0);
   }
   printf("%s\n",line);
   dg1->graph_name = line;

   // Read Number of Vertices
   if(fscanf(ifp,"%u", &(dg1->vertex_cnt)) != 1)
   {
      printf("Unable to read number of vertices.\n");
      return(0);
   }
   dg1->vertex = calloc(sizeof(struct Vertex*),dg1->vertex_cnt);

   // Read Number of Edges
   if(fscanf(ifp,"%u", &(dg1->edge_cnt)) != 1)
   {
      printf("Unable to read number of edges.\n");
      return(0);
   }
   if(readWeightedEdges(dg1, ifp))
      return(0);

   // Read Starting Vertex
   if(fscanf(ifp,"%u",&(dg1->start_vertex)) != 1)
   {
      printf("Unable to read starting vertex.\n");
      return(0);
   }

   return(dg1);
}


