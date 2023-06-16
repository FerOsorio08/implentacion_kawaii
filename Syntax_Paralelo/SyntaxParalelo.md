# Actividad Integradora 5.3 Resaltador de sintaxis paralelo 

Emilia Salazar    |   Ian Holender   |  Fernanda Osorio

16 de junio de 2023

---

Se realizó la actividad 5.3 Resaltadr de sintaxis en pareleo, utilizando la función *resaltador_multiple_files*. 

Esta función se encuentra dentro del archivo ***"TOK_PARALELO.exs"***. Esta solución acepta varios archivos a la vez y crea un thread para cada uno de ellos. Recibe los archivos desde un folder con la función *resaltador_directory*. 

## Análisis de tiempo y speed up
El tiempo promedio de ejecución para ambas soluciones: 

- Resaltador de sintaxis en paralelo (Actividad 5.3)

- Resaltador de sintaxis (Actividad 3.4)

Se midió utilizando timer.tc: 

 ``` 
timer.tc(fn -> Resaltador_syntaxys.resaltador_directory("./Funciones")end) |> elem(0) |> Kernel./(1_000_000)
 ``` 

El tiempo de ejecución promedio del Resaltador de sintaxis en paralelo es de 0.00160 segundos


![Example Image](/Screenshot%202023-06-16%20at%2015.57.37.png)


El tiempo de ejecución promedio del Resaltador de sintaxis es de 0.507 segundos

![Example Image](/Screenshot%202023-06-16%20at%2015.56.31.png)



**Speed Up**

Usando la formula 

$$ S_{p} = \frac{T_1}{T_{p}} $$

EL *speed up* es $$ \frac{0.507}{0.00160} = \frac{2535}{8} $$ o 316.875. 

Eso muestra que la mejora en tiempo de ejecición es no solamente muy notable sino que también reduce procesos innecesarios. 
A pesar de que ambas soluciones estan correctas y llevan acabo sus procesos de manera pareciera "similar", factores como el tiempo de ejecución revelan la verdad detrás de estas diferentes programaciones.

La programción sencuencial demostró su potencial durante la entrega de la actividad Resaltador de sintaxis (Actividad 3.4); ahora podemos ver que un resultado "correcto" o e "esperado" no siempre reprenseta lo que es mejor para el usuario y el sistema. Un ejemplo de esto es el tiempo de ejecución. O cuando tendenmos a pensar que por ser solamente una línea de código ya es más eficiente que una solución más larga, como se demuestra en la actividad 5.3. este no es el caso. 

El tiempo de ejecución mejoró drasticamente y el speed up es de 316.875. Esto significa que la solución en paralelo es 316.875 veces más rápida que la solución secuencial. Una diferencia muy notable que a pesar de no "hacer la diferencia" en programas como el nuestro, puede ser decicido en proyectos de mayor escala. 

## Análisis de complejidad 

En esta solución a la actidad 5.3, la complejidad varía para cada función. 
En general pudiera considerarse *O(n)* ya que dependiendo del número de archivos que reciba entonces su complejidad irá creciendo conforme a esto. Sin embargo es importante analizar cada función para poder verificar que esto sea cierto. 

### Complejidad de funciones:
- **resaltador(file_path)**: tiene una complejidad constante de O(1) ya que sin importar el tamaño del archivo, siempre se ejecutará en el mismo tiempo y el mismo número de operaciones
- **process_file(file_path, html_file)**: la complejidad de esta función depende del tamaño del input o archivo por lo que su complejidad en de O(n).
- **write header(html_file)**: la complejidad de esta función es constante ya que sin importar el tamaño del archivo siempre se ejecutará en el mismo tiempo y el mismo número de operaciones. Por lo tanto su complejidad es de O(1).
- **write_footer(html_file)**: asi como *write_header* la complejidad de esta función es de O(1) ya que sin importar el tamaño del archivo siempre se ejecutará en el mismo tiempo y el mismo número de operaciones.
- **process_line(line)** : Esta función llama a otra función *token_finder* de manera recursiva hasta que el input o archivo se acabe. Por lo tanto su complejidad depende del tamaño del input o archivo y es de O(m), tomando el largo del archivo como *m*.

- **token_finder(line, html_file)**: Esta función busca diferentes tipos de *tokens* al inicio de cada línea y los escribe en el archivo html. Asi como *process_line* la complejidad de esta función es de O(m) ya que depende del tamaño del input o archivo. 

Una vez realizado el análisis de la complejidad de cada función podemos observar que la complejidad en realidad no solo depende del número de archivos que se tengan como input sino también del largo (m) de cada linea. Asi que a pesar de que una complejidad O(n) es correcta, en realidad la complejidad de esta solución es de O(n*m).

## Reflexión

En esta actividad pudimos ver la importancia de la complejidad de un programa. A pesar de que la solución de la actividad 3.4 era correcta, no era la mejor solución. La solución de la actividad 5.3 es mucho más eficiente y rápida. 

En una situación laboral unos segundos de ejecución pueden hacer toda la diferencia. 

Un ejemplo de esto es **High-Frequency Trading**. En este tipo de trading se utilizan algoritmos para analizar el mercado y hacer transacciones en milisegundos. En este tipo de trading, la velocidad de ejecución es lo más importante. HFT es un ejemplo de un caso donde la complejidad de un programa es muy importante, en esta situación mientras más "rápido" un algotirmo puede analizar el mercado, encontrar áreas de oportunidad, hacer transacciones y cerrarlas, se vuelven más efectivos y por lo tanto más rentables y ventajosos.

Es en este tipo de ejemplos en los que incluso la más diminuta diferencia y mejora en tiempo de ejecución puede significar grandes ganancias o grandes pérdidas.

Aquí entra también la aplicación ética de algoritmos como este. En realidad el uso de HFT es muy controversial ya que se considera que es injusto para los traders que no tienen acceso a este tipo de algoritmos. Esto demuestra la gran responsabilidad que represneta el desarrollar y el usar este tipo de tecnologías como ventajas o desventajas en el mundo actual.

Agradecemos este tipo de actividades ya que nos permiten aplicar practicamente los conceptos que aprendemos en clase. De la misma manera facilita el aprendizaje y la comprensión de estos conceptos; asi como la importancia de saber donde y cuando aplicarlos o no. 



