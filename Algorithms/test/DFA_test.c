#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Algorithms.h"
#include "Utilities.h"
#include "DFA.h"

int main(int argc, char *argv[])
{
   struct DFA *dfa;
   char *cmd_str;
   int final_state;

   dfa = readDFAFile(argv[1]);
   printDFA(dfa);

   cmd_str = getDFACmdStr(dfa);

   while((cmd_str != NULL) && strncmp(cmd_str,"quit",4) != 0)
   {
      final_state = runDFA(dfa,cmd_str);
      if(dfa->states[final_state]->accept)
         printf("Accepted\n");
      else
         printf("Unaccepted\n");

      cmd_str = getDFACmdStr(dfa);
   }

   return(final_state);
}
