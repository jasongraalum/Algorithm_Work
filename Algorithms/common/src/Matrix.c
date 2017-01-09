/*
   Jason Graalum
   NEW BEGINNINGS Theory II 

File: Matrix.c
*/
#include <stdlib.h>
#include <stdio.h>
#include "Utilities.h"
#include "Matrix.h"

   /* psuedo code
    * 
    * inputs: m1, m2
    * if vector_size(m1)  vector_size(m2)  rows or cols don't match
    *    exit with error
    * NOTE: Since pointers to arrays are passed, there is no
    * way to find the "real" length. The function that reads
    * the file must do the checking.
    *
    * dp = 0 // dotProduct result
    * for i = 0 to n-1
    *   dp += m1[i]*m2[i]
    * return dp
    *
    */
double dotProduct(struct Matrix *m1, struct Matrix *m2)
{
   double dp = 0.0;
   if((m1->rows != m2->rows) || (m1->cols != m2->cols))
   {
      printf("Matrices are of different sizes - cannot calculate the dot product.\n");
      return(-1);
   }

   for(int i = 0; i < m1->rows*m1->cols; ++i)
   {
      dp += (double)(m1->key[i] * m2->key[i]);
   }

   return(dp);
}

struct Matrix* matrixMultiply(struct Matrix *m1, struct Matrix *m2)
   /* psuedo code
    *
    * Inputs: l,m,n - int: size of matrix(lxm and mxn)
    *         m1 - pointer to array of integers = n*n elements
    *         m2 - pointer to array of integers = n*n elements
    * Outputs:
    *         mResult - pointer to array of integers = ?? elements
    *
    */
{

   int l, m, n;
   struct Matrix *mResult;
   l = m1->rows;
   m = m1->cols; // And m2->rows
   n = m2->cols;

   if(m != m2->rows)
   {
      printf("Matrix size mismatch: Unable to multiply %uX%u and %uX%u matrices.\n", l,m,m2->rows,n);
      return(NULL);
   }

   mResult = malloc(sizeof(struct Matrix));
   mResult->key = malloc(sizeof(int)*l*n);
   mResult->rows = l;
   mResult->cols = n;

   int i, j, k;
   for(i = 0; i < l; i++)
   {
      for(j = 0; j < n; j++)
      {
         mResult->key[i*l+j] = 0;
         for(k = 0; k < m; k++)
         {
            mResult->key[i*l+j] += m1->key[i*m+k] * m2->key[j+k*n];
         }
      }
   }

   return(mResult);
}

struct Matrix* readMatrixFromFile(char *fname)
{
   FILE *fp;
   char *line;
   unsigned int rows, cols;

   struct Matrix *m;

   fp = fopen(fname,"r");

   //
   // Read first line to get rows and cols
   //
   line = readLineFromFile(fp,256);
   sscanf(line,"%u %u", &rows, &cols);
   printf("Matrix has %u rows and %u columns\n", rows,cols);

   m = malloc(sizeof(struct Matrix));
   m->key = calloc(sizeof(unsigned int),rows*cols);
   m->rows = rows;
   m->cols = cols;

   for(int i = 0; i < rows; i++)
   {
      for(int j = 0; j < cols; j++)
      {
         fscanf(fp, "%u", &(m->key[i*rows+j])); 
      }
   }

   return(m);
}

void printMatrix(struct Matrix *m)
{
   for(int i = 0; i < m->rows; i++)
   {
      for(int j = 0; j < m->cols; j++)
      {
         printf("%4u",m->key[(i*m->rows)+j]);
      }
      printf("\n");
   }
}

