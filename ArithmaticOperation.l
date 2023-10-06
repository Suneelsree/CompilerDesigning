%{
#include "ArithmaticOperation.tab.h"
%}
Num ([0-9]+)
%%
{Num} {yylval =atoi(yytext);return Num;}
[/t] {}
[/n] {return 0;}
. {return *yytext;}
%%
int yywrap()
{
return 1;
}
