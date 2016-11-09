#include "algo1.h"

int *findLargest(struct dataArray *data)
{
   int largest;
   int index = 0;

   largest = 0;
   index++;
   for(int index = 0; index < data->size; index++)
   {
      if(data->payload[index] > data->payload[largest])
         largest = index;
   }

   return(data->payload[largest]);
}

