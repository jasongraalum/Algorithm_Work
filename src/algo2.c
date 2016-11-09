#include "algo1.h"

int findValue(struct dataArray *data, int val)
{
   int index = 0;
   while((index < data->size) &&(data->payload[index] != val))
      index++;

   return(index);
}

