%{
#include <stdlib.h>
#include "calc3.h"
#include "y.tab.h"
void yyerror(char *);
%}

%%

[a-z]       { 
                yylval.sIndex = *yytext - 'a';
                return VARIABLE;
            }

0           {
                yylval.iValue = atoi(yytext);
                // yylval.iValue   rem yylval is defiend to hvae YYSTYPE  which is union of 3 %union int iValue/char sIndex/nodeType *nPtr
                // yytext is another predefined variable in lexer specifications (often used with lex or Flex) that holds the text of the most recently matched token.
                return INTEGER;
            }

[1-9][0-9]* {
                yylval.iValue = atoi(yytext);
                // yytext is another predefined variable in lexer specifications (often used with lex or Flex) that holds the text of the most recently matched token.
                return INTEGER;
            }

[-()<>=+*/;{}.] {
                return *yytext;
             }

">="            return GE;
"<="            return LE;
"=="            return EQ;
"!="            return NE;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;

[ \t\n]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
