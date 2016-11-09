//
// Generic Data Payload for search/sort
// algorithms
//
//

typedef struct  element
{
#if KEY_TYPE == K_INT 
   int key;
#elif KEY_TYPE == K_CHAR
  char key;
#elif KEY_TYPE == K_STRING
  char key[STRING_LEN];
#elif KEY_TYPE == K_FLOAT
  float key;
#elif
  int key;
#endif

#if PAYLOAD_TYPE==P_INT
  int payload;
#elif PAYLOAD_TYPE==P_INT_ARRAY
  int *payload;
#elif PAYLOAD_TYPE==P_CHAR
  char payload;
#elif PAYLOAD_TYPE==P_STRING
  char payload[STRING_LEN];
#elif PAYLOAD_TYPE==P_FLOAT
  float payload;
#endif

#if STRUCT_TYPE == S_LINKED_LIST
   struct element *next;
#elif STRUCT_TYPE == S_DOUBLE_LINKED_LIST
   struct element *next;
   struct element *prev;
#elif STRUCT_TYPE == S_BINARY_TREE
   struct element *child[2];
#elif STRUCT_TYPE == S_N_TREE
   struct element **child;
#else

#endif
} element;

typedef struct dataArray
{
   int *payload;
   unsigned int size;
   unsigned char type;
   unsigned int row, col;
} dataArray;

void initRandGen();
void printDataArray(struct dataArray*);
struct dataArray *genRandomArray(int, int);
int printDataMatrix(struct dataArray*);
struct dataArray *readMatrix(char*);

