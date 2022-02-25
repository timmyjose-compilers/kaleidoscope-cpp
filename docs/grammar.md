# Kaleidoscope grammar

Adapted from https://github.com/jauhien/iron-kaleidoscope/grammar.ebnf.

Notation: 

  - token representations are enclosed within `<>`
  - `//` indicates a comment
  - literal characters are enclosed in quotes
  - `[x]` indicates that `x` is optional (zero or one occurrences of `x`)
  - `{x}` indicates zero or more occurrences of `x`
  - `x | y` indicates a choice between `x` and `y`
  - `~x` indicates negation of `x`
  - parentheses are for grouping


```
program          ::= { (statement | expression) [ ";" ]  }

statement        ::= declaration | definition

declaration      ::= "extern" prototype

definition       ::= "def" prototype expression

prototype        ::= ( Ident | Binary Op [ Number ]  | Unary Op ) "(" { Ident "," ? } ")"

expression       ::= primary_expr (Op primary_expr)*

primary_expr     ::= Ident | Number | call_expr | parenthesis_expr | conditional_expr | loop_expr | unary_expr | var_expr 

call_expr        ::= Ident "(" { expression [Comma] } ")"

parenthesis_expr ::= "(" expression ")"

conditional_expr ::= "if" expression "then" expression "else" expression

loop_expr        ::= "for" Ident "=" expression "," expression [ "," expression ] "in" expression

unary_expr:      ::= Op primary_expr

var_expr         ::= "var" Ident ["=" expression] { "," Ident [ "=" expression ] } "in" expression

```

Lexical grammar

```
  Comments ::= 

  Whitespace ::= 

  Ident ::= (a-z | A-Z | _) { a-z | A-Z | 0-9 |  _ }

  Number ::= {0-9} [  "."  {0-9} ]

  Op ::= "+" | "-" | "*" | "/" | "<"  | "<=" | ">" | ">=" | "==" | "!=" 

```