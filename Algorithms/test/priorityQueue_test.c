#include <stdio.h>
#include <stdlib.h>
#include "Utilities.h"
#include "Queue.h"

typedef struct testData {
   char c;
} testData;

int main(int argc, char *argv[])
{

   struct Queue *maxQueue;
   struct Queue *nomQueue;
   struct Queue *minQueue;
   struct testData **data;
   struct queueNode *maxNode;
   struct queueNode *minNode;
   struct queueNode *nomNode;

   maxQueue = malloc(sizeof(struct Queue));
   nomQueue = malloc(sizeof(struct Queue));
   minQueue = malloc(sizeof(struct Queue));
   maxQueue->head = NULL;
   nomQueue->head = NULL;
   minQueue->head = NULL;

   data = malloc(sizeof(struct testData*)*20);

   for(int i = 0; i < 20; i++)
   {
      data[i] = malloc(sizeof(struct testData));
      data[i]->c = getRandomChar();

      maxNode = malloc(sizeof(struct queueNode));
      minNode = malloc(sizeof(struct queueNode));
      nomNode = malloc(sizeof(struct queueNode));

      minNode->data = data;
      minNode->key = getRandomInt(0,99);
      minNode->index = i;

      maxNode->data = data;
      maxNode->key = getRandomInt(0,99);
      maxNode->index = i;

      nomNode->data = data;
      nomNode->key = getRandomInt(0,99);
      nomNode->index = i;

      enqueueMax(maxQueue, maxNode);
      enqueueMin(minQueue, minNode);
      enqueue(nomQueue, nomNode);
   }
   printf("Max Queue:\n");
   printQueue(maxQueue);
   printf("\nMin Queue:\n");
   printQueue(minQueue);
   printf("\nNom Queue:\n");
   printQueue(nomQueue);
}

