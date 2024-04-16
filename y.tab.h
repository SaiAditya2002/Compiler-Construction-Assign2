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
    ID = 258,                      /* ID  */
    NUM = 259,                     /* NUM  */
    REAL_NUM = 260,                /* REAL_NUM  */
    CHAR_CONST = 261,              /* CHAR_CONST  */
    PROGRAM = 262,                 /* PROGRAM  */
    VAR = 263,                     /* VAR  */
    INTEGER = 264,                 /* INTEGER  */
    REAL = 265,                    /* REAL  */
    BOOLEAN = 266,                 /* BOOLEAN  */
    CHAR = 267,                    /* CHAR  */
    TO = 268,                      /* TO  */
    DOWNTO = 269,                  /* DOWNTO  */
    IF = 270,                      /* IF  */
    ELSE = 271,                    /* ELSE  */
    WHILE = 272,                   /* WHILE  */
    FOR = 273,                     /* FOR  */
    DO = 274,                      /* DO  */
    ARRAY = 275,                   /* ARRAY  */
    AND = 276,                     /* AND  */
    OR = 277,                      /* OR  */
    NOT = 278,                     /* NOT  */
    START = 279,                   /* START  */
    END = 280,                     /* END  */
    READ = 281,                    /* READ  */
    WRITE = 282,                   /* WRITE  */
    ASSIGN = 283,                  /* ASSIGN  */
    PLUS = 284,                    /* PLUS  */
    MINUS = 285,                   /* MINUS  */
    MUL = 286,                     /* MUL  */
    DIV = 287,                     /* DIV  */
    MOD = 288,                     /* MOD  */
    EQ = 289,                      /* EQ  */
    NEQ = 290,                     /* NEQ  */
    LT = 291,                      /* LT  */
    GT = 292,                      /* GT  */
    LE = 293,                      /* LE  */
    GE = 294,                      /* GE  */
    LPAREN = 295,                  /* LPAREN  */
    RPAREN = 296,                  /* RPAREN  */
    LBRACK = 297,                  /* LBRACK  */
    RBRACK = 298,                  /* RBRACK  */
    COLON = 299,                   /* COLON  */
    SEMICOLON = 300,               /* SEMICOLON  */
    COMMA = 301,                   /* COMMA  */
    PERIOD = 302,                  /* PERIOD  */
    INVALID = 303,                 /* INVALID  */
    OF = 304,                      /* OF  */
    THEN = 305                     /* THEN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ID 258
#define NUM 259
#define REAL_NUM 260
#define CHAR_CONST 261
#define PROGRAM 262
#define VAR 263
#define INTEGER 264
#define REAL 265
#define BOOLEAN 266
#define CHAR 267
#define TO 268
#define DOWNTO 269
#define IF 270
#define ELSE 271
#define WHILE 272
#define FOR 273
#define DO 274
#define ARRAY 275
#define AND 276
#define OR 277
#define NOT 278
#define START 279
#define END 280
#define READ 281
#define WRITE 282
#define ASSIGN 283
#define PLUS 284
#define MINUS 285
#define MUL 286
#define DIV 287
#define MOD 288
#define EQ 289
#define NEQ 290
#define LT 291
#define GT 292
#define LE 293
#define GE 294
#define LPAREN 295
#define RPAREN 296
#define LBRACK 297
#define RBRACK 298
#define COLON 299
#define SEMICOLON 300
#define COMMA 301
#define PERIOD 302
#define INVALID 303
#define OF 304
#define THEN 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 22 "claude.y"

    int num;
    float real;
    char ch;
    char *id;

#line 174 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
