lexer grammar FunnyLangLexer;

FN : 'fn';
IN : 'in';
LET : 'let';
END : 'end' ;

// Punctuation

L_PAREN      : '(';
R_PAREN      : ')';
L_CURLY      : '{';
R_CURLY      : '}';
L_BRACKET    : '[';
R_BRACKET    : ']';
BIND         : '=';
COMMA        : ',';
SEMI         : ';';
COLON        : ':';
DOT          : '.';
ELLIPSIS     : '...';
DOLLAR       : '$';
ELVIS        : '?:'; // Elvis operator as in Kotlin

// Logical

LOGICAL_OR  : 'or';
LOGICAL_AND : 'and';
LOGICAL_NOT : 'not';

// Relation operators

EQUALS            : '==';
NOT_EQUALS        : '!=';
LIKE              : '~=';
LESS              : '<';
LESS_OR_EQUALS    : '<=';
GREATER           : '>';
GREATER_OR_EQUALS : '>=';

// Arithmetic operators

PLUS      : '+';
MINUS     : '-';
CARET     : '^';
STAR      : '*';
DIV        : '/';
MOD        : '%';

IDENTIFIER
    : ('a' .. 'z' | 'A' .. 'Z' | '_') ('a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_')*
    ;

// Number literal

INTEGER_LITERAL : DECIMALS;
DECIMAL_LITERAL : DECIMALS '.' DECIMALS;

fragment DECIMALS: [0-9] ('_'? [0-9])*;

// String literal

STRING_LITERAL
    : '"' ~ '"'* '"'
    | '\'' ~ '\''* '\''
    ;

// Hidden tokens

WS           : [ \t]+        -> channel(HIDDEN);
COMMENT      : '/*' .*? '*/' -> channel(HIDDEN);
TERMINATOR   : [\r\n]+       -> channel(HIDDEN);
LINE_COMMENT : '//' ~[\r\n]* -> channel(HIDDEN);
