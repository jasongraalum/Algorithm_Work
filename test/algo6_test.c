#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *nums;

   initRandGen();
   nums = genRandomArray(10,100000);

   for(int i = 0; i < 10; i++)
   {
      printf("%d -> %d binary digits\n", nums->payload[i],binaryDigits((unsigned int)nums->payload[i]));
   }

}

