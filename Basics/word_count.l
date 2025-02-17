%{
    int words = 0;
    int characters = 0;
    int lines = 0;
%}

%%

[a-zA-Z]+   {words++; characters += strlen(yytext);}
\n          {characters++; lines++;}
.           {characters++;}

%%

int main(int argc, char **argv){
    yylex();
    printf("Characters: %8d | Words: %8d | Lines: %8d\n", characters, words, lines);
}

/*
The quick brown fox jumped over the lazy dog.
A thing of Beauty is joy forever
Hello World!
Characters:       92 | Words:       18 | Lines:        3
*/
