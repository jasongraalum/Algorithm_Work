#include "algo1.h"

int findDuplicates(struct dataArray *data)
{
   int index_outer = 0;
   int index_inner;
   int match = 0;
   while((index_inner < data->size-1) && !match)
   {
      index_outer = index_inner+1;
      while((index_outer < data->size) && !match)
      {
         if(data->payload[index_outer] == data->payload[index_inner])
            match = 1;
         index_inner++;
      }
      index_outer++;
   }

   return(match);
}

