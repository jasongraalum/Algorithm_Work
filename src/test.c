#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *matrix;
   struct dataArray *matrix2;

   char *ifn;
   ifn = argv[1];


   printf("Read Matrix from %s\n", ifn);
   matrix = readMatrix(ifn);
   printDataMatrix(matrix);

   matrix2 = matrixMultiply(matrix,matrix);
   printDataMatrix(matrix2);



   return(0);
}

