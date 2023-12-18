%{
#include<stdio.h>
int flag = 0;
int yylex();
void yyerror();
%}

%token NUMBER DO WHILE ID TYPE INC DEC
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%

do_while : DO'{'body'}'WHILE'('expr')'';'; 
stmt: TYPE' 'assign | assign | expr |;
assign: ID'='expr;
body: stmt';'body | ;

expr : factor'+'factor
     | factor'-'factor
     | factor'*'factor
     | factor'/'factor
     | factor'<'factor
     | factor'>'factor
     | factor INC
     | factor DEC
     | factor
     ;



factor : '('expr')' 
       | NUMBER
       | ID
       ;

%%

void main() {
    printf("\nEnter do while :\n");
    yyparse();
    if (flag == 0)
        printf("\nEntered expression is Valid\n\n");
}

void yyerror() {
    printf("\nEntered expression is Invalid\n\n");
    flag = 1;
}

