/* Part(1) Definitons */
%{
    // Essential Libraries by C
    #include <stdio.h>  /* standard input/output library*/
    #include <stdlib.h>

    void yyerror(char*); // Defined in Yac

    // Inlucde File for Token Declartions by the Parser
    #include "y.tab.h"
%}

/* Part 2 Regex Rules */
%%

    /* variables */
[a-z]       {
                yylval = *yytext - 'a';
                return VARIABLE;
            }

    /* integers */
[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }
    
    /* Operators */
[-+()=/*\n] { return *yytext; }

    /*Skip WhiteSpaces*/
[ \t]       ; 

    /* anything else is an error */
.           yyerror("invalid character");

%%

/* Part 3 Subroutines */
int yywrap(void){
    return 1;
}

/* flex .\simple_calculator\lex.l */
/* gcc lex.yy.c y.tab.c -o simple_cal.exe */