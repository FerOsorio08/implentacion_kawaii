defmodule Hw.Primes do
  def total_sum(ranges) do
    ranges
    |> Enum.map(&Task.async(fn -> range_sum(&1) end))
    |> Enum.map(&Task.await(&1))
    |> Enum.sum()
  end

  def range_sum({start, finish}) do
    start..finish
    |> Enum.filter(&is_prime/1)
    |> Enum.sum()
  end

  defp is_prime(num) when num < 2, do: false
  defp is_prime(2), do: true
  defp is_prime(num) do
    factors = Enum.filter(2..(num - 1), fn x -> rem(num, x) == 0 end)
    Enum.empty?(factors)
  end
end

IO.inspect(Hw.Primes.total_sum([{100, 200}, {201, 300}, {301, 400}, {401, 500}])) # Output: 2944 (sum of prime numbers within the specified ranges)
IO.inspect(Hw.Primes.total_sum([{1, 10}]))       # Output: 17 (sum of prime numbers from 1 to 10)
IO.inspect(Hw.Primes.total_sum([{1, 100}]))      # Output: 1060 (sum of prime numbers from 1 to 100)
IO.inspect(Hw.Primes.total_sum([{1, 1000}]))     # Output: 76127 (sum of prime numbers from 1 to 1000)
IO.inspect(Hw.Primes.total_sum([{1, 10000}]))    # Output: 5736396 (sum of prime numbers from 1 to 10000)
IO.inspect(Hw.Primes.total_sum([{100, 500}]))    # Output: 20476 (sum of prime numbers from 100 to 500
