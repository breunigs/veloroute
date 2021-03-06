defmodule Benchmark do
  def measure(name, function) do
    {elapsed, val} = :timer.tc(function)
    elapsed = elapsed / 1_000_000
    if elapsed >= 0.1, do: IO.puts(:stderr, "#{name |> String.trim()} took #{elapsed}s")
    val
  end

  def flamegraph(name, function) do
    ts = DateTime.utc_now() |> DateTime.to_unix()
    filename = "#{name}.#{ts}"
    x = :eflame.apply(:normal_with_children, "#{filename}.out", function, [])

    "./deps/eflame/stack_to_flame.sh < \"#{filename}.out\" > \"#{filename}.svg\""
    |> String.to_charlist()
    |> :os.cmd()

    File.rm("#{filename}.out")
    x
  end
end
