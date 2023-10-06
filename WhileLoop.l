%{
#include<stdlib.h>
#include "while.tab.h"
%}
digit [0-9]
letter [a-zA-Z]
id ({letter})({letter}|{digit})*
num ({digit})+
%%
while {return WHILE;}
do {return DO;}
if {return IF;}
else {return ELSE;}
for {return FOR;}
{id} {return ID;}
{num} {return NUM;}
"<" |
"<=" |
">" |
">=" |
"==" |
"!=" {return RELOP;}
[ \t] ;
[\n] {return 0;}
. {return *yytext;}
%%
int yywrap()
{
return 0;
}
