#include "algo1.h"

int findLargest(struct dataArray *data)
{
   int largest;

   largest = 0;
   for(int index = 0; index < data->size; index++)
   {
      if(data->payload[index] > data->payload[largest])
         largest = index;
   }

   return(largest);
}


int findValue(struct dataArray *data, int val)
{
   int index = 0;
   while((index < data->size) &&(data->payload[index] != val))
      index++;

   return(index);
}


int findDuplicates(struct dataArray *data)
{
   int index_outer = 0;
   int index_inner;
   int match = 0;
   while((index_inner < data->size-1) && !match)
   {
      index_outer = index_inner+1;
      while((index_outer < data->size) && !match)
      {
         if(data->payload[index_outer] == data->payload[index_inner])
            match = 1;
         index_inner++;
      }
      index_outer++;
   }

   return(match);
}


int dotProduct(struct dataArray *vector1, struct dataArray *vector2)
{
   int dp=0;
   if(vector1->size != vector2->size)
      return(-1);

   for(int index = 0; index < vector1->size; index++)
      dp = dp + (vector1->payload[index] * vector2->payload[index]);

   return(dp);
}


// Args : Two arrays of ints of m1*n1 and m2*n2 size
// m* : matrix columns
// n* : matrix rows
//
// n1 must equal m2
struct dataArray* matrixBinaryMultiply(struct dataArray *A, struct dataArray *B)
{
   struct dataArray *prodArray;
   int A_row, B_col, prod_index;
   int m, n, p;
   int sum;

   if(A->row != B->col)
   {
      printf("Matricies are not compatible:(%d x %d) and (%d x %d)\n", A->row, A->col, B->row, B->row);
      return(NULL);
   }

   m = A->row;
   n = A->col;
   p = B->row;

   prodArray = malloc(sizeof(struct dataArray));
   prodArray->payload = malloc(sizeof(int)*n*p);
   prodArray->size = n*p;
   prodArray->row = n;
   prodArray->col = p;

   prod_index = 0;
   for(int i = 0; i < n; i++)
   {
      A_row = i;
      for(int j = 0; j < p; j++)
      {
         B_col = j;
         prod_index = A_row*p + B_col;
         sum = 0;
         prodArray->payload[prod_index] = 0;
         for(int k = 0; k < m; k++)
            sum = sum + A->payload[A_row*m+k]*B->payload[B_col+k*p];
         prodArray->payload[prod_index] = (sum > 0) ? 1 : 0;
      }

   }

   return(prodArray);

}
// Args : Two arrays of ints of m1*n1 and m2*n2 size
// m* : matrix columns
// n* : matrix rows
//
// n1 must equal m2
struct dataArray* matrixMultiply(struct dataArray *A, struct dataArray *B)
{
   struct dataArray *prodArray;
   int A_row, B_col, prod_index;
   int m, n, p;

   if(A->row != B->col)
   {
      printf("Matricies are not compatible:(%d x %d) and (%d x %d)\n", A->row, A->col, B->row, B->row);
      return(NULL);
   }

   m = A->row;
   n = A->col;
   p = B->row;

   prodArray = malloc(sizeof(struct dataArray));
   prodArray->payload = malloc(sizeof(int)*n*p);
   prodArray->size = n*p;
   prodArray->row = n;
   prodArray->col = p;

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


// Args : Two arrays of ints of m1*n1 and m2*n2 size
// m* : matrix columns
// n* : matrix rows
//
// n1 must equal m2
int binaryDigits(unsigned int n)
{
   int digits = 0;
   while(n)
   {
      n = n>>1;
      digits++;
   }

   return(digits);
}

