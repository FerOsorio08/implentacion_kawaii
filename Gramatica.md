# Definir una gramática para el lenguaje de programación Elixir
Emilia Salazar Leipen

Fernanda Osorio Arroyo

Ian Holender Mariaca
<div style="text-align: justify">
## 1. Definir un modulo y una función

## **BNF**
< defmodule > ::= "defmodule" < module_name > "do" \n\t< module_functions > \n"end"

< module_functions > ::= < function > | < function > < module_functions >

< function > ::= "def" < function_name > "(" < parameters > ")" "," "do" < function_body > "end" | "def" < function_name > "(" < parameters > ")" < args > < identifier > "," "do"  < function_body > "end" | def" < function_name > "(" < parameters > ")" < args > < identifier > "do" \n\t < function_body > "end" | def" < function_name > "(" < parameters > ")" "do" \n\t < function_body > "end"

< parameters > ::= < identifier > | < identifier > "," < parameters >

< functon_body > ::= < identifier > | < identifier > < function_body >

< identifier > ::= < letters > | < letters > < identifier > | < number > | < number > < identifier > | < symbol > | < symbol > < identifier >

< module_name > ::= < caps > + < identifier > | "_" + < identifier >

< function_name > ::= < lower > + < identifier > | "_" + < identifier >

< args > ::= "when" | "cond" | "if" | "unless" | "case" 

< letters > ::= < lower > | < caps >

< caps > ::= "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z"

< lower > ::= "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" 

< number > ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

< symbol > ::= "_" | "-" | "." | "!" | "?" | 

## **EBNF**

DEFMODULE ::= DEFMODULE MODULENAME 'do' MODULE_FUNCTIONS 'end'

MODULE_FUNCTIONS ::= FUNCTION | FUNCTION MODULE_FUNCTIONS

FUNCTION ::= 'def' FUNCTION_NAME '(' PARAMETERS ')' ',' 'do' FUNCTION_BODY 'end' | 'def' FUNCTION_NAME '(' PARAMETERS')' ARGS IDENTIFIER ',' 'do' FUNCTION_BODY 'end' |  'def' FUNCTION_NAME '(' PARAMETERS ')' ARGS IDENTIFIER 'do' FUNCTION_BODY 'end' | 'def' FUNCTION_NAME '(' PARAMETERS ')' 'do' FUNCTION_BODY 'end'

PARAMETERS::= IDENTIFIER | IDENTIFIER ',' PARAMETERS

FUNCTION_BODY ::= IDENTIFIER | IDENTIFIER FUNCTION_BODY

IDENTIFIER ::= LETTERS | LETTERS IDENTIFIER | NUMBER | NUMBER IDENTIFIER | SYMBOL | SYMBOL IDENTIFIER

MODULE_NAME ::= CAPS + IDENTIFIER | '_' + IDENTIFIER

FUNCTION_NAME ::= LOWER + IDENTIFIER | '_' + IDENTIFIER

ARGS ::= 'when' | 'cond' | 'if' | 'unless' | 'case'

LETTERS ::= LOWER | CAPS

CAPS ::= 'A' | 'B' | 'C' | 'D' | 'E' | 'F' | 'G' | 'H' | 'I' | 'J' | 'K' | 'L' | 'M' | 'N' | 'O' | 'P' | 'Q' | 'R' | 'S' | 'T' | 'U' | 'V' | 'W' | 'X' | 'Y' | 'Z'

LOWER ::= 'a' | 'b' | 'c' | 'd' | 'e' | 'f' | 'g' | 'h' | 'i' | 'j' | 'k' | 'l' | 'm' | 'n' | 'o' | 'p' | 'q' | 'r' | 's' | 't' | 'u' | 'v' | 'w' | 'x' | 'y' | 'z' 

NUMBER ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'

SYMBOL ::= '_' | '-' | '.' | '!' | '?'

</div>





