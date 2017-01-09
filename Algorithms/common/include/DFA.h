typedef struct States{
   char *name;
   int index;
   int accept;
} States;

typedef struct DFA  {
   char *name;
   char *alphabet;
   int alphabet_cnt;

   struct States **states;
   int state_cnt;

   struct States *start_state;

   int accept_state_cnt;

   int *transition_func;
} DFA;

int getDFASymbolIndex(struct DFA*, char);
int validateDFASymbol(struct DFA*, char);
int isValidChar(char);
struct States* getDFAStatebyName(struct DFA*, char*);
int getDFAStateIndexbyName(struct DFA*, char*);
struct DFA *readDFAFile(char*);
int validateDFA(struct DFA*);
void printDFA(struct DFA*);
char *getDFACmdStrFromFile(struct DFA*, char*);
char *getDFACmdStrFromStdIn(struct DFA*);
char *getDFACmdStr(struct DFA*);
int runDFA(struct DFA*, char*);
