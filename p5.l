%{                                              /* definition section */

/* ******************************
CS 59000
P5
Group 25
1       Mohammed Shariq Saaduddin Ahmed 700746549       mxa65490
2       Ganeshwara Annabathula          700759920       gxa99200
3       Sreeja Arava                    700754019       sxa40190
4       Shuklavardhan Reddy Bandyala    700744486       sxb44860
5       Srujan Boddupalli               700756089       sxb60890

a yacc program that creates a simple integer calculator with +, -, *, /, %, (-), ^, ( ).

****************************** */

#include <stdio.h>
#include <ctype.h>
#include <math.h>
%}

%token NUMBER

%%                                              /* rules and action section */

command : exp   {printf("%d\n",$1);}
        ;

exp     : exp '+' term  {$$ = $1 + $3;}
        | exp '-' term  {$$ = $1 - $3;}
        | term  {$$ = $1;}
        ;

term    : term '*' term2        {$$ = $1 * $3;}
        | term '/' term2        {$$ = $1 / $3;}
        | term '%' term2        {$$ = $1 % $3;}
        | term2         {$$ = $1;}
        ;

term2   : factor '^' term2      {$$ = pow($1,$3);}
        | factor        {$$ = $1;}
        ;

factor  : NUMBER        {$$ = $1;}
        | '(' exp ')'   {$$ = $2;}
        | '-' NUMBER    {$$=(-1)*$2;}
        ;

%%                                              /* user subroutine section */

main()
{ return yyparse();
}

int yylex(void)
{ int c;
  while((c = getchar()) == ' ')   ;      /* delete all spaces */
  if ( isdigit(c) ) {
    ungetc(c, stdin);                 /* put c back */
    scanf("%d",&yylval);              /* scan the whole integer, c is the first digit */
    return(NUMBER);
  }
  if ( c == '\n') return 0;             /* end of input */
  return(c);                            /* return any other character */
}

int yyerror(char * s)
{ fprintf(stderr,"%s\n",s);
  return 0;
}
