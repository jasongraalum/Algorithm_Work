/*
 *  dataStructs.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic support for standard data structures used in a variety of programs
 *
 *  queue
 *  priority queue (min and max)
 *  stack
 *
 *  The same data element(queueNode) is used for all structures. The queueNode structure
 *  include a void ptr to another structure that can be defined within the main program
 *  to hold program specific payloads
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "Queue.h"

//
// Queue routines
//
struct queueNode* dequeue(struct Queue *p)
{
   struct queueNode *node;
   node = p->head;
   p->head = p->head->next;
   return(node);
}

void enqueue(struct Queue *q, struct queueNode *node)
{
   q->tail->next = node;
   node->next = NULL;
   q->tail = node;
}

void enqueueMax(struct Queue *q, struct queueNode *node)
{
   struct queueNode *current;
   current = q->head;

   if(!current)
   {
      q->head = node;
      return;
   }
   if(current->priority < node->priority)
   {
      node->next = current;
      q->head = node;
      return;
   }
   
   while(current->next && (current->next->priority > node->priority))
      current = current->next;

   node->next = current->next;
   current->next = node;
   return;
}
void enqueueMin(struct Queue *q, struct queueNode *node)
{
   struct queueNode *current;
   current = q->head;

   if(!current)
   {
      q->head = node;
      return;
   }
   if(current->priority > node->priority)
   {
      node->next = current;
      q->head = node;
      return;
   }
   
   while(current->next && (current->next->priority < node->priority))
      current = current->next;

   node->next = current->next;
   current->next = node;
   return;
}

//
// Stack routines
//
void pushStack(struct Stack *s, struct queueNode *node)
{
   node->next = s->top;
   s->top = node;
}

struct queueNode* popStack(struct Stack *s)
{
   struct queueNode* node;
   node = s->top;
   s->top = s->top->next;
   return(node);
}

