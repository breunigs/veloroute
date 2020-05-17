defmodule Benchmark do
  require Logger

  def measure(name, function) do
    {elapsed, val} = :timer.tc(function)
    elapsed = elapsed / 1_000_000
    Logger.debug("#{name} took #{elapsed}s")
    val
  end
end
