#include "priorityQueue.h"

struct queueNode* dequeue(struct priorityQueue *p)
{
   struct queueNode *node;
   node = p->head;
   p->head = p->head->next;
   return(node);
}

int enqueueMax(struct priorityQueue *q, struct queueNode *node)
{
   struct queueNode *current;
   current = q->head;

   if(!current)
   {
      q->head = node;
      return(0);
   }
   if(current->priority < node->priority)
   {
      node->next = current;
      q->head = node;
      return(0);
   }
   
   while(current->next && (current->next->priority > node->priority))
      current = current->next;

   node->next = current->next;
   current->next = node;
   return(0);
}
int enqueueMin(struct priorityQueue *q, struct queueNode *node)
{
   struct queueNode *current;
   current = q->head;

   if(!current)
   {
      q->head = node;
      return(0);
   }
   if(current->priority > node->priority)
   {
      node->next = current;
      q->head = node;
      return(0);
   }
   
   while(current->next && (current->next->priority < node->priority))
      current = current->next;

   node->next = current->next;
   current->next = node;
   return(0);
}


