/* scanner that counts the number of characters, words, and lines in a file */
/* ... definitions ... */

%{
    int nchar,nword,nline;
%}

/* ... rules ... */
%%
\n          { nline++; nchar++; }  /*new line is considered as a char*/
[^ \t\n]+   { nword++; nchar += yyleng; }
.           { nchar++; }
%%

/* ... subroutines ... */
int yywrap(void) {
    // Returning 1 indicates that there are no more input files to process
    return 1;
}

int main(void){
    yylex();
    printf("nchar: %d\t nword:%d\t nline:%d\n",nchar,nword,nline);
    return 0;
}

/* flex .\code_4\lex.l */
/* gcc -o lexer .\lex.yy.c */
/* .\lexer.exe */