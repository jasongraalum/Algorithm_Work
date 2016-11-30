/*
 *  Stack.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic support for standard data structures used in a variety of programs
 *
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
#include "Stack.h"

//
// Stack routines
//
void pushStack(struct Stack *s, struct stackNode *node)
{
   node->next = s->top;
   s->top = node;
}

struct stackNode* popStack(struct Stack *s)
{
   struct stackNode* node;
   node = s->top;
   s->top = s->top->next;
   return(node);
}

int printStack(struct Stack *s)
{
   int index = 0;
   struct stackNode *current;
   current = s->top;
   while(current)
   {
      printf("%d: %u\n", index++, current->key);
      current = current->next;
   }
   return(index);
}

