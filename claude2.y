%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SYMBOL_TABLE_SIZE 100

typedef struct {
    char *name;
    char *type;
    int value;
    int size;
} SymbolEntry;

SymbolEntry symbolTable[SYMBOL_TABLE_SIZE];
int symbolTableIndex = 0;

void addToSymbolTable(char *name, char *type, int value, int size);
void printSymbolTable();
%}

%union {
    int num;
    float real;
    char ch;
    char *id;
}

%token <id> ID
%token <num> NUM
%token <real> REAL_NUM
%token <ch> CHAR_CONST
%token PROGRAM VAR INTEGER REAL BOOLEAN CHAR TO DOWNTO IF ELSE WHILE FOR DO ARRAY AND OR NOT START END READ WRITE ASSIGN PLUS MINUS MUL DIV MOD EQ NEQ LT GT LE GE LPAREN RPAREN LBRACK RBRACK COLON SEMICOLON COMMA PERIOD INVALID OF THEN

%type <id> type

%%

program: PROGRAM ID SEMICOLON var_decl_section begin_end PERIOD { printf("Valid Program\n"); return 0;}
       ;

var_decl_section: VAR var_decl_list {printf("var_decl_section\n");}
                | /* empty */
                ;

var_decl_list: var_decl_list var_decl {printf("var_decl_list1\n");}
             | var_decl {printf("var_decl_list2\n");}
             ;

var_decl: ID_list_colon type SEMICOLON {printf("var_decl 1\n");}
        | ID COLON ARRAY LBRACK NUM PERIOD PERIOD NUM RBRACK OF type SEMICOLON
        {
            printf("var_decl 2\n");
            addToSymbolTable($1, $11, 0, $8 - $5 + 1);
        }
        ;

ID_list_colon: ID_list COLON
             ;

ID_list: ID
       {
           printf("ID_list 1\n");
           addToSymbolTable($1, "", 0, 1);
       }
       | ID_list COMMA ID
       {
           printf("ID_list 2\n");
           addToSymbolTable($3, "", 0, 1);
       }
       ;

type: INTEGER {$$ = "integer";}
    | REAL {$$ = "real";}
    | BOOLEAN {$$ = "boolean";}
    | CHAR {$$ = "char";}
    ;

begin_end: START stmt_list END {printf("begin_end 1\n");}
         ;

stmt_list: stmt_list stmt
         | stmt
         ;

stmt: assign_stmt | if_stmt | while_stmt | for_stmt | read_stmt | write_stmt | compound_stmt
    ;

assign_stmt: ID ASSIGN expr SEMICOLON
           | ID LBRACK expr RBRACK ASSIGN expr SEMICOLON
           ;

if_stmt: IF expr THEN matched_stmt
       | IF expr THEN matched_stmt ELSE if_stmt
       ;

matched_stmt: matched_stmt ELSE matched_stmt
            | other_stmt
            ;

other_stmt: assign_stmt | while_stmt | for_stmt | read_stmt | write_stmt | compound_stmt
          ;

while_stmt: WHILE expr DO stmt
          ;

for_stmt: FOR ID ASSIGN expr TO expr DO stmt
        | FOR ID ASSIGN expr DOWNTO expr DO stmt
        ;

read_stmt: READ LPAREN ID RPAREN SEMICOLON
         | READ LPAREN ID LBRACK expr RBRACK RPAREN SEMICOLON
         ;

write_stmt: WRITE LPAREN str RPAREN SEMICOLON
          | WRITE LPAREN expr RPAREN SEMICOLON
          | WRITE LPAREN expr COMMA expr RPAREN SEMICOLON
          ;

str: CHAR_CONST
   | str CHAR_CONST
   ;

compound_stmt: START stmt_list END
             ;

expr: expr PLUS term | expr MINUS term | term
    ;

term: term MUL factor | term DIV factor | term MOD factor
    | factor
    ;

factor: NUM | REAL_NUM | ID | ID LBRACK expr RBRACK | LPAREN expr RPAREN
      ;

%%

void addToSymbolTable(char *name, char *type, int value, int size) {
    if (symbolTableIndex >= SYMBOL_TABLE_SIZE) {
        printf("Error: Symbol table is full.\n");
        exit(1);
    }
    symbolTable[symbolTableIndex].name = strdup(name);
    symbolTable[symbolTableIndex].type = strdup(type);
    symbolTable[symbolTableIndex].value = value;
    symbolTable[symbolTableIndex].size = size;
    symbolTableIndex++;
}

void printSymbolTable() {
    printf("Symbol Table:\n");
    printf("Variable\tType\tValue\tSize\n");
    for (int i = 0; i < symbolTableIndex; i++) {
        printf("%s\t\t%s\t%d\t%d\n", symbolTable[i].name, symbolTable[i].type, symbolTable[i].value, symbolTable[i].size);
    }
}

int main() {
    yyparse();
    printSymbolTable();
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
