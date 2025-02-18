## Flex Reference

<details>
<summary>What are the major components of a typical Flex source file ?</summary>
A flex file is typically devided into 3 broad sections divided by '%%' symbol
<li>Section 1: Contains declarations and options settings. This section can additionally contain code blocks demarketed by '%{...%}' that can contain c code that is copied as-is directly to the output c file.</li>
<li>Section 2: contains lines. Each line has the format: Regular Expression  then a '{}' single or multiline block that contain c code descrbing the action that needs to be taken in case that regular expression matches.</li>
<li>Section 3: This section that again contains C-Code (usually small routines) that is directly copied to the output file.</li>

```flex
%{
    /*C code*/
%}
Declarations & settings
%%
regular expression   {C code}
regular expression   {C code}
%%
C code
```
</details>
<details>
<summary>What is <b>yytext</b>?</summary>
In any flex action, <b>yytext</b> always points to the part of the input text that matched with regular expression.
</details>

<details>
<summary>What is <b>yylex()</b>?</summary>
This is how you invoke the scanner routine.
</details>

<details>
<summary>How to tell flex to match a string as is?</summary>
Put then in double quotes <b>""</b>: Ex: I want to match: <b>hello world</b> exactly then we can write: <b>"hello world"</b>
</details>

<details>
<summary>What is a <b>token</b>?</summary>
A token is the unit of communication between the scanner and the rest of the system. A scanner tokenizes the input and returns it to the caller module. A token has two parts:
<li>The token type: this is decided by the caller module</li>
<li>The token value: This is matched part of the input text that is returned by the scanner to the caller.</li>
</details>

<details>
<summary>How to use flex scanner as a coroutine?</summary>
The scanner coroutine is invoked by calling <b>yylex</b>. The yylex cal continues till it encounters a token that has a return statement. it returns the token in the following manner: the return value of yylex is the token type while <b>yytext</b> is set to the value of the token. The scanner routine remembers where it left off before returning the token and rusumes scanning from where it left off on the next call to the yylex.
</details>