#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *data;
   int largest;

   initRandGen();
   data = genRandomArray(100,100);

   largest = findLargest(data);

   printDataArray(data);

   printf("%d\n", data->payload[largest]);
}

