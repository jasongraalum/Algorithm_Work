/*
 *  graph.h
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic implementation of a directed, weighted graph
 *
 */
#include "dataStructs.h"

#define MAX_LINE_LEN 200

typedef struct Edge { 
   unsigned int v1;
   unsigned int v2;
   unsigned int w;
} Edge;

typedef struct Vertex {
   char *name;
   unsigned int n;
   unsigned int child_cnt;
   unsigned int *children;
} Vertex;

typedef struct boolMatrix {
   unsigned int n;
   unsigned char *v;
} boolMatrix;

typedef struct adjMatrix {
   unsigned int n;
   unsigned int *v;
} adjMatrix;

typedef struct DirectedGraph
{
   char *graph_name;
   unsigned int vertex_cnt;
   unsigned int edge_cnt;
   struct Edge *edge;
   struct Vertex **vertex;
   struct adjMatrix *adj;
   unsigned int start_vertex;
} DirectedGraph;

void printDirectedGraphInfo(struct DirectedGraph *);
void printDirectedGraphVertices(struct DirectedGraph *);
void printDirectedGraphAdjMatrix(struct DirectedGraph *);
int readWeightedEdges(struct DirectedGraph *, FILE*);
int readEdges(struct DirectedGraph *, FILE*);
struct DirectedGraph *readDirectedGraphFromFile(char *);
void printBoolMatrix(struct boolMatrix *);
