/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PROG = 258,                    /* PROG  */
    INT = 259,                     /* INT  */
    REAL = 260,                    /* REAL  */
    BOOLEAN = 261,                 /* BOOLEAN  */
    CHAR = 262,                    /* CHAR  */
    VAR = 263,                     /* VAR  */
    TO = 264,                      /* TO  */
    DOWNTO = 265,                  /* DOWNTO  */
    IF = 266,                      /* IF  */
    ELSE = 267,                    /* ELSE  */
    WHILE = 268,                   /* WHILE  */
    FOR = 269,                     /* FOR  */
    DO = 270,                      /* DO  */
    ARRAY = 271,                   /* ARRAY  */
    AND = 272,                     /* AND  */
    OR = 273,                      /* OR  */
    NOT = 274,                     /* NOT  */
    START = 275,                   /* START  */
    END = 276,                     /* END  */
    READ = 277,                    /* READ  */
    WRITE = 278,                   /* WRITE  */
    OF = 279,                      /* OF  */
    ASSIGN = 280,                  /* ASSIGN  */
    SC = 281,                      /* SC  */
    COLON = 282,                   /* COLON  */
    CM = 283,                      /* CM  */
    ARRLEN1 = 284,                 /* ARRLEN1  */
    ARRLEN2 = 285,                 /* ARRLEN2  */
    INTVAL = 286,                  /* INTVAL  */
    REALVAL = 287,                 /* REALVAL  */
    CHARVAL = 288,                 /* CHARVAL  */
    STRING = 289,                  /* STRING  */
    VARIABLE = 290,                /* VARIABLE  */
    ADD = 291,                     /* ADD  */
    SUB = 292,                     /* SUB  */
    MUL = 293,                     /* MUL  */
    DIV = 294,                     /* DIV  */
    REM = 295,                     /* REM  */
    EQUALS = 296,                  /* EQUALS  */
    NOT_EQUALS = 297,              /* NOT_EQUALS  */
    LESS_THAN = 298,               /* LESS_THAN  */
    GREATER_THAN = 299,            /* GREATER_THAN  */
    LESS_THAN_EQUAL = 300,         /* LESS_THAN_EQUAL  */
    GREATER_THAN_EQUAL = 301,      /* GREATER_THAN_EQUAL  */
    NL = 302                       /* NL  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define PROG 258
#define INT 259
#define REAL 260
#define BOOLEAN 261
#define CHAR 262
#define VAR 263
#define TO 264
#define DOWNTO 265
#define IF 266
#define ELSE 267
#define WHILE 268
#define FOR 269
#define DO 270
#define ARRAY 271
#define AND 272
#define OR 273
#define NOT 274
#define START 275
#define END 276
#define READ 277
#define WRITE 278
#define OF 279
#define ASSIGN 280
#define SC 281
#define COLON 282
#define CM 283
#define ARRLEN1 284
#define ARRLEN2 285
#define INTVAL 286
#define REALVAL 287
#define CHARVAL 288
#define STRING 289
#define VARIABLE 290
#define ADD 291
#define SUB 292
#define MUL 293
#define DIV 294
#define REM 295
#define EQUALS 296
#define NOT_EQUALS 297
#define LESS_THAN 298
#define GREATER_THAN 299
#define LESS_THAN_EQUAL 300
#define GREATER_THAN_EQUAL 301
#define NL 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 6 "prog.y"

	char* sval; 
	char* var_str;
	int c1, c2, Int; 
	float Float;
	char Char;
	

#line 170 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
