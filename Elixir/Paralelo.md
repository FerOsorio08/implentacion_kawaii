# Actividad 6.1 Análisis de herramientas usadas para la solución de las situaciones problema

Emilia Salazar
Ian Holender
Fernanda Osorio
05 de junio de 2023

La solución de esta actividad se realizó con elixir. 
Las funciones: 
- sum_primes
- sum_primes_parallel

se encuentran dentro del modulo Hw.Primes. 

Asi mismo se encuentra una funcion *prime_sum* que recibe *({start, finish})*, es decir los chunks que genera la función *make_ranges*.

## Análisis de tiempo y speed up
El tiempo promedio de ejecución para paralelo usando 
 ``` 
timer.tc(fn -> Hw.Primes.sum_primes_parallel(12,3)end) |> elem(0) |> Kernel./(1_000_000)
 ``` 

Es de 1.09 segundos, algo que tiene sentido ya que es el tiempo total que ocupan 3 threads para cualquier limite de números.

El tiempo de ejecución promedio de secuencial es de 1.7

**Speed Up**

Usando la formula 

$$ S_{p} = \frac{T_1}{T_{p}} $$

EL *speed up* es $$ \frac{170}{109}$$ o 1.559