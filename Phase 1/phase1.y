%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include<math.h>
	#include <ctype.h>
	#define null 0
	int v = 1;
	int yyerror();
%}

%token DIGITS ID PLUS MINUS MUL DIVIDE NUM STRING INTEGER SPECIAL NL SPACE KEYWORD SPECIAL_START SPECIAL_END IF ELSE WHILE SEP END OR AND NOT IN NOTIN T F COLON SQUAREBRACKET_START SQUAREBRACKET_END MOD EQUAL PLUSEQUAL PRINT COMMENT RANGE SINGLEQUOTE DOUBLEQUOTE EXPONENTIAL COMMA INDENT LIST DIVIDEEQUAL MINUSEQUAL MULEQUAL LESSTHAN LESSTHANEQUAL GREATERTHAN GREATERTHANEQUAL DOUBLEEQUAL NOTEQUAL

%%
%%

int yyerror(){
	printf("\n---------------SYNTAX ERROR : at line number %d ---------------\n");
	v=0;
    return 0;
}

int main(){
    extern FILE* yyin;
	yyin = fopen("input.py","r");
	yyparse();
	if(v){
		printf("---------------PARSE SUCCESSFUL---------------\n");
	}
	return 1;	
}