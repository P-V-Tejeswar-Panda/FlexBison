%{
    #include <stdio.h>
%}
%%
"+"     {printf("PLUS\n");}
"-"     {printf("MINUS\n");}
"*"     {printf("MULTIPLY\n");}
"/"     {printf("DIVIDE\n");}
"|"     {printf("ABS\n");}
"("     {printf("OPENPARENTHESIS\n");}
")"     {printf("CLOSEPARENTHESIS\n");}
[0-9]+  {printf("NUMBER: %s\n", yytext);}
[ \t]+  {/*Ignore*/}
.       {printf("Unsupported Char\n");}
%%

int main(int argc, char** argv){
    yylex();
}