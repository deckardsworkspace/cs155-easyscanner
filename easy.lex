/**
  * @file easy.lex
  * @brief EASY Lexical Analyzer
  * @author Jared Dantis
  * @version 0.1
  * @date 2023-05-04
  * 
  */

/**
  * Preamble
  */
%{
#include <stdio.h>
%}

/**
  * Definitions
  */
/* Single line comments: // ... */
COMMENT           \/\/[^\n]*

/* Reserved words */
KEYWORD           go\ to|exit|if|then|else|case|endcase|while|endwhile|repeat|until|loop|forever|for|to|by|do|endfor|input|output|array|node|call|return|stop|end|procedure
BOOLEAN           true|false

/* Alphanumeric characters */
LETTER            [A-Za-z]
DIGIT             [0-9]

/* Literals */
NUMERIC_LIT       -?{DIGIT}+(\.{DIGIT}*)?
STRING_LIT        \'[^\'\n]*\'

/* Identifiers: Alphanumeric with possible underscores */
IDENTIFIER        {LETTER}({LETTER}|{DIGIT}|_)*

/* Delimiters: Group and separate tokens */
DELIMITER         \[|\]|\(|\)|,|;|:

/* Operators */
ASSIGNMENT        =
OPERATOR          \+|\-|\/|\*|\^|and|or|not|<|>|<=|>=|==|!=

/* Whitespace */
WHITESPACE        [ \s\n\r\t]+

/**
  * Rules
  */
%%
{KEYWORD}                       printf("<%s, KEYWORD>\n", yytext);
{BOOLEAN}                       printf("<%s, BOOLEAN>\n", yytext);
{ASSIGNMENT}                    printf("<%s, ASSIGNMENT>\n", yytext);
{NUMERIC_LIT}                   printf("<%s, NUMERIC_LITERAL>\n", yytext);
{IDENTIFIER}                    printf("<%s, IDENTIFIER>\n", yytext);
{OPERATOR}                      printf("<\'%s\', OPERATOR>\n", yytext);
{STRING_LIT}                    printf("<%s, STRING_LITERAL>\n", yytext);
{WHITESPACE}                    /* do nothing */
{DELIMITER}                     printf("<\'%s\', DELIMITER>\n", yytext);
{COMMENT}                       /* do nothing */
%%

/**
  * Program logic
  */
int main() {
  yylex();
}
