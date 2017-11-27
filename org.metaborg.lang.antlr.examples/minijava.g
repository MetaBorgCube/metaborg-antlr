// Source: https://github.com/csaroff/MiniJava-Compiler
grammar minijava;

goal	
:	mainClass classDeclaration* EOF
;

mainClass	
:	'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' Identifier ')' '{' statement '}' '}';

classDeclaration	
:	'class' Identifier ( 'extends' Identifier )? '{' fieldDeclaration* methodDeclaration* '}';

fieldDeclaration
:	varDeclaration ;

localDeclaration
:	varDeclaration ;

varDeclaration	
:	type Identifier ';';

methodDeclaration	
:	'public' type Identifier '(' parameterList? ')' '{' methodBody '}';

parameterList
:   parameter (',' parameter)*
;

parameter
:   type Identifier
;

methodBody
:	localDeclaration* statement* RETURN expression ';'
;

type	
:	'int' '[' ']'
|	'boolean'
|	'int'
|	Identifier
;	

statement	
:	'{' statement* '}'
#nestedStatement
|	'if' LP expression RP ifBlock 'else' elseBlock
#ifElseStatement
|	'while' LP expression RP whileBlock
#whileStatement
|	Identifier EQ expression ';'
#variableAssignmentStatement
|	Identifier LSB expression RSB EQ expression ';'
#arrayAssignmentStatement
;	

ifBlock
:	statement
;

elseBlock
:	statement
;

whileBlock
:	statement
;

expression
:   expression LSB expression RSB
# arrayAccessExpression

|   expression DOTLENGTH
# arrayLengthExpression

|   expression '.' Identifier '(' ( expression ( ',' expression )* )? ')'
# methodCallExpression

|   NOT expression
# notExpression

|   'new' 'int' LSB expression RSB
# arrayInstantiationExpression

|   'new' Identifier '(' ')'
# objectInstantiationExpression

|   expression TIMES expression
# mulExpression

|   expression PLUS expression
# addExpression

|   expression MINUS expression
# subExpression

|   expression LT expression
# ltExpression  

|   expression AND expression
# andExpression

|   IntegerLiteral
# intLitExpression

|   BooleanLiteral
# booleanLitExpression

|   Identifier
# identifierExpression

|   'this'
# thisExpression

|   '(' expression ')'
# parenExpression
;

AND:'&&';
LT:'<';
PLUS:'+';
MINUS:'-';
TIMES:'*';
POWER:'**';
NOT:'!';
LSB:'[';
RSB:']';
DOTLENGTH:'.length';
LP:'(';
RP:')';
RETURN: 'return';
EQ: '=';

BooleanLiteral
:	'true'
|	'false'
;

Identifier
:	JavaLetter JavaLetterOrDigit*
;

fragment
JavaLetter
:	[a-zA-Z] // these are the 'java letters' below 0xFF
;

fragment
JavaLetterOrDigit
:	[a-zA-Z0-9_] // these are the 'java letters or digits' below 0xFF
;

IntegerLiteral
:	DecimalIntegerLiteral
;

fragment
DecimalIntegerLiteral
:	DecimalNumeral
;

fragment
DecimalNumeral
	:	'0'
|	NonZeroDigit (Digits? | Digits)
	;

fragment
Digits
:	Digit+
;

fragment
Digit
:	'0'
|	NonZeroDigit
;

fragment
NonZeroDigit
:	[1-9]
;

//WS
//:   [ \r\t\n]+ -> skip
//;   
//
//MULTILINE_COMMENT
//:  '/*' .*? '*/' -> skip
//;
//
//LINE_COMMENT
//:  '//' .*? '\n' -> skip
//;