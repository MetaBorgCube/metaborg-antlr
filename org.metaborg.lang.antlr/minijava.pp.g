grammar minijava;

goal:
  mainClass classDeclaration* EOF
;

mainClass:
  'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' Identifier ')' '{' statement '}' '}'
;

classDeclaration:
  'class' Identifier ('extends' Identifier)? '{' fieldDeclaration* methodDeclaration* '}'
;

fieldDeclaration:
  varDeclaration
;

localDeclaration:
  varDeclaration
;

varDeclaration:
  type Identifier ';'
;

methodDeclaration:
  'public' type Identifier '(' parameterList? ')' '{' methodBody '}'
;

parameterList:
  parameter (',' parameter)*
;

parameter:
  type Identifier
;

methodBody:
  localDeclaration* statement* RETURN expression ';'
;

type:
  'int' '[' ']' | 'boolean' | 'int' | Identifier
;

statement:
  '{' statement* '}' | 'if' LP expression RP ifBlock 'else' elseBlock | 'while' LP expression RP whileBlock | Identifier EQ expression ';' | Identifier LSB expression RSB EQ expression ';'
;

ifBlock:
  statement
;

elseBlock:
  statement
;

whileBlock:
  statement
;

expression:
  expression LSB expression RSB | expression DOTLENGTH | expression '.' Identifier '(' (expression (',' expression)*)? ')' | NOT expression | 'new' 'int' LSB expression RSB | 'new' Identifier '(' ')' | expression TIMES expression | expression PLUS expression | expression MINUS expression | expression LT expression | expression AND expression | IntegerLiteral | BooleanLiteral | Identifier | 'this' | '(' expression ')'
;

AND:
  '&&'
;

LT:
  '<'
;

PLUS:
  '+'
;

MINUS:
  '-'
;

TIMES:
  '*'
;

POWER:
  '**'
;

NOT:
  '!'
;

LSB:
  '['
;

RSB:
  ']'
;

DOTLENGTH:
  '.length'
;

LP:
  '('
;

RP:
  ')'
;

RETURN:
  'return'
;

EQ:
  '='
;

BooleanLiteral:
  'true' | 'false'
;

Identifier:
  JavaLetter JavaLetterOrDigit*
;

fragment JavaLetter:
  [a-zA-Z]
;

fragment JavaLetterOrDigit:
  [a-zA-Z0-9_]
;

IntegerLiteral:
  DecimalIntegerLiteral
;

fragment DecimalIntegerLiteral:
  DecimalNumeral
;

fragment DecimalNumeral:
  '0' | NonZeroDigit (Digits? | Digits)
;

fragment Digits:
  Digit+
;

fragment Digit:
  '0' | NonZeroDigit
;

fragment NonZeroDigit:
  [1-9]
;