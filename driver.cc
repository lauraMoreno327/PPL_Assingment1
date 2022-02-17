#include <iostream>
#include <string>
#include "tokens.h"


extern
int yylex ();

int main ()
{
  int next;
  while ((next = yylex ()) != T_EOF) {
    printf ("token = %d\n", next);
  }

  return 0;
}
