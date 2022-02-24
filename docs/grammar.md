# Kaleidoscope grammar

Adapted from https://github.com/jauhien/iron-kaleidoscope.

```
  program          ::= {(statement | expression) Delimiter? }
  statement        ::= (declaration | definition)
  declaration      ::= "extern" prototype
  definition       ::= "def" prototype expression
  prototype        ::= Ident "(" {Ident "," ?} ")"
  expression       ::= (primary_expr {Op primary_expr})
  primary_expr     ::= (Ident | Number | call_expr | parenthesis_expr)
  call_expr        ::= Ident "(" {expression ","? } ")"
  parenthesis_expr ::= "(" expression ")"
```