%{
#include<stdio.h>
#include<string.h>
#include "lex.yy.c"
int temp=1;
%}
%union {char *str;}
%left '='
%left '+''-'
%left '%'
%left '/'
%left '*'
%token <str>ID
%type <str>S E
%%
S	:ID'='E {printf("\n %s = %s",$1,$3);}
	;
E	:E'+'E {char word[10]="t";
		char tem[10];
		sprintf(tem,"%d",temp);
		strcat(word,tem);
		temp++;
		printf("\n%s=%s%c%s",word,$1,'+',$3);
		strcpy($$,word);
		}
	|E'-'E {char word[10]="t";
		char tem[10];
		sprintf(tem,"%d",temp);
		strcat(word,tem);
		temp++;
		printf("\n%s=%s%c%s",word,$1,'-',$3);
		strcpy($$,word);
		}
	|E'%'E {char word[10]="t";
		char tem[10];
		sprintf(tem,"%d",temp);
		strcat(word,tem);
		temp++;
		printf("\n %s=%s %c %s ",word,$1,'%',$3);
		strcpy($$,word);
		}
	| E'*'E {char word[10]="t";
		char tem[10];
		sprintf(tem,"%d",temp);
		strcat(word,tem);
		temp++;
		printf("\n %s=%s %c %s ",word,$1,'*',$3);
		strcpy($$,word);
		}
	| E'/'E {char word[10]="t";
		char tem[10];
		sprintf(tem,"%d",temp);
		strcat(word,tem);
		temp++;
		printf("\n %s=%s %c %s ",word,$1,'/',$3);
		strcpy($$,word);
		}
	|ID	{$$=$1;}
	;
%%
void main()
{
printf("enter Expression:");
yyparse();
}
void yyerror()
{
printf("invalid");
}
