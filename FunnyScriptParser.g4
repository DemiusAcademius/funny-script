parser grammar FunnyLangParser;

options {
    tokenVocab = FunnyLangLexer;
}

script : statement+ EOF ;

statement : function | expression1 ;

function : FN identifier L_PAREN (identifier (COMMA identifier)*)? R_PAREN BIND expression1 ;

expression1
    : MINUS expression2                                  # unaryMinus
    | left=expression1 op=(STAR|DIV) right=expression2   # factors
    | left=expression1 op=(PLUS|MINUS) right=expression2 # terms
    | left=expression1 op=(EQUALS
                          | NOT_EQUALS
                          | LESS
                          | LESS_OR_EQUALS
                          | GREATER
                          | GREATER_OR_EQUALS
                          | IN
                          | LIKE) right=expression2   # comparison
    | LOGICAL_NOT expression2                         # logicalNot
    | left=expression1 LOGICAL_AND right=expression2  # logicalEnd
    | left=expression1 LOGICAL_OR right=expression2   # logicalOr
    | expression2                                     # precedenceTreeExpr
    ;

expression2
    : (decimalLiteral | integerLiteral | stringLiteral | qualifiedIdentifier | parameter) # atom
    | target=expression2 L_PAREN (expression1 (COMMA expression1)*)? R_PAREN # functionCall
    | L_PAREN expression1 R_PAREN                         # parenthesis
    | LET binding (COMMA binding)* IN expression1 END     # letBindings
    ;

binding : identifier BIND expression1 ;

identifier : IDENTIFIER ;
qualifiedIdentifier : identifier (DOT identifier)* ;
parameter : DOLLAR name=IDENTIFIER ;

decimalLiteral : DECIMAL_LITERAL;
integerLiteral : INTEGER_LITERAL;
stringLiteral : STRING_LITERAL;
