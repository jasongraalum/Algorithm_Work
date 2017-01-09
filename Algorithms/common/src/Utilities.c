/*
 *  utils.c
 *
 *  Jason Graalum
 *  November 15, 2016
 *  New Beginnings - Theory II
 *
 *  Generic utilities used in a variety of programs
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include "Utilities.h"

static int randReady=0;

char *readWordFromFile(FILE *fp)
{
   char c;
   char *symbol;
   int symbol_len = 0;
  
   symbol = NULL;
   do {
      c = fgetc(fp);
      symbol_len++;
      symbol = realloc(symbol,sizeof(char)*(symbol_len+1));
      symbol[symbol_len-1] = c;
   } while(!isspace(c));
   symbol[symbol_len-1] = '\0';

   return(symbol);
}

char *readLineFromFile(FILE *fp, int max_chars)
{
   char c;
   char *line;
   int length; 
   c = '\0';
   line = NULL;
   length = 0;
   // Read character by character until max_chars read or character is a NewLine, LineFeed, or Carriage Return
   while((length < max_chars) && (c != '\n') && (c != 0xA) && (c != 0xD) && !feof(fp))
   {
      c = fgetc(fp);
      line = realloc(line,sizeof(char)*(length+1));
      line[length++] = c;
   }
   if(length > 0)
   {
      line[--length] = '\0';
      return(line);
   }
   else 
      return(NULL);

}

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

