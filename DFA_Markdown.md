# Activity 3.1 - Programando un DFA

Reference for math symbols:
https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols

## Names:
- Emilia Salazar Leipen
- Fernanda Osorio
- Ian Holender 


### Proposito:
Una de las aplicaciones de los autómatas finitos determinísticos es la implementación de reconocedores de tokens en un lenguaje de programación (conocido como Lexer en los compiladores).

En esta actividad deberás hacer un programa que reciba como entrada un archivo con una serie de expresiones aritméticas, escritas bajo ciertas reglas, y entregará como salida el conjunto de tokens reconocidos, indicando su tipo, o indicando que hay un error en su formación, es decir, no se respetaron las reglas establecidas

## Solución:
<span style="color:red;">SOLUTION:</span>
- Para correr el programa se debe ejecutar el archivo 'tokens02.rk' desde la terminal con el comando: 


```Racket -it tokens02.rkt ```



De esta manera inmediatamente se ejecutará el programa y el resultado de la ejecución se mostrará en la terminal. 

- Para modificar el archivo de entrada se debe modificar el parametro de tipo 'string' que se encuentra en la linea 184 del archivo 'tokens02.rkt'.

La salida del programa se muestra a continuación:


```(define result (arithmetic-lexer "( D = a ^ b + 4 + 10 / 9 ")) (displayln result))```

```((op-par . () (var . D) (op . =) (var . a) (op . ^) (var . b) (op . +) (int . 4) (op . +) (int . 10) (op . /) (int . 9) (spa . ))) ```