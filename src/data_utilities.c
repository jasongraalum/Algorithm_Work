#include "algo1.h"

static int randReady=0;
void initRandGen()
{

   if(!randReady)
      srand(time(NULL));

   randReady = 1;
}

int getRandomInt(int l, int u)
{
   if(!randReady)
      initRandGen();

   return(l + (rand() % (u - l)));
}

int getRandomChar()
{
   int l = 31;
   int u = 126;

   if(!randReady)
      initRandGen();

   return(l + (rand() % (u - l)));
}


void writeDataArray(struct dataArray *array, char *ofn)
{

}

struct dataArray *readMatrix(char *ifn)
{
   FILE *ifp;
   int row, col;
   struct dataArray *matrix;
   
   ifp = fopen(ifn,"r");

   // Read first line to get column and row counts
   fscanf(ifp,"%d %d\n", &row, &col);

   matrix = malloc(sizeof(struct dataArray));
   matrix->payload = malloc(sizeof(int)*row*col);
   matrix->size = row*col;

   matrix->row = row;
   matrix->col = col;
   int row_index = 0;
   int col_index = 0;
   while(!feof(ifp) && (row_index < row) && (col_index < col))
   {
      //printf("Reading into (%d, %d)[%d]\n", row_index, col_index, row_index*row + col_index);
      fscanf(ifp,"%d",&(matrix->payload[row_index*row + col_index]));
      col_index = (col_index + 1) % col;
      if(col_index == 0)
         row_index++;
   }
   fclose(ifp);
   return(matrix);
}



struct dataArray *genRandomArray(int n, int bound)
{
   struct dataArray *array;

   array = malloc(sizeof(dataArray));
   array->payload = malloc(sizeof(element)*n);
   array->size = n;

   for(int i=0; i < n; i++)
   {
      array->payload[i] = rand() % bound;
   }

   return(array);
}

void printBinaryTree(struct dataArray *array, int n, int m)
{
}

int printDataMatrix(struct dataArray *array)
{
   int col = array->col;
   int row = array->row;
   int i, j;

   for(i = 0; i < row; i++)
   {
      for(j = 0; j < col; j++)
      {
         printf(" %3d ",array->payload[i*row+j]);
      }
      printf("\n");
   }
   return(i*j);
}


void printDataArray(struct dataArray *array)
{
   int index;
   for(index = 0; index < array->size; index++)
   {
      printf("%d\t", array->payload[index]);
      if(((index+1) % 10) == 0)
         printf("\n");
   }
   if(((index) % 10) != 0)
      printf("\n");
}


