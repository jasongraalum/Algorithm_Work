#include "algo1.h"

// Args : Two arrays of ints of m1*n1 and m2*n2 size
// m* : matrix columns
// n* : matrix rows
//
// n1 must equal m2
struct dataArray* matrixMultiply(struct dataArray *A, struct dataArray *B, int m, int n, int p)
{
   struct dataArray *prodArray;
   int A_row, B_col, prod_index;

   prodArray = malloc(sizeof(struct dataArray));
   prodArray->payload = malloc(sizeof(int)*n*p);

   prod_index = 0;
   for(int i = 0; i < n; i++)
   {
      A_row = i;
      for(int j = 0; j < p; j++)
      {
         B_col = j;
         prod_index = A_row*p + B_col;
         prodArray->payload[prod_index] = 0;
         for(int k = 0; k < m; k++)
            prodArray->payload[prod_index] = prodArray->payload[prod_index] + A->payload[A_row*m+k]*B->payload[B_col+k*p];
      }
   }

   return(prodArray);

}

