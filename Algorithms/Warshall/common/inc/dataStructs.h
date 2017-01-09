typedef struct dataNode {
   int priority;
   int index;
   void *ptr;
} dataNode;

typedef struct queueNode {
   int priority;
   int index;
   void *ptr;
   struct queueNode *next;
   struct queueNode *prev;
} queueNode;

typedef struct heapNode {
   unsigned int key;
   void *ptr;
} heapNode;

typedef struct Queue {
   struct queueNode *head;
   struct queueNode *tail;
} Queue;

// Array of queueNode to implement Heap
typedef struct Heap {
   char *name;
   int size;
   int *heap_index;
   unsigned int *key;
   void **data;
} Heap;

typedef struct Stack {
   struct queueNode *top;
} Stack;

struct queueNode* dequeue(struct Queue*);
void enqueue(struct Queue*, struct queueNode*);
void enqueueMin(struct Queue*, struct queueNode*);
void enqueueMax(struct Queue*, struct queueNode*);
void  pushStack(struct Stack*, struct queueNode*);
struct queueNode* popStack(struct Stack*);
void heapSort(unsigned int , struct Heap*);
void heapify(unsigned int , struct Heap*);
void printHeap(struct Heap*);


