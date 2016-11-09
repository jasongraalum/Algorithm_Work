#include "algo1.h"

int main(int argc, char *argv[])
{
   struct dataArray *matrix1;
   struct dataArray *matrix2;
   struct dataArray *product;

   int m,n,p;

   m = 6;
   n = 8;
   p = 4;
   initRandGen();
   // 6 x 8
   matrix1 = genRandomArray(m*n,10);
   printf("Matrix A\n");
   printDataMatrix(matrix1);
   printf("\n");
   // 4 x 6
   matrix2 = genRandomArray(p*m,10);
   printf("Matrix B\n");
   printDataMatrix(matrix2);
   printf("\n");

   product = matrixMultiply(matrix1, matrix2, m, n, p);
   printf("Multiplication of:\n");
   printDataMatrix(matrix1);
   printf("\n");
   printf("and\n");
   printDataMatrix(matrix2);
   printf("\n");
   printf("is:\n");
   printDataMatrix(product);
   printf("\n");

}

