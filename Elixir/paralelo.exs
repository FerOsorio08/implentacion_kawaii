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

  def sum_primes_parallel(limit, num_threads) do
    IO.puts("MAIN THREAD STARTING")

    # Split into chunks using Enum.chunk_every
    # remove any non-prime values from each chunk
    tasks =
      1..limit
      |> Enum.filter(&prime/1)
      # Chunking for parallel threads
      |> Enum.chunk_every(div(limit, num_threads))
      # Using map to process them in parallel
      |> Enum.map(fn chunk ->
        Task.async(fn ->
          # Perform prime in every number in chunk
          Enum.map(chunk, fn prime ->
            IO.puts("THREAD STARTING FOR #{prime}")
            result = prime
            IO.puts("THREAD FINISHED FOR #{prime}")
            # Return value
            result
          end)
        end)
      end)
      |> IO.inspect()

    # Wait for all the tasks to complete and collect their results.
    # Enum.flat_map flattnes the list of lists
    primes = tasks |> Enum.flat_map(&Task.await/1)

    # Sum the primes
    Enum.sum(primes)
  end

  def sum_primes_parallel2(limit, threads) do
    # Prints out a message indicating the "MAIN THREAD STARTING"
    IO.puts("MAIN THREAD STARTING")

    1..limit
    |> Enum.chunk_every(div(limit, threads))
    # Maps each element in the list of tuples to create a task which asynchronously calls the function given by range_sum passing in the current tuple.
    |> Enum.map(&Task.async(fn -> sum_primes(&1) end))

    # Outputs the results to the console
    |> IO.inspect()

    # Waits for completion of all asynchronous tasks
    |> Enum.map(&Task.await(&1))

    # Outputs the results to the console
    |> IO.inspect()

    # Prints out a message indicating "FINISHED MAIN THREAD"
    IO.puts("FINISHED MAIN THREAD")
  end

end
