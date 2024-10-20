defmodule Benchmark do
  defmacro measure(name, function) do
    quote do
      require Logger

      {elapsed, val} = :timer.tc(unquote(function))
      elapsed = elapsed / 1_000_000

      if elapsed >= 0.1,
        do: Logger.info("#{String.trim(unquote(name))} took #{elapsed}s")

      val
    end
  end

  require Logger

  if Application.compile_env(:veloroute, :env) != :prod do
    def measure_devel(name, function) do
      {elapsed, val} = :timer.tc(function)
      elapsed = elapsed / 1_000_000

      if elapsed >= 0.1,
        do: Logger.info("#{String.trim(name)} took #{elapsed}s")

      val
    end
  end

  if Application.compile_env(:veloroute, :env) != :prod do
    def flamegraph(name, function) do
      ts = DateTime.utc_now() |> DateTime.to_unix()
      filename = "flamegraph_#{String.replace(name, " ", "_")}.#{ts}"
      x = :eflame.apply(:normal_with_children, "#{filename}.out", function, [])

      "./deps/eflame/stack_to_flame.sh < \"#{filename}.out\" > \"#{filename}.svg\""
      |> String.to_charlist()
      |> :os.cmd()

      "sort \"#{filename}.out\" | uniq -c | sort -n -k1 | sort -k2 | awk '{print $2, \"\", $1}' | ./deps/eflame/stack_to_flame.sh > \"#{filename}_sorted.svg\""
      |> String.to_charlist()
      |> :os.cmd()

      File.rm("#{filename}.out")
      x
    end
  end
end
