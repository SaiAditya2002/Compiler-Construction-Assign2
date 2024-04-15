%{
#include<stdio.h>
#include<string.h>
#include "utils.h"

extern char *yytext;
//add others recd from lex
%}



%token PROG
%token BEGIN
%token DO
%token IF
%token THEN
%token ELSE
%token VAR
%token ASSIGN
%token FOR
%token DOWNTO
%token WHILE
%token<string> INT
%token<string> REAL
%token BOOL
%token<string> CHAR
%token<string> id


%right ELSE THEN
%right NOT
%right ASSIGN

%left MULT
%left ADD

%type<string> Heading;
%type <Block> Block;
%type <var1> var1; 
//do for the rest

