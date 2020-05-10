defmodule Benchmark do
  def measure(name, function) do
    {elapsed, val} = :timer.tc(function)
    elapsed = elapsed / 1_000_000
    IO.puts("#{name} took #{elapsed}s")
    val
  end
end
