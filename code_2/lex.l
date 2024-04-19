%{
    int yylineno;
%}

%%
^(.*)\n      printf("%4d\t%s", ++yylineno, yytext);
%%

/* ... subroutines ... */

int yywrap(void) {
    return 1;
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
}

/* flex .\code_2\lex.l */
/* gcc -o lexer \lex.yy.c */
/* .\lexer.exe .\file.txt */