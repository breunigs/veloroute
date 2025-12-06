defmodule Benchmark do
  defmacro measure(name, function) do
    quote do
      require Logger

      {elapsed, val} = :timer.tc(unquote(function))
      in_ms = elapsed / 1000

      if in_ms >= 20,
        do: Logger.info("#{unquote(name)} took #{Phoenix.Logger.duration(elapsed * 1000)}")

      val
    end
  end

  require Logger

  if Application.compile_env(:veloroute, :env) != :prod do
    def measure_devel(name, function) do
      {elapsed, val} = :timer.tc(function)
      in_ms = elapsed / 1000

      if in_ms >= 20,
        do: Logger.info("#{name} took #{Phoenix.Logger.duration(elapsed * 1000)}")

      val
    end
  end

  if Application.compile_env(:veloroute, :env) != :prod do
    def flamegraph(function) do
      :eflambe.apply({function, []}, output_format: :brendan_gregg)
    end
  end
end
