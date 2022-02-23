%{ 
//name, ID; 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]
ALPHALOWER [a-z]
ARROBA [@]
UNDERSCORE [_]
EMPTY []
ADD [+]
SUBT [-]
PERIOD [.]

%%

\/\/.*$   
[ \t]+            
[\n]+              




"+"      {
	    return OP_ADD;
	 }

"-"	 {
	    return OP_SUB;
	 }

"*"	 { 
	    return OP_MUL;
	 }

"/"	 {
	    return OP_DIV;
	 }

"+="	 {
	    return OP_ADDINC;
	 }

"++"	 {
	    return OP_PLUSPLUS;
	 }

"<="	 {
	    return OP_LEQ;
	 }

">="	 {
	    return OP_GEQ;
	 }

">"	 {
	    return OP_GT;
	 }

"<" 	 {
	    return OP_LT;
	 }

"=="	 {
	    return OP_EQ;
	 }

"~="	 {
	   return OP_DIFF;
	 }

"FOREACH" {
	   return K_FOREACH;
	  }

"PRINT"  {
	   return K_PRINT;
	 }

"WHILE"  {
	    return K_WHILE;
	 }

"REPEAT" {
	    return K_REPEAT;
	 }

"UNTIL" {
	    return K_UNTIL;
	}

"BEGIN" {
	   return K_BEGIN;
	}

"END"	{
	   return K_END;
	 }

"DECLARE" {
	   return K_DECLARE;
	  }

"IF"      {
	   return K_IF;
       	}

"THEN" {
	  return K_THEN;
	}

"MAIN" {
	 return K_MAIN;
	 }

"INTEGER" {
	 return K_INTEGER;
	 }

"FLOAT" {
	 return K_FLOAT;
	}


";"      { 
           return ';'; 
         }

"="      { 
           return OP_ASSIGN; 
         }

"MAIN"   { 
           return K_MAIN; 
         }


{DIGIT}+ { 
           return L_INTEGER;
         }

{ARROBA}{ALPHALOWER}({DIGIT}|{UNDERSCORE}|{ALPHALOWER})+ { 
           return T_ID;
         }

(""|{ADD}|{SUBT}){DIGIT}+{PERIOD}{DIGIT}+  {
		return L_FLOAT;
	}

<<EOF>>  { return T_EOF ; }
.        { printf ("Unexpected character\n"); exit (1); }





%%
