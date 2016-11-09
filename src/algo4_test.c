#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *vector1;
   struct dataArray *vector2;

   int dp;
   initRandGen();
   vector1 = genRandomArray(10,100);
   vector2 = genRandomArray(10,100);

   dp = dotProduct(vector1, vector2);
   printf("Dot Product of:\n");
   printDataArray(vector1);
   printf("and\n");
   printDataArray(vector2);
   printf("is %d\n",dp);

}

