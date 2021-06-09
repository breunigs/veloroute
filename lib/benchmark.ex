defmodule Benchmark do
  def measure(name, function) do
    {elapsed, val} = :timer.tc(function)
    elapsed = elapsed / 1_000_000
    if elapsed >= 0.1, do: IO.puts(:stderr, "#{name |> String.trim()} took #{elapsed}s")
    val
  end
end
