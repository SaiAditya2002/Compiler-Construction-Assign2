yacc -d claude.y
lex claude.l
gcc y.tab.c lex.yy.c -ll
./a.out

