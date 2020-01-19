%{
#include <stdio.h>
#include <stdlib.h>
#define _PI 3.14159265358979323846
#define _SQRT2 1.41421356237309504880
#define _SQRT3 1.7320508075688772935
%}

%option warn 8bit nodefault noyywrap

DIGIT    [0-9]
ENTIER   0|[1-9]*
HEXA     0x([0]|[a-f]|[A-F]|[1-9])+
FLOAT    {DIGIT}*(\.|e|E)(\-?|\+?){DIGIT}*
PROC     [A-Z][0-9|A-Z]*   
C_LANG   [\_a-zA-Z]{1}([a-zA-Z]|\_|{DIGIT})*

%%


true      {printf("C'est un true : %s\n",yytext);}
PI        {printf("PI = %f\n",_PI);}
SQRT2     {printf("SQRT2 = %f\n",_SQRT2);}
SQRT3     {printf("SQRT3 = %f\n",_SQRT3);}
{PROC}    {printf("C'est une procédure = %s\n",yytext);}
{FLOAT}   {printf("C'est un flottant : %s \n",yytext);}
{HEXA}    {printf("héxadécimale : %s \n",yytext);}
{ENTIER}  {printf ("c'est un entier : %i (%s)\n",atoi(yytext), yytext);}
{DIGIT}+  {printf("Number: %i (%s)\n", atoi(yytext), yytext); }
{C_LANG}  {printf("Identifiant du langage C : %s\n",yytext);}
[\n\t ]*  /* nothing */
.         { fprintf(stderr, "Unknown token: '%s'\n", yytext); ; exit(EXIT_FAILURE); }

%%
