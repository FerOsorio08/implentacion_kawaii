#implementation od the factorial using recursion
#
#Ian Holender
#Emilia salazar
#Fernanda Osorio
# 27-04-2023
#All problems must be solved with tail recursion


defmodule Hw.Ariel2 do

  #1. La funci ́on insert toma dos entradas: un nu ́mero n y una lista lst que contiene nu ́meros en orden ascendente. Devuelve una nueva lista con los mismos elementos de lst pero con n insertado en su lugar correspondiente.
  def insert(list, item),
    do: do_insert(list, item, [])

  defp do_insert([], item, smaller),
    do: Enum.reverse(smaller) ++ [item]

  defp do_insert([head | tail], item, smaller) when item < head,
    do: Enum.reverse(smaller) ++ [item, head | tail]

  defp do_insert([head | tail], item, smaller),
    do: do_insert(tail, item, [head | smaller])





  # 3. La funci ́on rotate-left toma dos entradas: un nu ́mero entero n y una lista lst. Devuelve la lista que resulta de rotar lst un total de n elementos a la izquierda. Si n es negativo, rota hacia la derecha.
  def rotate_left(n, list),
      do: do_rotate_left(n, list)

  defp do_rotate_left(0, list),
     do: list

  defp do_rotate_left(n, [head | tail]),
    do: do_rotate_left(n-1, tail ++ [head])



  #4. La funci ́on prime-factors toma un nu ́mero entero n como entrada (n ¿ 0) y devuelve una lista que contiene los factores primos de n en orden ascendente. Los factores primos son los nu ́meros primos que dividen a un nu ́mero de manera exacta. Si se multiplican todos los factores primos se obtiene el nu ́mero original.
def prime_factors(number),
  do: do_prime_factors(number, 2, [])

defp do_prime_factors(number, div, list) when div * div > number,
  do: list ++ [number]

defp do_prime_factors(number, div, list) when rem(number, div) == 0,
  do: do_prime_factors(div(number, div), div, [div | list])

defp do_prime_factors(number, div, list) when rem(number, div) != 0,
  do: do_prime_factors(number, div + 1, list)




    #5. La funci ́on gcd toma dos nu ́meros enteros positivos a y b como entrada, donde a > 0 y b > 0. Devuelve el ma ́ximo comu ́n divisor (GCD por sus siglas en ingl ́es) de a y b. No se debe usar la funci ́on gcd o similar predefinida.
    def gcd(a, b),
     do: gcd_do(a, b)


    defp gcd_do(a, b) when a == b,
     do: a

    defp gcd_do(a, b) when a == 0,
     do: b

    defp gcd_do(a, b) when b == 0,
     do: a

    defp gcd_do(a, b) when a>b,
     do: gcd_do(b, rem(a, b))

    defp gcd_do(a,b) when a<b,
      do: gcd_do( rem(b,a),a)





#Ejercicio 6


def deep_reverse(list), do: do_deep_reverse(list, [])

defp do_deep_reverse([], res), do: res
defp do_deep_reverse([head | tail], res) when is_list(head), do: do_deep_reverse(tail, [Enum.reverse(head) | res])
defp do_deep_reverse([head | tail], res), do: do_deep_reverse(tail, [head | res])





end
