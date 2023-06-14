defmodule Concur do
  def test_function(id) do
    IO.puts("I am #{id}")
  end

  def main() do
    IO.puts("MAIN THREAD STARTING")
    # Create new process
    id1 = Task.async(fn -> test_function("one") end)
    id2 = Task.async(fn -> test_function("two") end)
    id3 = Task.async(fn -> test_function("three") end)
    # este lanza el thread y deja que corra junto con la función
    # fn , funcion a lambda anónima
    # task await espera a que termine el thread y finish sale al final
    Task.await(id1)
    Task.await(id2)
    Task.await(id3)
    IO.puts("MAIN THREAD FINISING")
  end

  def main2() do
    IO.puts("MAIN THREAD STARTING")
    # Create new process
    ["One", "Two", "Three", "Four"]
    |> Enum.map(&Task.async(fn -> test_function(&1) end))
    |> IO.inspect()
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()

    IO.puts("MAIN THREAD FINISING")
  end
end

# This module is named Sums
defmodule Sums do
  # Define the function range_sum with input {start, finish}
  def range_sum({start, finish}) do
    # Produces the sum of the range provided as input ({start..finish})
    Enum.sum(start..finish)
  end

  # Define the function make_ranges with inputs start, finish and cores
  def make_ranges(start, finish, cores) do
    # Creates a list of tuples, in this case a hardcoded example
    [{100, 200}, {201, 300}, {301, 400}, {401, 500}]
  end

  # Define the function total_sum with inputs start, finish and cores
  def total_sum(start, finish, cores) do
    # Prints out a message indicating the "MAIN THREAD STARTING"
    IO.puts("MAIN THREAD STARTING")

    # Calls the function make_ranges with the inputs start, finish and cores to build a list of tuples.
    make_ranges(start, finish, cores)

    # Maps each element in the list of tuples to create a task which asynchronously calls the function given by range_sum passing in the current tuple.
    |> Enum.map(&Task.async(fn -> range_sum(&1) end))

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

# timer.pc(fn -> funcion_a_medir end), esta en microsegundos
# timer.tc(fn -> Sums.total_sum(1,1,1)end) |> elem(0) |> Kernel./(1_000_000)
