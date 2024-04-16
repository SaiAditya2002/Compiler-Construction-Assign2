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
%token PROG INT REAL BOOLEAN CHAR VAR TO DOWNTO IF ELSE WHILE FOR DO ARRAY AND OR NOT START END READ WRITE OF ASSIGN SC COLON CM ARRLEN1 ARRLEN2 INTVAL REALVAL CHARVAL STRING VARIABLE ADD SUB MUL DIV REM EQUALS NOT_EQUALS LESS_THAN GREATER_THAN LESS_THAN_EQUAL GREATER_THAN_EQUAL NL INVALID

%%
program: prog declaration code { printf("Valid Program\n");}
       ;
prog: PROG VARIABLE SC NL { }
    ;
declaration: VAR NL var_lines { }
           ;
var_lines: var_list COLON type SC NL var_lines { }
         |
	   ;
var_lines: var_decl SC{ }
         | var_lines var_decl SC { }
	   ;
var_decl: id_list COLON type { }
	  ;
id_list: VARIABLE { }
	 | id_list CM VARIABLE { }
	 ;
type: dtype { }
    | ARRAY ARRLEN1 ARRLEN2 OF dtype { }
    ;

dtype: INT { }
    | REAL { }
    | BOOLEAN { }
    | CHAR { }
    ;

code: START main END { }
    ;
main: statements{ }
    |
    ;
statements: statment {}
	    | statements statement
	    ;
stmt:
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
