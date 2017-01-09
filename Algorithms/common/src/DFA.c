#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "Algorithms.h"
#include "Utilities.h"
#include "DFA.h"

#define EMPTY_STR 'e'

int getDFASymbolIndex(struct DFA *dfa, char c)
{
   for(int i = 0; i < dfa->alphabet_cnt; i++)
      if(c == dfa->alphabet[i])
         return(i);

   return(-1);
}

int validateDFASymbol(struct DFA *dfa, char c)
{
   for(int i = 0; i < dfa->alphabet_cnt; i++)
      if((c == dfa->alphabet[i]) || (c == ' '))
         return(1);

   return(0);

} 
int isValidChar(char c)
{
   if(isalnum(c)) 
      return(1);
   else
      return(0);
}

struct States* getDFAStatebyName(struct DFA *dfa, char *name)
{
   for(int i = 0; i < dfa->state_cnt; i++)
   {
      if(!strcmp(name, dfa->states[i]->name))
         return(dfa->states[i]);
   }
   return(NULL);
}

int getDFAStateIndexbyName(struct DFA *dfa, char *name)
{
   for(int i = 0; i < dfa->state_cnt; i++)
   {
      if(!strcmp(name, dfa->states[i]->name))
         return(i);
   }
   return(-1);
}


struct DFA *readDFAFile(char *ifn)
{
   struct DFA *dfa;
   FILE *ifp;
   int alpha_cnt;
   char c;

   ifp = fopen(ifn,"r");

   dfa = malloc(sizeof(struct DFA));

   //
   // Get DFA Name
   fscanf(ifp,"Name: ");

   char *name;
   int name_len;

   name = NULL;
   name_len = 0;
   do {
      c = fgetc(ifp);
      name = realloc(name,sizeof(char)*(name_len+1));
      name[name_len] = c;
      name_len++;
   } while(c != '\n');
   name_len--;
   name[name_len] = '\0';
   dfa->name = name;

   //
   // Get the Alphabet - read an abitrary list of single characters
   //
   dfa->alphabet=NULL;

   alpha_cnt = 0;
   fscanf(ifp,"Alphabet: %c", &c);
   while(c != '\n')
   {
      if(isValidChar(c))
      {
         dfa->alphabet = realloc(dfa->alphabet,sizeof(char));
         dfa->alphabet[alpha_cnt] = c;
         alpha_cnt++;
      }
      c = fgetc(ifp);
   }
   dfa->alphabet_cnt = alpha_cnt;

   //
   // Get the States - abitrary list of strings(whitespace separated) 
   //
   char *symbol;
   char **symbol_list;
   fscanf(ifp,"States: ");

   dfa->states = NULL;
   symbol_list = NULL;
   dfa->state_cnt = 0;

   symbol = readWordFromFile(ifp);
   while(strncmp(symbol,"Start:",strlen("Start:")))
   {
      if(strlen(symbol) > 0)
      {
         dfa->state_cnt = dfa->state_cnt + 1;
         symbol_list = realloc(symbol_list,sizeof(char*)*dfa->state_cnt);
         symbol_list[dfa->state_cnt-1] = symbol;
      }
      symbol = readWordFromFile(ifp);
   }

   struct States *state;
   dfa->states = malloc(sizeof(struct States*)*(dfa->state_cnt));
   for(int i=0; i < dfa->state_cnt; i++)
   {
      state = malloc(sizeof(struct States));
      state->name = malloc(sizeof(char)*(strlen(symbol_list[i])+1));
      strcpy(state->name,symbol_list[i]);
      state->index = i;
      state->accept = 0;
      dfa->states[i] = state;
   }

   free(symbol_list);
   free(symbol);

   // End get states

   //
   // Get Start State symbol and set pointer to correct stat
   //
   char *start_state_name;

   start_state_name = readWordFromFile(ifp); 
   dfa->start_state = getDFAStatebyName(dfa, start_state_name);

   // End get Start State

   //
   // Get the Accept states - read an abitary list of strings and link to State Struct
   //
   struct States *accept_state;
   fscanf(ifp,"Accept: ");

   symbol_list = NULL;
   dfa->accept_state_cnt = 0;

   symbol = readWordFromFile(ifp);
   while(strncmp(symbol,"Transition_Table:",strlen("Transition_Table:")))
   {
      if(strlen(symbol) > 0)
      {
         dfa->accept_state_cnt = dfa->accept_state_cnt + 1;

         accept_state = getDFAStatebyName(dfa,symbol);
         if(accept_state != NULL)
            accept_state->accept = 1;
         else
            printf("Invalid state included in Accepted States list: %s\n", symbol);
      }
      symbol = readWordFromFile(ifp);
   }


   //
   // Get the Transition Function - read a 2D array - (# of alphabet entries X # of states) 
   //

   char *row_header;
   //
   // Read header and check for correct number of columns
   //
   int index = 0;
   c = fgetc(ifp);
   while(c != '\n')
   {
      if(isValidChar(c))
      {
         if(c != dfa->alphabet[index])
            printf("WARNING: The transition function column(%c) is out of order(%c expected.).\n", c, dfa->alphabet[index]);
         index++;
      }
      c = fgetc(ifp);
   }

   dfa->transition_func = malloc(sizeof(int)*dfa->state_cnt * alpha_cnt);

