#include <stdio.h>
#include <stdlib.h>

typedef struct queueNode {
   int priority;
   int index;
   struct queueNode *next;
} queueNode;

typedef struct priorityQueue {
   struct queueNode *head;
} priorityQueue;

struct queueNode* dequeue(struct priorityQueue *p);
int enqueueMin(struct priorityQueue *q, struct queueNode *node);
int enqueueMax(struct priorityQueue *q, struct queueNode *node);


