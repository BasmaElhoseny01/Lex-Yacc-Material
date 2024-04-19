/* Part(1) Definitons */
%{
    // Essential Libraries by C
    #include <stdio.h>
    #include <stdlib.h>

    // Inlcude File to be able to communicate with yacc file
    #include "y.tab.h"
%}


/* Part 2 Regex Rules */
%%
[0-9]+      { yylval.i = atoi(yytext) ; return INTEGER;}
            /* [a-zA-Z]+      { yylval.c=yytext[0] ; return CHAR;} */ /*Extra to undertsand yylval.i the returned token is CHAR the value is in yylval.c*/
[()-+*/]    { return yytext[0]; }
[ \t\n]     { ; } /*Ignored nothing is returned to the Parser*/
%%

/* Part 3 Subroutines */
int yywrap(){
    return 1;
}

/* flex .\compiler\lex.l */
/* gcc lex.yy.c y.tab.c -o compiler.exe */