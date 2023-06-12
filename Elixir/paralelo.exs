sum
defmodule Hw.Primes do
  defp prime(n) when n < 2, do: false

  defp prime(2), do: true

  defp prime(n) when n > 2 do
    2..trunc(:math.sqrt(n))
    |> Enum.all?(&(rem(n, &1) != 0))
  end

  defp prime(_), do: false

  def sum_primes(limit) do
    Enum.sum(for n <- 2..limit, prime(n), do: n)
  end

  def sum_primes_parallel(limit, threads) do


  end


end
