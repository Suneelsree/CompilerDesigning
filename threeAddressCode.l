%{
#include "threeAddressCode.tab.h"
%}
id ([a-zA-Z])([a-zA-Z0-9_])*
%%
{id} {yylval.str=strdup(yytext);
      return ID;
     }
[\t] {}
[\n] {return 0;}
. {return *yytext;}
%%
int yywrap()
{
return 0;
}
