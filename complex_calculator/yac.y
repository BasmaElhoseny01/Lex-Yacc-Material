/* Part(1) Definitons */
%{
    /* C Code */
    // Essential Libraries by C
    #include <stdio.h>
    #include <stdlib.h>

    // Parser Data Structures
    #include "parser_data_structures.h"

    void yyerror(char*s);
    int yylex();   // Func produced by Lex & Called by yyparse()
%}

/* Union for YYSTYPE which is type of yyval returned by lexer as value for token :D */
%union{
    int iValue;  /* integer value */
    char sIndex; /* symbol table index */
    nodeType *nPtr; /*node pointer*/ 
};

/* Tokens Defintions */
/* This binds INTEGER to iValue in the YYSTYPE union. */
%token <iValue> INTEGER
%token <sIndex> VARIABLE
%token PRINT WHILE IF
%nonassoc IFX
%nonassoc ELSE

/* . Precedence rules determine the order in which operators are applied, while associativity rules determine how operators of the same precedence are grouped. */
%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%type <nPtr> stmt stmt_list expr




/* Part 2 Production Rules */
%%
program:
        function                            {exit(0);}
        ;

function:
        function stmt                       {}
        |                                   /*NULL*/
        ;

stmt:
    ';'                                     {}
    | expr ';'                              {}
    | PRINT expr ';'                        {}
    | VARIABLE '=' expr ';'                 {}
    | WHILE '(' expr ')' stmt               {}
    | IF '(' expr ')' stmt  %prec IFX       {} // [CHECk]
    | IF '(' expr ')' stmt ELSE stmt        {}
    | '{' stmt_list '}'                     {}
    ;

stmt_list:
        stmt                                {}
        | stmt_list stmt                    {}
        ;

expr:
      INTEGER                                 {}
    | VARIABLE                                {}
    | '-' expr   %prec UMINUS                 {} //[CHECK]
    | expr '+' expr                           {}
    | expr '-' expr                           {}
    | expr '*' expr                           {}
    | expr '/' expr                           {}
    | expr '>' expr                           {}
    | expr '<' expr                           {}
    | expr GE expr                           {}
    | expr LE expr                           {}
    | expr NE expr                           {}
    | expr EQ expr                           {}
    | '(' expr ')'                           {}
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

/*  bison -dy .\complex_calculator\yac.y */
/* gcc lex.yy.c y.tab.c -o complex_calculator.exe */