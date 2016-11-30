/*
 *  Heap.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic support for standard data structures used in a variety of programs
 *
 *  heap
 *
 *  The same data element(queueNode) is used for all structures. The queueNode structure
 *  include a void ptr to another structure that can be defined within the main program
 *  to hold program specific payloads
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "Heap.h"

void heapify(unsigned int n, struct Heap *heap)
{
   //Psuedo Code
   // Input: n - size of array
   //        data[0:n-1] - unsorted data
   // Output: sorted data[0:n-1]
   // Shift all array indexes down by 1.
   //
   // for i : n/2 to 1
   //   k = i
   //   v = data[k]
   //   heaped = 0
   //   while !heaped && 2*k < n
   //     j = 2 * k
   //     if j < n
   //       if data[j-1] < data[j]
   //         j++
   //     if v >= data[j-1]
   //       heaped = 1
   //     else
   //       data[k-1] = data[j-1]
   //       k = j
   //    data[k-1] = v
   //
   //
   unsigned int i, j, k;
   unsigned int v_index;
   int heaped;

   for(i = n/2; i > 0; i--)
   {
      k = i;
      v_index = heap->heap_index[k-1];
      heaped = 0;

      while(!heaped && (2*k <= n))
      {
         j = 2 * k;
         if(j < n)
         {
            if(heap->key[heap->heap_index[j-1]] > heap->key[heap->heap_index[j]])
            {
               j++;
            }
         }
         if(heap->key[v_index] <= heap->key[heap->heap_index[j-1]])
         {
            heaped = 1;
         }
         else
         {
            heap->heap_index[k-1] = heap->heap_index[j-1];
            k = j;
         }
      }
      heap->heap_index[k-1] = v_index;
   }
}

void printHeap(struct Heap *heap)
{
   for(unsigned int i = 0; i < heap->size; i++) {
      printf("i = %u: key = %u\tindex = %d\n",i,heap->key[i],heap->heap_index[i]);
   }
}

