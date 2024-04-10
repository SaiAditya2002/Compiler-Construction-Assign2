%{
#include "y.tab.h"
#include<math.h>
#include<string.h>
#include<stdlib.h>
%}
%%
["program" | "int" | "real" | "boolean" | "char" | "var" | "for" | "do" | "while" | "array" | "and" | "or" | "not" | "begin" | "end" | "read" | "write"] {yylval.sval= malloc(sizeof(char)*10); strcpy(yylval.sval, yytext); return KEYWORD;}
"program" {return PROG;}
["int" | "real" | "boolean" | "char" | "var"] {return DT;}
[a-zA-Z][a-zA-Z0-9_]* {return VAR;}
\+ {return ADD;}
\- {return SUB;}
\* {return MUL;}
\/ {return DIV;}
\% {return REM;}
=  {return EQUALS;}        
<> {return NOT_EQUALS;}   
<  {return LESS_THAN;}      
>  {return GREATER_THAN;}   
<= {return LESS_THAN_EQUAL;} 
>= {return GREATER_THAN_EQUAL;}
"and" {return AND;}
"or" {return OR;}
"not" {return NOT;}
":=" {return ASSIGN;}
"begin" {return START;}
"end." {return END;}
";" {return SC;}
":" {return COLON;}
"," {return CM;}
\n return NL;
. { }
%%
