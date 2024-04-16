%{
#include "y.tab.h"
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
int lineCount=0;

void toLowercase(char *str) {
    while (*str) {
        *str = tolower(*str);  // Convert character to lowercase
        str++;
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
[Oo][Ff] {return OF;} //NOT in Claude
":=" {return ASSIGN;}
";" {return SC;}
":" {return COLON;}
"," {return CM;}

\[ {BEGIN(ARRAY_STATE);}
<ARRAY_STATE>.*\.\. { 
    char s1[100]; 
    strncpy(s1, yytext, strlen(yytext) - 2);  // Copy substring excluding the last two characters
    s1[strlen(yytext) - 2] = '\0';  // Null-terminate the string
    yylval.c1 = atoi(s1);  // Convert string to integer
    return ARRLEN1;
}
<ARRAY_STATE>.*] { 
    char s2[100]; 
    strncpy(s2, yytext, strlen(yytext) - 1);  // Copy substring excluding the last character
    s2[strlen(yytext) - 1] = '\0';  // Null-terminate the string
    yylval.c2 = atoi(s2);  // Convert string to integer
    BEGIN(INITIAL);  // Switch back to the initial state
    return ARRLEN2;
}

[-]?[0-9]+([eE][+-]?[1-9][0-9]*)? {yylval.Int = atoi(yytext);return INTVAL;}
[-]?[0-9]*\.[0-9]+([eE][+-]?[1-9][0-9]*)? {yylval.Float = atof(yytext);return REALVAL;}
\'[^\'\n]\' {yylval.Char = yytext[1]; return CHARVAL;}
\"[^\"\n]*\" {yylval.sval = strdup(yytext); return STRING;}
[a-zA-Z][a-zA-Z0-9_]* {
    char var_str[100];
    strncpy(var_str, yytext, strlen(yytext));  // Copy the entire string
    var_str[strlen(yytext)] = '\0';  // Null-terminate the string
    toLowercase(var_str);  // Convert string to lowercase
    yylval.var_str = strdup(var_str);
    return VARIABLE;
}
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

[ \t]+ /* ignore whitespace */
\n {lineCount++;}
. {printf("Invalid character: %s at line %d\n", yytext, lineCount);}

%%





