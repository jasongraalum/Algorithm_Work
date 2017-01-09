/*
 *  dataStructs.h
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic implementation of various data structures
 *
 */

#define MAX_LINE_LEN 200

typedef struct Stack {
   int *top; // Integer array pointing to DataStruct index array
   int size; // size of the stack
} Queue;

typedef struct Queue {
   int *head; // Integer array pointing to DataStruct index array
   int tail; // Integer equal to last element in the "head" array - equal to size of the queue
   short int type; // 0bxxxx_xxx0 = Min, 0bxxxx_xxx1 = Max,  Standard = 0bxxx_xx0x, Priority = 0bxxxx_xx1x
} Queue;

// Binary Heap
typedef struct Heap {
   int size; // Number of elements in the heap
   int *index; // Order of elements in the heap - using the 2*index and 2*index+1 for children
} Heap;

typedef struct Edge { 
   int v1;
   int v2;
   int w;
} Edge;

typedef struct Vertex {
   int child_cnt;
   int *children;
} Vertex;

typedef struct adjMatrix {
   int n;
   int *v;
} adjMatrix;

typedef struct DirectedGraph
{
   int vertex_cnt;
   int edge_cnt;
   struct Edge *edge;
   struct Vertex **vertex;
   struct adjMatrix *adj;
   int start_vertex;
} DirectedGraph;

typedef struct DataStruct {
   int *key;  // Value used to sort - same as priority for priorityQueues
   int *index; // Array of int used to access *data[] elements;
   int size; // Number of data[] elements;
   char *name; // Data struct name
   struct Heap *heap;
   struct DirectedGraph *dGraph;
   struct Queue *queue;
   void **data; // void ptr to custom data <- does NOT contain any data used in sorting. Access is specific to any program
} dataNode;

// Array of queueNode to implement Heap

void printDirectedGraphInfo(struct DataStruct *);
void printDirectedGraphVertices(struct DataStruct *);
void printDirectedGraphAdjMatrix(struct DataStruct *);
int readWeightedEdges(struct DataStruct *, FILE*);
int readEdges(struct DataStruct *, FILE*);
struct DataStruct *readDirectedGraphFromFile(char *);

void *dequeue(struct DataStruct*);
void enqueue(struct DataStruct*, void*, int key);
void enqueueMin(struct DataStruct*, void*, int key);
void enqueueMax(struct DataStruct*, void*, int key);

void  pushStack(struct Stack*, void*);
void *popStack(struct DataStruct*);

void heapSort(int n, struct DataStruct*);
void heapify(int n, struct DataStruct*);

