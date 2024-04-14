%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}
%union{
	char* sval; 
	char* var_str;
	int c1, c2, Int; 
	float Float;
	char Char;
	
}
%token PROG INT REAL BOOLEAN CHAR VAR TO DOWNTO IF ELSE WHILE FOR DO ARRAY AND OR NOT START END READ WRITE OF ASSIGN SC COLON CM ARRLEN1 ARRLEN2 INTVAL REALVAL CHARVAL STRING VARIABLE ADD SUB MUL DIV REM EQUALS NOT_EQUALS LESS_THAN GREATER_THAN LESS_THAN_EQUAL GREATER_THAN_EQUAL NL

%%
program: prog declaration code { }
       ;
prog: PROG VARIABLE SC NL { }
    ;
declaration: VAR var_lines { }
           ;
var_lines: var_list COLON type SC NL var_lines { }
         |
	   ;
type: dtype { }
    | ARRAY ARRLEN1 ARRLEN2 OF dtype { }
    ;

dtype: INT { }
    | REAL { }
    | BOOLEAN { }
    | CHAR { }
    ;
var_list: VARIABLE v_list { }
	  ;
v_list: CM VARIABLE v_list{ }
      | 
	;
code: START main END { }
    ;
main: stat_lines{ }
    |
    ;
stat_lines: stmt stat_lines SC NL {}
	    |
	    ;
stmt: looping {}
    | assignment {}
    | conditionals {}
    ;
looping:
       ;
assignment:
          ;
conditionals:
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
