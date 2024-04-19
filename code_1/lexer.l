/* The first example is the shortest possible lex file */

/* ... definitions ... */

/* ... rules ... */
%%
.       ECHO; /* match everything except newline */

\n      ECHO; /* match newline */

%%

/* ... subroutines ... */

int yywrap(void) {
    // Returning 1 indicates that there are no more input files to process
    return 1;
}

int main(void) {
    yylex();
    return 0;
}


/* flex lexer.l */
/* Compile[.exe]:  gcc -o lexer lex.yy.c  */
/* .\lexer.exe   */