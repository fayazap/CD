%{
#include <stdio.h>
#include <string.h>
%}

%%
.*Faya.* {    
    printf("Contains first 4 characters of name as substring\n");
}

.* {
    printf("Doesn't contain first 4 characters of name as substring: %s\n", yytext);
}
%%

int yywrap() {return 1;}
int main() {
    printf("Fayaz C7B Roll no 27\n");
    printf("Enter the strinf\n");
    yylex();
    return 0;
}
