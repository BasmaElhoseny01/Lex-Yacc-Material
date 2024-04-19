/* Part(1) Definitons */
%{
    /* C Code */
    // Essential Libraries by C
    #include <stdio.h>
    #include <stdlib.h>

    void yyerror(char*s);
    int yylex();   // Func produced by Lex & Called by yyparse()

    // Define array of 26 int
    int sym[26]; /* symbol table */

%}

/* Token Delcerations [To be used by Lex as by including y.tab.h ]*/
%token INTEGER VARIABLE

/* Assocaitivity Left */ /*Order of Precednece is from lowest to highest*/
%left '+' '-'
%left '*' '/'

/* Part 2 Production Rules */
%%
program:
        program statement '\n'              /*Program is Composed of Several Statments Each on a line :D*/
        |                                   /*or epsilon production.*/
        ;

statement:
        expr                               { printf("%d\n",$1); } /*Statment Value[Top of the Stack] is Printed :D*/
        | VARIABLE '=' expr                { sym[$1] = $3; }
        ;
        
expr:
        INTEGER                             { $$ = $1; }       /*Update Value of the Value Stack top by the same value taken out [Default Action]*/ /*Parse Stack The INTEGER token is popped off the parse stack followed by a push of expr*/
        | VARIABLE                          { $$ = sym[$1]; }
        | expr '+' expr                     { $$ = $1 + $3; } /*This {..}  to update Values Stack top [$$] by the sum of the fisrt and third values in the value stack*/
        | expr '-' expr                     { $$ = $1 - $3; }
        | expr '*' expr                     { $$ = $1 * $3; }
        | expr '/' expr                     { $$ = $1 / $3; }
        | '(' expr ')'                      { $$ = $2; }
        ;
%%

/* Part 3 Subroutines */
void yyerror(char *s){
    /* Override yyerror by YAC */
    fprintf(stderr,"%s\n",s);
    exit(1);
}

int main(void){
    yyparse();
    return 0;
}

/*  bison -dy .\simple_calculator\yac.y */
/* gcc lex.yy.c y.tab.c -o simple_cal.exe */