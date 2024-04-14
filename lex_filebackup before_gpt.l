%{
#include "y.tab.h"
#include<math.h>
#include<ctype.h>
#include<string.h>
#include<stdlib.h>
#include <stdio.h>
#include <stdbool.h>

int lineCount=0;
//add tolower function and call that below.
void toLowercase(char *str) {
    int length = strlen(str);
    for (int i = 0; i < length; i++) {
        str[i] = tolower(str[i]);
    }
}
%}
%x ARRAY_STATE
%%
[Pp][Rr][Oo][Gg][Rr][Aa][Mm] {return PROG;}
[Ii][Nn][Tt] {return INT;}
[Rr][Ee][Aa][Ll] {return REAL;}
[Bb][Oo][Oo][Ll][Ee][Aa][Nn] {return BOOLEAN;}
[Cc][Hh][Aa][Rr] {return CHAR;}
[Vv][Aa][Rr] {return VAR;}
[Tt][Oo] {return TO;}
[Dd][Oo][Ww][Nn][Tt][Oo] {return DOWNTO;}
[Ii][Ff] {return IF;}
[Ee][Ll][Ss][Ee] {return ELSE;}
[Ww][Hh][Ii][Ll][Ee] {return WHILE;}
[Ff][Oo][Rr] {return FOR;}
[Dd][Oo] {return DO;}
[Aa][Rr][Rr][Aa][Yy] {return ARRAY;}
[Aa][Nn][Dd] {return AND;}
[Oo][Rr] {return OR;}
[Nn][Oo][Tt] {return NOT;}
[Bb][Ee][Gg][Ii][Nn] {return START;} //returning START instead of BEGIN
[Ee][Nn][Dd][.] {return END;}
[Rr][Ee][Aa][Dd] {return READ;}
[Ww][Rr][Ii][Tt][Ee] {return WRITE;}
[Oo][Ff] {return OF;}
":=" {return ASSIGN;}
";" {return SC;}
":" {return COLON;}
"," {return CM;}
\[ {BEGIN(ARRAY_STATE);}
<ARRAY_STATE>.*\.\. { char*s1[100];strcpy(s1, yytext); int len = strlen(s1); strncpy(s1 + len - 2, "", 2); yylval.c1=stoi(s1); return ARRLEN1;}
<ARRAY_STATE>.*] {char*s2[100];strcpy(s2, yytext); int len = strlen(s2); strncpy(s2 + len - 1, "", 1); yylval.c2=stoi(s2); BEGIN(INTIAL); return ARRLEN2;}
[-]?[0-9]+([eE][+-]?[1-9][0-9]*)? {yylval.Int = atoi(yytext);return INTVAL;}
[-]?[0-9]*\.[0-9]+([eE][+-]?[1-9][0-9]*)? {yylval.Float = atof(yytext);return REALVAL;}
\'[^\'\n]\' {yylval.Char=yytext[1]; return CHARVAL;}
\"[^\"\n]*\" {yylval.sval = strdup(yytext); return STRING;}
[a-zA-Z][a-zA-Z0-9_]* {yylval.var_str = toLowercase(strdup(yytext)); return VARIABLE;}
\+ {return ADD;}
\- {return SUB;}
\* {return MUL;}
\/ {return DIV;}
\% {return REM;}
=  {return EQUALS;}        
"<>" {return NOT_EQUALS;}   
"<"  {return LESS_THAN;}      
">"  {return GREATER_THAN;}   
"<=" {return LESS_THAN_EQUAL;} 
">=" {return GREATER_THAN_EQUAL;}
\n { lineCount++; return NL;};
. { }
