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
Esta solución fue implementada en el lenguage de programación Racket. El automata que resuelve el problema se encuentra en el archivo: diagrama3.2.mmd
Para poder correrlo es necesrio tener instaladas las extensiones:
- Racket
- DrRacket
- Magic Racket
- Mermaid Editor (para visualizar el diagrama)
- Mermaid Preview (para visualizar el diagrama)
- Mermaind Markdown Syntax Highlighting (para visualizar el diagrama)


Para correr el programa se debe ejecutar el archivo 'tokens02.rk' desde la terminal con el comando: 


```Racket -it tokens02.rkt ```



De esta manera inmediatamente se ejecutará el programa y el resultado de la ejecución se mostrará en la terminal. 

- Para modificar el archivo de entrada se debe modificar el parametro de tipo 'string' que se encuentra en la linea 192 del archivo 'tokens02.rkt'.

La salida del programa se muestra a continuación:


```(define result (arithmetic-lexer "( D = a ^ b + 4 + 10 / 9 ")) (displayln result))```

```((op-par . () (var . D) (op . =) (var . a) (op . ^) (var . b) (op . +) (int . 4) (op . +) (int . 10) (op . /) (int . 9) (spa . ))) ```

Otro ejemplo: 

```(define result (arithmetic-lexer ")( D = ( a ^ B + 4 + 10 / 9 "))```

```((close_par . )) (op_par . ) (var . D) (op . =) (op_par . () (var . a) (op . ^) (var . B) (op . +) (int . 4) (op . +) (int . 10) (op . /) (int . 9) (spa . ))```

## Diagrama 


Para realizar el programa nosotros hicimos uso del lenguaje "Mermeid"

Para definir la dirección del diagrama (de arriba hacia abajo) usamos:

```direction TB ``` 


Para definir los colores  de las clase: "Start", "accept" y "denay",  usariamos las siguientes lineas de codigo: 

- Para la clase denay:

```classDef deny fill:#FF0000, color:white ,font-weight:bold,stroke-width:2px,stroke:green ```

- Para la clase start:

```classDef start fill:#0000FF, color:white ,font-weight:bold,stroke-width:2px,stroke:green ```

- Para la clase accept:

```classDef accept fill:#55FF33, color:black ,font-weight:bold,stroke-width:2px,stroke:green  ```

Ahora iremos ingresando los datos dentro de nuestro diagrama y estaremos estableciedno las transiciones entre los estados


Para una ransición del estado inicial "Start" a "sign" cuando se encuentra un signo + o -

```Start--> sign: +|- ```   

Para una transición del estado inicial "Start" a "int" cuando se encuentra un dígito

```Start--> int: digit ``` 

Para una transición del estado "sign" a "int" cuando se encuentra un dígito

```sign--> int: digit  ``` 


Para una transición del estado "int" a "int" cuando se encuentra otro dígito

```int--> int: digit  ```  


Para una transición del estado "int" a "dot" cuando se encuentra un punto decimal

```int-->dot : dot   ```   

Para una transición del estado "dot" a "float" cuando se encuentra un dígito después del punto decimal

```dot--> float: digit ``` 

Para una transición del estado "float" a "float" cuando se encuentra otro dígito después del punto decimal

```float--> float: digit  ```  

Para una transición del estado "float" a "space" cuando se encuentra un espacio en blanco después del número decimal

```float--> space: space ```

Para una transición del estado "float" a "op" cuando se encuentra un operador después del número decimal

```float--> op: +|-|*|/| =   ```

Para una transición del estado "float" a "e" cuando se encuentra la letra "e" o "E" después del número decimal

```float-->e: e|E   ``` 

Para una transición del estado "space" a "space" cuando se encuentra un espacio en blanco

```space--> space: space ```  

Para una transición del estado "int" a "op" cuando se encuentra un operador después de un número entero

```int--> op: +|-|*|/| =  ``` 

Para una transición del estado "op" a "sign" cuando se encuentra un signo + o -

```op-->sign: +|-  ```

Para una transición del estado "op" a "int" cuando se encuentra un dígito después del operador

```op-->int: digit``` 

Para una transición del estado "op" a "op_spa" cuando se encuentra un espacio después del operador

```op-->op_spa:space ```  

Para una transición del estado "op" a "var" cuando se encuentra un identificador válido después del operador


```op-->var: letter|_|digit|_|letter|   ``` 

Para una transición del estado "op_spa" a "op_spa" cuando se encuentra un espacio:

```op_spa-->op_spa: space ```   

Para una transición del estado "op_spa" a "var" cuando se encuentra un identificador válido después del operador:

```op_spa-->var: letter|_|digit|_|letter|   ``` 

Para una transición del estado "op_spa" a "int" cuando se encuentra un dígito después del operador:

```op_spa-->int: digit     ```      

Para una transición del estado "op_spa" a "sign" cuando se encuentra un signo (+ o -) después del operador:


```op_spa-->sign ```    

Para una transición del estado "var" a "var" cuando se encuentra una variable válida:

```var-->var: letter|_|digit|_|letter|   ```   

Para una transición del estado "var" a "space" cuando se encuentra un espacio:

```var-->space: space     ```       

Para una transición del estado "var" a "op" cuando se encuentra un operador (+, -, *, / o =):

```var-->op: +|-|*|/| =  ```   

Para una transición del estado "int" a "e" cuando se encuentra una letra "e" o "E":

```int-->e: e|E  ```    

Para una transición del estado "e" a "e_sign" cuando se encuentra un signo (+ o -):

```e-->e_sign: +|-   ```

Para una transición del estado "e" a "exp" cuando se encuentra un dígito:

```e-->exp: digit   ```          

Para una transición del estado "e_sign" a "exp" cuando se encuentra un dígito o un espacio:

```e_sign-->exp: digit | space  ``` 

Para una transición del estado "exp" a "exp" cuando se encuentra un dígito:

```exp-->exp: digit  ``` 

Para una transición del estado "exp" a "space" cuando se encuentra un espacio:

```exp-->space: space    ```  

Para una transición del estado "exp" a "op" cuando se encuentra un operador (+, -, *, / o =):

```exp-->op: +|-|*|/| =   ``` 

Las siguientes líneas indican cuales son los estados que se aceptan y cuáles se niegan.

Para definir los colores para el inicio del diagrama: 

```class Start start```

Para definir los colores en las estados aceptados : 

```class int accept ```
```class var accept ```
```class space accept ```
```class exp accept ```
```class float accept ```

Para definir los colores en los estados declinados: 

```class sign deny ```
```class dot deny ```
```class e deny ```
```class e_sign deny ```
```class op deny ```
```class op_spa deny ```

