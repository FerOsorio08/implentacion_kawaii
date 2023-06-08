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

  def main2()do
    IO.puts("MAIN THREAD STARTING")
    # Create new process
    ["One","Two","Three","Four"]
    |> Enum.map(&Task.async(fn -> test_function(&1)end))
    |> IO.inspect()
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()
    IO.puts("MAIN THREAD FINISING")
  end
end

defmodule Sums do
  def range_sum({start, finish}) do
    Enum.sum(start .. finish)
  end

  def total_sum(start, finish) do
    IO.puts("MAIN THREAD STARTING")
    [{100,200},{201,300},{301,400},{401,500}]
    |>Enum.map(&Task.async(fn -> range_sum(&1)end))
    |> IO.inspect()
    |> Enum.map(&Task.await(&1))
    |>IO.inspect()
    IO.puts("FINISHED MAIN THREAD")
  end

end
