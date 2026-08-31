defmodule Video.SegmentedRenderer.CpuThrottle do
  @moduledoc false

  @interval_ms 30_000
  @poll_ms 2_000

  def start_link do
    running = :atomics.new(1, signed: true)
    {:ok, agent} = Agent.start_link(fn -> 0 end)
    {:ok, %{agent: agent, running: running}}
  end

  def stop(%{agent: agent}) do
    Agent.stop(agent)
  end

  def wait(%{agent: agent, running: running}) do
    Agent.get_and_update(
      agent,
      fn last_start ->
        unless :atomics.get(running, 1) == 0 do
          wait_until_cpu_available(running)
          now = System.monotonic_time(:millisecond)
          remaining = @interval_ms - (now - last_start)

          if remaining > 0, do: Process.sleep(remaining)
        end

        :atomics.add(running, 1, 1)
        {:ok, System.monotonic_time(:millisecond)}
      end,
      :infinity
    )
  end

  def done(%{running: running}) do
    :atomics.sub(running, 1, 1)
  end

  defp wait_until_cpu_available(running) do
    if :atomics.get(running, 1) > 0 and cpu_busy?() do
      Process.sleep(@poll_ms)
      wait_until_cpu_available(running)
    else
      :ok
    end
  end

  defp cpu_busy? do
    {load_str, _rest} =
      File.read!("/proc/loadavg") |> String.split(" ", parts: 2) |> List.to_tuple()

    {load, _} = Float.parse(load_str)
    load >= System.schedulers_online()
  end
end
