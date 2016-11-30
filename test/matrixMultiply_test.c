#include <stdio.h>
#include <stdlib.h>
#include "Matrix.h"

int main(int argc, char *argv[])
{
   struct Matrix *matrix1;
   struct Matrix *matrix2;
   struct Matrix *matrix3;

   char *ifn1, *ifn2;
   ifn1 = argv[1];
   ifn2 = argv[2];

   printf("Read Matrix from %s\n", ifn1);
   matrix1 = readMatrixFromFile(ifn1);
   printMatrix(matrix1);

   printf("Read Matrix from %s\n", ifn2);
   matrix2 = readMatrixFromFile(ifn2);
   printMatrix(matrix2);

   printf("\n");
   matrix3 = matrixMultiply(matrix1,matrix2);
   printMatrix(matrix3);

   return(0);
}

