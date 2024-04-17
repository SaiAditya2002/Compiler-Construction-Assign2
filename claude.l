%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%%
[Pp][Rr][Oo][Gg][Rr][Aa][Mm]  return PROGRAM;
[Ii][Nn][Tt][Ee][Gg][Ee][Rr]  return INTEGER;
[Rr][Ee][Aa][Ll]           	return REAL;
[Bb][Oo][Oo][Ll][Ee][Aa][Nn]  return BOOLEAN;
[Cc][Hh][Aa][Rr]           	return CHAR;
[Vv][Aa][Rr]              	return VAR;
[Tt][Oo]            		return TO;
[Dd][Oo][Ww][Nn][Tt][Oo]      return DOWNTO;
[Ii][Ff]             		return IF;
[Ee][Ll][Ss][Ee]           	return ELSE;
[Ww][Hh][Ii][Ll][Ee]          return WHILE;
[Ff][Oo][Rr]            	return FOR;
[Dd][Oo]              		return DO;
[Aa][Rr][Rr][Aa][Yy]          return ARRAY;
[Aa][Nn][Dd]            	return AND;
[Oo][Rr]            		return OR;
[Nn][Oo][Tt]           		return NOT;
[Bb][Ee][Gg][Ii][Nn]          return START;
[Ee][Nn][Dd]            	return END;
[Rr][Ee][Aa][Dd]            	return READ;
[Ww][Rr][Ii][Tt][Ee]          return WRITE;
[Oo][Ff] 				return OF;

[a-zA-Z_][a-zA-Z0-9_]*    {yylval.id = strdup(yytext); return ID;}
[0-9]+                    {yylval.num = atoi(yytext); return NUM;}
[0-9]+\.[0-9]+            {yylval.real = atof(yytext); return REAL_NUM;}
\'[^\']\'                 {yylval.ch = yytext[1]; return CHAR_CONST;}
":="                      return ASSIGN;
"+"                       return PLUS;
"-"                       return MINUS;
"*"                       return MUL;
"/"                       return DIV;
"%"                       return MOD; 
"="                       return EQ;
"<>"                      return NEQ;
"<"                       return LT;
">"                       return GT;
"<="                      return LE;
">="                      return GE;
"("                       return LPAREN;
")"                       return RPAREN;
"["                       return LBRACK;
"]"                       return RBRACK;
":"                       return COLON;
";"                       return SEMICOLON;
","                       return COMMA;
"."                       return PERIOD;
"//".*                    /* ignore comments */
\n { }
[ \t\n]+                  /* ignore whitespace */
.                         {printf("Invalid character: %s\n", yytext); return INVALID;}
%%
