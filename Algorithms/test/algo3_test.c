#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *data;

   initRandGen();
   data = genRandomArray(100,10000000);

   if(findDuplicates(data))
      printf("Duplicates found.\n");
   else
      printf("No duplicates found.\n");

}

