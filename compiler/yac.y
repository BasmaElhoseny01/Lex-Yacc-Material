/* Part(1) Definitons */
%{
    // Essential Libraries by C
    #include <stdio.h>
    #include <stdlib.h>

    void yyerror(char*s);
    int yylex();   // Func produced by Lex

%}

%union{
    int i;
    float f; // Not used here
    char c; // Not used here
    char* str; // Not used here
}
%type <i> E T N S
%token <i> INTEGER

/* Part 2 Production Rules */
%%
S : E               { printf("%d\n",$1); }
  ;

E : E '+' T         { $$ = $1 + $3; }  /*Update Value of the Value Stack top by the same value taken out [Default Action]*/ /*Parse Stack The INTEGER token is popped off the parse stack followed by a push of expr*/
  | E '-' T         { $$ = $1 - $3; }
  | T               { $$ = $1; }
  ;

T : T '*' N         { $$ = $1 * $3; }
  | T '/' N         { $$ = $1 / $3; }
  | N               { $$ = $1; }
  ;

N : '(' E ')'       { $$ = $2; }
  | '-' N           { $$ = -1*$2; }
  | INTEGER         { $$ = $1; } /*Update Value of the Value Stack top by the same value taken out [Default Action]*/ /*Parse Stack The INTEGER token is popped off the parse stack followed by a push of expr*/
  ;

%%

/* Part 3 Subroutines */
void yyerror(char* msg){
    /* Override yyerror by YAC */
    fprintf(stderr,"%s\n",msg);
    exit(1);
}

int main(){
    yyparse();
    return 0;
}

/* bison -dy .\compiler\yac.y */
/* gcc lex.yy.c y.tab.c -o compiler.exe */