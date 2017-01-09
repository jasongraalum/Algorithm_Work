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
#include "utils.h"


char *readLineFromFile(FILE *fp, int max_chars)
{
   char c;
   char *line;
   int length; 
   c = '\0';
   line = NULL;
   length = 0;
   while((length < max_chars) && (c != '\n') && !feof(fp))
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

