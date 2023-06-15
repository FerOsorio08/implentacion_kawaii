# ACtividad Actividad 5.2 Programación paralela y concurrente
#Emilia Salazar
#Ian Holender
#Fernanda Osorio
#05-junio-2023

import :timer
defmodule Hw.Primes do
  defp prime(n) when n < 2, do: false

  defp prime(2), do: true

  defp prime(n) when n > 2 do
    2..trunc(:math.sqrt(n))
    |> Enum.all?(&(rem(n, &1) != 0))
  end

  defp prime(_), do: false

  def sum_primes(limit) when limit < 2, do: 0

  def sum_primes(limit) do
    primes = for n <- 2..limit, prime(n), do: n
    Enum.sum(primes)
  end



  def make_ranges(limit, threads) do
    # Creates a list of tuples, in this case a hardcoded example
    per_thread = div(limit, threads)
  residue = rem(limit, threads)

  ranges =
    for i <- 0..(threads - 1) do
      if i == threads - 1 do
        if residue != 0 do
          {i * per_thread, (i + 1) * per_thread + residue - 1}  # Adjusted calculation
        else
          {i * per_thread, (i + 1) * per_thread - 1}  # Adjusted calculation
        end
      else
        {i * per_thread, (i + 1) * per_thread - 1}  # Adjusted calculation
      end
    end

  ranges
  end

  def prime_sum({start, finish}) do
    Enum.filter(start..finish, &prime/1)
    |> Enum.sum()
  end



  def sum_primes_parallel(limit, threads) do
    # Prints out a message indicating the "MAIN THREAD STARTING"
    IO.puts("MAIN THREAD STARTING")

    make_ranges(limit, threads)
    # |> Enum.chunk_every(div(limit, threads))
    # Maps each element in the list of tuples to create a task which asynchronously calls the function given by range_sum passing in the current tuple.
    |>IO.inspect()
    |> Enum.map(&Task.async(fn -> prime_sum(&1) end))

    # Outputs the results to the console
    # |> IO.inspect()

    # # Waits for completion of all asynchronous tasks
    |> Enum.map(&Task.await(&1))

    # Outputs the results to the console
    |>IO.inspect()

    |>Enum.sum()
    |>IO.inspect()

    # Prints out a message indicating "FINISHED MAIN THREAD"
    IO.puts("FINISHED MAIN THREAD")
  end


end

defmodule Timing do
  def time_execution(fun) do
    :timer.tc(fun)
    # Get the time in microseconds
    |> elem(0)
    # Convert to seconds
    |> Kernel./(1_000_000)
    |> IO.inspect(label: "Time in seconds")
  end
end

IO.inspect(Hw.Primes.sum_primes(12))
IO.inspect(Hw.Primes.sum_primes_parallel(12,3))
IO.inspect(Timing.time_execution(fn -> IO.inspect(Hw.Primes.sum_primes(12))end))
