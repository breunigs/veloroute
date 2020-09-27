defmodule Benchmark do
  require Logger

  def measure(name, function) do
    {elapsed, val} = :timer.tc(function)
    elapsed = elapsed / 1_000_000
    if elapsed >= 0.1, do: Logger.debug("#{name |> String.trim()} took #{elapsed}s")
    val
  end
end
