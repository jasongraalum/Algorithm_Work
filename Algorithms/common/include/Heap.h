typedef struct heapNode {
   unsigned int key;
   unsigned int index;
   void *data;
} heapNode;

typedef struct Heap {
   char *name;
   int size;
   int *heap_index;
   unsigned int *key;
   void **data;
} Heap;

void heapify(unsigned int , struct Heap*);
void printHeap(struct Heap*);


