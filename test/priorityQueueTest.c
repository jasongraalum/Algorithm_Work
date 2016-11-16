#include <stdio.h>
#include <stdlib.h>
#include "data_utilities.h"
#include "priorityQueue.h"

typedef struct testData {
   char c;
   int i;
} testData;

int main(int argc, char *argv[])
{

   struct priorityQueue *pQueue;
   struct testData **data;
   struct queueNode *node;


   pQueue = malloc(sizeof(pQueue));
   pQueue->head = NULL;
   data = malloc(sizeof(struct testData*)*20);
   for(int i = 0; i < 20; i++)
   {
      data[i] = malloc(sizeof(struct testData));
      data[i]->c = getRandomChar();
      data[i]->i = getRandomInt(0,99);
      node = malloc(sizeof(struct queueNode*));
      node->index = i;
      node->priority = data[i]->i;
      enqueueMax(pQueue, node);
   }
   node = pQueue->head;
   while(node)
   {
      printf("%d: %c %d\n", node->index,data[node->index]->c, data[node->index]->i);
      node = node->next;
   }
}