   for(int i = 0; i < dfa->state_cnt; i++)
   {
      //
      // Get the row header and throw away. (Check for sequential numbering)
      //
      row_header = readWordFromFile(ifp);

      if(!getDFAStatebyName(dfa,row_header))
         printf("WARNING: The transition function row symbol(%s) is not in list of valid states.\n", row_header);

      int row = i * alpha_cnt;
      for(int j = 0; j < alpha_cnt; j++)
      {

         char *val;
         val = readWordFromFile(ifp);
         if(!getDFAStatebyName(dfa,val))
         {
            printf("WARNING: The transition symbol(%s) is outside state range.\n", val);
            dfa->transition_func[row + j] = -1;
         }
         else
            dfa->transition_func[row + j] = getDFAStateIndexbyName(dfa,val);
      }
   }

   //
   // Return the DFA structure
   //
   return(dfa);
}
int validateDFA(struct DFA *dfa)
{

   return(0);
}


void printDFA(struct DFA *dfa)
{
   printf("Alphabet:");
   for(int i = 0; i < dfa->alphabet_cnt; i++)
      printf(" %c",dfa->alphabet[i]);
   printf("\n");

   printf("States:");
   for(int i = 0; i < dfa->state_cnt; i++)
      printf(" %s",dfa->states[i]->name);
   printf("\n");

   printf("Start State: %s\n", dfa->start_state->name);

   printf("Accept:");
   for(int i = 0; i < dfa->state_cnt; i++)
      if(dfa->states[i]->accept)
         printf(" %s",dfa->states[i]->name);
   printf("\n");

   printf("Transition Function:\n");

   printf("        ");
   for(int j = 0; j < dfa->alphabet_cnt; j++)
      printf(" %5c ",dfa->alphabet[j]);
   printf("\n"); 

   printf("--------");
   for(int j = 0; j < dfa->alphabet_cnt; j++)
      printf("-------");
   printf("\n");

   for(int j = 0; j < dfa->state_cnt; j++)
   {
      printf("%5s ||", dfa->states[j]->name);
      for(int i = 0; i < dfa->alphabet_cnt; i++)
      {
         int s = dfa->transition_func[(j*dfa->alphabet_cnt)+i];
         printf(" %5s ",dfa->states[s]->name);
      }
      printf("\n");
   }
}

char *getDFACmdStrFromFile(struct DFA *dfa, char *filename)
{
   int index;
   FILE *ifp;
   char symbol;
   char *cmd_str;

   cmd_str = NULL;
   index = 0;
   ifp = fopen(filename,"r");

   if(ifp == NULL)
   {
      printf("Error reading input file.\n");
      return(NULL);
   }

   symbol = fgetc(ifp);
   do {
      if((symbol != '\n') && !validateDFASymbol(dfa,symbol))
         printf("Skipping invalid character: %c(%d)\n", symbol, symbol);
      else
      {
         if(symbol != ' ')
         {
            cmd_str = realloc(cmd_str, sizeof(char)*index);
            cmd_str[index] = symbol;
            index++;
         }
      }
      symbol = fgetc(ifp);
   } while(!feof(ifp));

   index--;
   cmd_str[index] = '\0';
   return(cmd_str);
}

char *getDFACmdStrFromStdIn(struct DFA *dfa)
{
   int index;
   char symbol;
   char *cmd_str;

   cmd_str = NULL;

   printf("Enter a string from the alphabet {");
   for(index=0; index < dfa->alphabet_cnt-1; index++)
      printf("%c ", dfa->alphabet[index]);
   printf("%c}:",dfa->alphabet[index]);

   index = 0;
   do {
      symbol = fgetc(stdin);
      if((symbol != '\n') && !validateDFASymbol(dfa,symbol))
         printf("Skipping invalid character: %c\n", symbol);
      else
      {
         if(symbol != ' ')
         {
            cmd_str = realloc(cmd_str, sizeof(char)*index);
            cmd_str[index] = symbol;
            index++;
         }
      }
   } while(symbol != '\n');

   index--;
   cmd_str[index] = '\0';
   return(cmd_str);

}


char *getDFACmdStr(struct DFA *dfa)
{
   char filename[MAX_FILENAME_LEN];
   char *cmd_str;

   printf("Enter filename to read from, hit enter to read from the keyboard, or enter quit:");
   fgets(filename,MAX_FILENAME_LEN,stdin);

   if(strlen(filename) < 2)
   {
      cmd_str = getDFACmdStrFromStdIn(dfa);
   }
   else if(strncmp(filename,"quit",4))
   {
      filename[strlen(filename)-1] = '\0';
      cmd_str = getDFACmdStrFromFile(dfa, filename);
   }
   else
   {
      cmd_str = malloc(sizeof(char)*5);
      strcpy(cmd_str,"quit");
   }

   return(cmd_str);
}

int runDFA(struct DFA *dfa, char *cmd_str)
{
   char *str;
   char symbol;
   int symbol_index;
   int state;

   state = dfa->start_state->index;
   str = cmd_str;
   do {
      symbol = *str;
      if(symbol != EMPTY_STR)
      {
         symbol_index = getDFASymbolIndex(dfa, symbol);
         printf("Symbol: %c(%d)\tState = %s(%d)\t", symbol, symbol_index, dfa->states[state]->name, state); 

         state = dfa->transition_func[state*dfa->alphabet_cnt + symbol_index];
      }
      printf("Next State = %s(%d)\n", dfa->states[state]->name, state); 
      str++;
   } while(*str);

   return(state);
}

