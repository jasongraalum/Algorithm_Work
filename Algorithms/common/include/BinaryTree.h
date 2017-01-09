typedef struct binaryTreeNode {
   unsigned int key;
   unsigned int index;
   void *data;
   struct binaryTreeNode *right_child;
   struct binaryTreeNode *left_child;
} binaryTreeNode;

typedef struct BinaryTree {
   struct binaryTreeNode *top;
} BinaryTree;

