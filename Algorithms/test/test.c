#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *matrix;
   struct dataArray *matrix2, *matrix3, *matrix4;

   char *ifn;
   ifn = argv[1];


   printf("Read Matrix from %s\n", ifn);
   matrix = readMatrix(ifn);
   printDataMatrix(matrix);

   printf("\n");
   matrix2 = matrixBinaryMultiply(matrix,matrix);
   printDataMatrix(matrix2);

   printf("\n");
   matrix3 = matrixBinaryMultiply(matrix2,matrix);
   printDataMatrix(matrix3);

   printf("\n");
   matrix4 = matrixBinaryMultiply(matrix3,matrix);
   printDataMatrix(matrix4);



   return(0);
}

