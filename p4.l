%{                                              /* definition section */

/* ******************************
CS 59000
Group 25
1       Mohammed Shariq Saaduddin Ahmed 700746549       mxa65490
2       Ganeshwara Annabathula          700759920       gxa99200
3       Sreeja Arava                    700754019       sxa40190
4       Shuklavardhan Reddy Bandyala    700744486       sxb44860
5       Srujan Boddupalli               700756089       sxb60890


a yacc program that creates a simple integer calculator with +, -, *, /, (, and ).

****************************** */

#include <stdio.h>
#include <ctype.h>
%}


%%                                              /* rules and action section */

command : exp   {printf("%d\n",$1);}
        ;

exp     : exp '+' term  {$$ = $1 + $3;}
        | exp '-' term  {$$ = $1 - $3;}
        | term  {$$ = $1;}
        ;

term    : term '*' factor       {$$ = $1 * $3;}
        | term '/' factor       {$$ = $1 / $3;}
        | factor        {$$ = $1;}
        ;

factor  : number        {$$ = $1;}
        | '(' exp ')'   {$$ = $2;}
        ;

number  : number digit  {$$ = 10 * $1 + $2;}
        | digit         {$$ = $1;}
        ;

digit   : '0'           {$$ = 0;}
        | '1'           {$$ = 1;}
        | '2'           {$$ = 2;}
        | '3'           {$$ = 3;}
        | '4'           {$$ = 4;}
        | '5'           {$$ = 5;}
        | '6'           {$$ = 6;}
        | '7'           {$$ = 7;}
        | '8'           {$$ = 8;}
        | '9'           {$$ = 9;}
        ;
%%                                              /* user subroutine section */

main()
{ return yyparse();
}

int yylex(void)
{ int c;
  while((c = getchar()) == ' ')   ;      /* delete all spaces */
   if ( c == '\n') return 0;             /* end of input */
  return(c);                            /* return any other character */
}

int yyerror(char * s)
{ fprintf(stderr,"%s\n",s);
  return 0;
}
