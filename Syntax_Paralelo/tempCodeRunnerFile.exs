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


# timer.tc(fn -> Hw.Primes.sum_primes_parallel(12,3)end) |> elem(0) |> Kernel./(1_000_000)
IO.inspect(Timing.time_execution(fn -> IO.inspect(Resaltador_syntaxys.resaltador_directory("./Funciones"))end))