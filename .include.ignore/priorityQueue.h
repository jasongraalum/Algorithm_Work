#include <stdio.h>
#include <stdlib.h>

typedef struct queueNode {
   int priority;
   int index;
   struct queueNode *next;
} queueNode;

typedef struct Queue {
   struct queueNode *head;
   struct queueNode *last;
} Queue;

struct queueNode* dequeue(struct Queue *p);
struct queueNode* enqueue(struct Queue *p);
int enqueueMin(struct Queue *q, struct queueNode *node);
int enqueueMax(struct Queue *q, struct queueNode *node);


