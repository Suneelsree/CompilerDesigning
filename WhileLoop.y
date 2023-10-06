%{
#include<stdio.h>
#include "lex.yy.c"
%}
%left '='
%left '+' '-'
%token WHILE ID RELOP NUM DO IF ELSE FOR
%%
S : WHILE '(' ID RELOP E ')' S {printf("\n while loop is correct");}
| DO S WHILE '(' ID RELOP E ')' ';' {printf("\n do while loop Is correct");}
| FOR '(' ID '=' E ';' ID RELOP E ';' ID '=' ID '+' NUM ')' S {printf("\n for loop
is correct");}
| IF '(' ID RELOP E ')' S ELSE S {printf("\n if else statement is correct");}
| '{' S S '}'
| ID '=' E ';'
;
E : E '+' E
| E '-' E
| ID
| NUM
;
%%
void main()
{
printf("\nEnter the String \n");
yyparse();
}
int yyerror(char *msg)
{
return fprintf(stderr,"\n%s\n",msg);
}
