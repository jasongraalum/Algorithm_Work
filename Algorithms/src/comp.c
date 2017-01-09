#include "comp.h"
/*
   Jason Graalum
   Submitted: October 1, 2016
   NEW BEGINNINGS Theory II 
   Programming Assignment 1

   File: comp.c
*/
double dotProduct(int n, int *m1, int *m2)
/* psuedo code
 * 
 * inputs: n, m1, m2
 * if vector_size(m1) OR vector_size(m2) != n
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
{
   double dp = 0.0;
   for(int i = 0; i < n; ++i)
   {
      dp += (double)(m1[i] * m2[i]);
   }

   return(dp);
}

int gcd(int m,int n)
/* psuedo code
 *
 * inputs: int m, int n > 0
 *
 * if either m or n < 1
 *    exit with error
 *
 * while n != 0
 *   t = n
 *   n = m mod n
 *   m = t
 *
 * return m
 *
 */
{
   int temp;

   if(m*n == 0)
   {
      printf("Error: each integer input must be non-zero\n");
      return(0);
   }

   // Based on Theorom that gcd is equivalent to gcd of absolute values
   if(m < 0) m = m * -1;
   if(n < 0) n = n * -1;

   while(n != 0)
   {
      temp = n;
      n = m % n;
      m = temp;
   }
   return(m);
}
      

int lcm(int m, int n)
/* psuedo code
 *
 * inputs: int m, int n
 *
 * if either m or n < 1
 *    exit with error
 *
 * BRUTE
 * for i = 1 to m
 *    x = n * i
 *    for j = 1 to n
 *       y = m * j
 *       if y = x
 *           lcm = x
 *           return lcm 
 *
 * LCM will never be less than max(m,n)
 * So, 1 to m can change to rounddown(n/m) + 1
 * and
 *     1 to n can change to rounddown(m/n) + 1
 *
 * m_floor = (int)(n/m) + 1
 * n_floor = (int)(m/n) + 1
 * for i = m_floor; i <= n; i++
 *    x = n * i
 *    for j = n_floor; j <= n; j++
 *       y = m * j
 *       if y = x
 *           lcm = x
 *           return lcm 
 *
 * Use gcm - lcm = |a*b|/gcm(a,b)
 *
 */
{
   if(m*n == 0)
   {
      printf("Error: each integer input must be non-zero.\n");
      return(0);
   }

   if(m < 0) m = m * -1;
   if(n < 0) n = n * -1;

   return((m*n)/gcd(m,n));
}

int factorial(int m)
/* psuedo code
 *
 * input: int m
 * output: m * factorial(m-1)
 *
 * if m < 2 return 1
 * else  return m * factorial(m-1)
 *
 */
{
   if(m < 1) 
   {
      printf("Error: integer input must be greater than 0\n");
      return(-1);
   }
   if(m < 2) return(1);
   else return(m * factorial(m-1));
}

void matmul(int n, int *m1, int *m2, int *mResult)
/* psuedo code
 *
 * Inputs: n - int: size of matrix(nxn)
 *         m1 - pointer to array of integers = n*n elements
 *         m2 - pointer to array of integers = n*n elements
 * Outputs:
 *         mResult - pointer to array of integers = ?? elements
 *
 */
{
   int i, j, k;
   for(i = 0; i < n; i++)
   {
      for(j = 0; j < n; j++)
      {
         mResult[i*n+j] = 0;
         for(k = 0; k < n; k++)
         {
            mResult[i*n+j] += m1[i*n+k] * m2[j+k*n];
         }
      }
   }
}





