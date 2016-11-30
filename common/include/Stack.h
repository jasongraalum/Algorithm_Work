typedef struct stackNode {
   unsigned int key;
   unsigned int index;
   void *data;
   struct stackNode *next;
} stack;

typedef struct Stack {
   struct stackNode *top;
} Stack;

void  pushStack(struct Stack*, struct stackNode*);
struct stackNode* popStack(struct Stack*);
int printStack(struct Stack*);
