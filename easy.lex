/**
  * @file easy.lex
  * @brief EASY Lexical Analyzer
  * @author Jared Dantis
  * @version 0.1
  * @date 2023-05-04
  * 
  */

/**
  * C code
  */
%{
#include <stdio.h>
%}

/**
  * Definitions
  */
/* Single line comments: // ... */
COMMENT  \/\/[^\n]*

/* Reserved words: procedure, if, else, call, output, end */
KEYWORD  go\ to|exit|if|then|else|case|endcase|while|endwhile|repeat|until|loop|forever|for|to|by|do|endfor|input|output|array|node|call|return|stop|end|procedure

LETTER   [A-Za-z]
DIGIT    [0-9]

/**
  * Rules
  */
%%
{COMMENT}                       /* do nothing */
{KEYWORD}                       printf("<%s, KEYWORD>\n", yytext);
'{LETTER}*'                         printf("<%s, STRING>\n", yytext);
{LETTER}({LETTER}|{DIGIT})*     printf("<%s, IDENTIFIER>\n", yytext);
=                               printf("<%s, ASSIGNMENT>\n", yytext);
-?{DIGIT}+(\.{DIGIT}*)?         printf("<%s, NUMERIC>\n", yytext);
%%

/**
  * Program logic
  */
int main() {
  yylex();
}
