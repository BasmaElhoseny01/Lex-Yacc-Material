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
[a-z]           {
                    yylval.sIndex = yytext[0] -'a';  // 1 Char variable is assumed
                    return VARIABLE;

                }

0               {
                    yylval.iValue = atoi(yytext);
                    return INTEGER;
                }   

[1-9][0-9]+     {
                    yylval.iValue = atoi(yytext);
                    return INTEGER;
                }

[-()<>=+*/;{}.] {
                    return yytext[0];
                }

">="             { return GE; }
"<="             { return LE; }
"=="             { return EQ; }
"!="             { return NE; }
"while"          { return WHILE; }
"if"             { return IF; }
"else"           { return ELSE; }
"print"          { return PRINT; }

[ \t\n]+          ; /*Ignore White Space*/

.                 yyerror("nknown character");
 
%%

/* Part 3 Subroutines */
int yywrap(void){
    return 1;
}

/* flex .\complex_calculator\lex.l */
/* gcc lex.yy.c y.tab.c -o complex_cal.exe */