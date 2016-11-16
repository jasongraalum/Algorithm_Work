#include "algo1.h"

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

