#include "algo1.h"

int dotProduct(struct dataArray *vector1, struct dataArray *vector2)
{
   int index = 0;
   int dp=0;
   if(vector1->size != vector2->size)
      return(-1);

   for(int index = 0; index < vector1->size; index++)
      dp = dp + (vector1->payload[index] * vector2->payload[index]);

   return(dp);
}

