#include <stdio.h>

typedef struct Matrix {
   char *name;
   int rows, cols;
   unsigned int *key;
   void **data;
} Matrix;

double dotProduct(struct Matrix*, struct Matrix*);
struct Matrix* matrixMultiply(struct Matrix*, struct Matrix*);
struct Matrix* readMatrixFromFile(char*);
void printMatrix(struct Matrix *m);

