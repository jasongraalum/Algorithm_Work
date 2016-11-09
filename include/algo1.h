#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#ifndef DATA_STRUCT_DEF
   #include "data.h"
   #define KEY_TYPE K_INT
   #define PAYLOAD_TYPE P_INT
   #define STRUCT_TYPE S_ARRAY
   #include "data_struct.h"
   #define DATA_STRUCT_DEF
#endif


struct element *findLargest(struct dataArray*);
int findValue(struct dataArray*,int);
int findDuplicates(struct dataArray*);
int dotProduct(struct dataArray*, struct dataArray*);
struct dataArray* matrixMultiply(struct dataArray*, struct dataArray*, int, int, int);
int binaryDigits(unsigned int);



