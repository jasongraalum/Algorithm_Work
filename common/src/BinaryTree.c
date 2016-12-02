/*
 *  BinarySearchTree.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic support for standard data structures used in a variety of programs
 *
 *  BST
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "BinarySearchTree.h"

//
// BST routines
//
void printBST_DF(struct BST *bst)
{
   printBST_DF_Node(bst->top);
}
void printBST_DF_Node(struct BSTNode *top)
{
   if(top != NULL)
   {
      printBST_DF_Node(top->left_child);
      printBST_DF_Node(top->left_child);
      printf("%d\n", top->key); 
   }
}

void printBST_BF(struct BST *bst)
{
   printBST_BF_Node(bst->top);
}
void printBST_BF_Node(struct BSTNode *top)
{
   if(top != NULL)
   {
      printf("%d\n", top->key); 
      printBST_BF_Node(top->left_child);
      printBST_BF_Node(top->left_child);
   }
}


struct BST* joinBSTs(struct BST *bst1, struct BST *bst2)
{

   return(bst);
}

void addBSTNode(struct BST *bst, struct BSTNode *node)
{
   if(top == NULL)
      top = node;
   else
      addBSTNode2(bst->top,node);
}
void addBSTNode2(struct BSTNode *top, struct BSTNode *node)
{
   if(node->key < top->key) // left side
   {
      if(top->left_child == NULL)
         top->left_child = node;
      else
         addBSTNode2(top->left_child,node);
   }
   else // right side
   {
      if(top->right_child == NULL)
         top->right_child = node;
      else
         addBSTNode2(top->right_child,node);
   }
}


struct BSTNode* searchBST(struct BST *bst, int key);
{
   return(searchBST2(bst->top,key));
}
struct BSTNode* searchBST2(struct BSTnode *top, int key);
{
   if(top->key == key)
      return(top);
   else if(key < top->key)
   {
      if(top->left_child == NULL)
         node = NULL;
      else
         node = searchBST2(top->left_child,key);
   }
   else
   {
      if(top->left_child == NULL)
         node = NULL;
      else
         node = searchBST2(top->left_child,key);
   }

   return(node);
}


struct BSTNode* removeBSTNode(struct BST *bst, struct BSTNode *node);
{
   return();
}
