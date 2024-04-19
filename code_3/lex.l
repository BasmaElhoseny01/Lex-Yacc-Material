/* ... definitions ... */

/* substitutions */
digit [0-9]
letter [A-Za-z]


%{
    // Code in definitions Sections must be enclosed in %{%}
    int count;
%}

/* ... rules ... */

%%
    /* Match Identifier */
{letter}({letter}|{digit})*   count++;

%%
/* ... subroutines ... */

int yywrap(void) {
    // Returning 1 indicates that there are no more input files to process
    return 1;
}

int main(void){
    yylex();
    printf("number of identifiers = %d\n",count);
    return 0;
}
