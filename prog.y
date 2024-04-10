%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}
%union{struct{ int oc; int zc;} t;}
%token KEYWORD VAR ADD SUB DIV MUL REM EQUALS NOT_EQUALS LESS_THAN GREATER_THAN LESS_THAN_EQUAL GREATER_THAN_EQUAL AND OR NOT ASSIGN START END SC COLON CM NL

%%
program: prog declaration code { }
;
prog: KEYWORD VAR SC NL {
if(strcmp($1,"program")!=0) 
	printf("Syntax Error: program not found\n"); 
printf("Valid Program\n"); return 1;
}
;
declaration: KEYWORD var_lines {
if(strcmp($1,"var")!=0) 
	printf("Syntax Error: var not found\n"); 
}
;
var_lines: var_list COLON type SC NL var_lines { }
         |
	   ;
type: KEYWORD {
if(strcmp($1,"int")!=0)
{
	if(strcmp($1,"real")!=0)
	{
		if(strcmp($1,"boolean")!=0)
		{
			if(strcmp($1,"char")!=0)
			{
				printf("Syntax Error: No such Datatype found\n");
			}
		}
	}
} 
}
;

var_list: VAR v_list { }
	  ;
v_list: CM VAR v_list{ }
      | 
	;
code: START main END { }
    ;
main: stat_lines{ }
    ;
stat_lines: stmt state_lines SC NL {}
	    |
	    ;
%%
int main()
{
	yyparse();
	return 0;
}

int yyerror()
{
	printf("Syntax Error....\n");
	return 1;
}
