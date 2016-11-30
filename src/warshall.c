/*
 *  warshall.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include "directedGraph.h"

struct boolMatrix** warshall(struct DirectedGraph *dg)
{

   int n = dg->vertex_cnt;

   struct boolMatrix **R = malloc(sizeof(struct boolMatrix*)*n);

   for(int k = 0; k < n; k++)
   {
      R[k] = malloc(sizeof(struct boolMatrix));
      for(int i = 0; i < n; i++)
      {
         for(int j = 0; j < n; j++)
         {
            if(k == 0)
               R[k]->v[n*i+j] = dg->adj->v[n*i+j] && 1;
            else
               R[k]->v[n*i+j] = R[k-1]->v[n*i+j] | (R[k-1]->v[n*i+k] && R[k-1]->v[k*n+j]);
         }
      }
   }

   return(R);


}
