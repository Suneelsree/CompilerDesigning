%{
#include<stdio.h>
#include "lex.yy.c"
%}
%left '(' ')'
%left ‘/’ ‘*’
%left '+' '-'
%token Num
%%
S : E {printf("ans: %d",$1);}
;
E : E '+' E {$$=$1+$3}
| E '-' E {$$=$1-$3}
| E '/' E {$$=$1/$3}
| E '*' E {$$=$1*$3}
| Num {$$=$1}
;
%%
void main()
{
printf("enter Ex:");
yyparse();
}
void yyerror()
{
printf("INVALID:");
}
