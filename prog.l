%{
#include "y.tab.h"
#include<math.h>
#include<string.h>
#include<stdlib.h>

//function that converts a c string to lower case
char* toLower(char *str)
{
    size_t len = strlen(str);
    char* lowerStr = (char *)malloc((len+1)* sizeof(char));

    if(lowerStr == NULL)
    {
        printf("Memory allocation failed\n");
        exit(1);
    }

    //Conversion
    for(size_t i=0; i<len; i++)
    {
        if(str[i]>='A' && str[i]<='Z')
        {
            lowerStr[i] = str[i]+32;

        }
        else
        {
            lowerStr[i] = str[i]; //do nothing
        }
    }
    lowerStr[len] = '\0'; //null terminator
    return lowerStr;
}


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

