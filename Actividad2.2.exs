#implementation od the factorial using recursion
#
#Ian Holender
# 27-04-2023
#All problems must be solved with tail recursion


defmodule Hw.Ariel2 do

  #Ejercicio 1
  def insert(list, item),
    do: do_insert(list, item, [])

  defp do_insert([], item, smaller),
    do: Enum.reverse(smaller) ++ [item]

  defp do_insert([head | tail], item, smaller) when item < head,
    do: Enum.reverse(smaller) ++ [item, head | tail]

  defp do_insert([head | tail], item, smaller),
    do: do_insert(tail, item, [head | smaller])



  # #Ejercicio 3
  # def rotate_left(n, lst) do
  #   len = length(lst)
  #   shift = rem(n, len)
  #   shift = len + shift if shift < 0
  #   Enum.concat(Enum.drop(lst, shift), Enum.take(lst, shift))
  # end

    #Ejercicio 4
    def gcd(a, b),
     do: gcd_do(a, b)


    defp gcd_do(a, b) when a == b,
     do: a

    defp gcd_do(a, b) when a == 0,
     do: b

    defp gcd_do(a, b) when b == 0,
     do: a

    defp gcd_do(a, b) when a<b,
     do: gcd_do(b, rem(a, b))

    defp gcd_do(a,b) when a>b,
      do: gcd_do( rem(b,a),a)





#Ejercicio 6


def deep_reverse(list), do: do_deep_reverse(list, [])

defp do_deep_reverse([], res), do: Enum.reverse(res)
defp do_deep_reverse([head | tail], res), do: do_deep_reverse(tail, [Enum.reverse(head) | res])
end
