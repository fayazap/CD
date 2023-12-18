
%{
    #include<stdio.h>
    int flag=0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
calc : E { printf("Result = %d\n", $1); 
			  return 0;
			};

E : E'+'T { $$ = $1 + $3; }
     | E'-'T { $$ = $1 - $3; }
     | T { $$ = $1; }
     ;

T : T'*'F { $$ = $1 * $3; }
     | T'/'F { $$ = $1 / $3; }
     | F { $$ = $1; }
     ;

F : '('E')' { $$ = $2; }
       | NUMBER { $$ = $1; }
       ;


%%

void main()

{

    printf("\nEnter Any Arithmetic Expression :\n");
    yyparse();
    if(flag==0){
        printf("\nEntered arithmetic expression is Valid\n\n");
    }
}

void yyerror()

{
    printf("\nEntered arithmetic expression is Invalid\n\n");
    flag=1;

}


