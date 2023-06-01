# Actividad Integradora 3.4 Resaltador de sintaxis (evidencia de competencia)
Emilia Salazar Leipen

Fernanda Osorio Arroyo

Ian Holender Mariaca
<div style="text-align: justify">

## Definción de Solución 

Con el fin de poder generar un *Resaltador de Sintaxis* se seleccionaron diferentes lenguajes de programación como: Racket y Python. 
Para realizar el resaltador de Python se seleccionaron las siguietes categorías lexicas: 
- Reserved words
- Logical operators 
- Comments
- Python methods
- Identifier
- Boolean
- Number
- Comparison Operators
- Assigment Operators
- Arithmetic Operators
- Punctuators
- String

Las categorías léxicas de Racket son similiares sin embargo requieren otras categorías para poder hacer un resaltador completo:
- Special Word
- Reserved words
- Logical operators 
- Comments
- Racket methods
- Identifier
- Boolean
- Number
- Comparison Operators
- Assigment Operators
- Arithmetic Operators
- Punctuators
- String
- Character line
- Character literal

Para poder tomar en cuenta todas estas categorías para cada lenguaje se utilizaron expresiones regulares que engloban cada una de ellas. 




### Python

```
~r/(^if|^else|^elif|^while|^for|^print|^return|^len|^str|^def|^import|^class|^try|^except|^break)\b/, "reserved_word")

~r/(^\s+)/, "space")
~r/(^and|^or|^not)\b/, "logical_operator")

~r/^#.*$/

~r/^abs|^all|^any|^ascii|^bin|^bool|^callable|^chr|^classmethod|^compile|^delattr|^dir|^divmod|^enumerate|^eval|^exec|^filter|^float|^format|^getattr|^hasattr|^hash|^help|^hex|^id|^input|^int|^isinstance|^issubclass|^iter|^len|^list|^map|^max|^min|^next|^object|^oct|^open|^ord|^pow|^print|^property|^range|^repr|^reversed|^round|^set|^setattr|^slice|^sorted|^staticmethod|^str|^sum|^super|^tuple|^type|^vars|^zip|^append|^pop/

~r/^[A-Za-z_][A-Za-z_0-9]*/

~r/^True|^False\b/, "boolean")

 ~r/^\b\d+\.?\d*\b/

 ~r/^==|^!=|^>=|^<=|^>|^</

~r/^\+=|^-=|^\*=|^\/=|^%=|^\*\*=|^=/, "assigment_operator"

~r/^\+|^-|^\*|^\/|^%|^\*\*|^\/\//

 ~r/^[\[\](){}:,.\]]/

 ~r/(^['"])(?:(?!\1).)*\1/
```



### Racket
```

hhh

```

### Instrucciónes para el código
1. Debes estar en el folder de Evidencia_Final
2. Debes ir al archivo titulado TOK.iex
3. Dirigirse al final del archivo dinde van a haber 6 líneas de código se encuentran en la línea 252, y se van a ver de la siguiente manera:
4. Comentar las tres líneas que no quiere usar dependiendo el tipo de códogo que quiera correr ya sea python o elixir
5. Correr el archivo completo y dirigirse a Tokens_racket.html o Tokens.html dependiendo el archivo que visualizó para ver el el código ya con los colores de los tokens.
6. Poner mouse arriba del botón de menú para ver menú de tojens y los colores asignados.

### Análisis Big - O
El big-O de nuestro archivo es lineal --> O(n), gracias a la recursividad del código. Esta determinado por las funciones de resaltador que son las de complejidad de O(n), ya que n representa el número total de caracteres en el archivo recibido.
