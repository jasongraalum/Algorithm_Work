#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *data;
   int found_index;
   initRandGen();
   data = genRandomArray(100,100);

   printf("Looking for %d\n", data->payload[32]);
   found_index = findValue(data,data->payload[32]);

   printf("Found %d @ %d\n", data->payload[found_index], found_index);

}

