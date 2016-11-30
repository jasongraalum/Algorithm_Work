// heapSort.c
//
// Jason E. Graalum
// October 14, 2016
// New Beginnings - Theory II
//
//
#include <stdio.h>
#include <stdlib.h>
#include "dataStructs.h"

void heapSort(int n,struct DataStruct *dataS)
{
   // Swap data[0] with data[n-1]
   //
   if(n > 1)
   {
      heapify(n,dataS);

      int temp = dataS->heap->index[0];
      dataS->heap->index[0] = dataS->heap->index[n-1];
      dataS->heap->index[n-1] = temp;

      // Recurse with sortHeap on smaller array
      heapSort(n-1,dataS);
   }
}
void heapify(int n, struct DataStruct *dataS)
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
   int i, j, k;
   int v;
   int v_index;
   char heaped;

   for(i = n/2; i > 0; i--)
   {
      k = i;
      v_index = heap->heap[k-1];
      v = heap->data[v_index]->key;
      heap = 0;

      while(!heaped && (2*k <= n))
      {
         j = 2 * k;
         if(j < n)
         {
            if(heap->data[heap->heap_index[j-1]]->key < heap->data[heap->heap_index[j]]->key)
            {
               j++;
            }
         }
         if( (heap->data[v]->key) >= (heap->data[heap->heap_index[j-1]]->key))
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
