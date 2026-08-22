defmodule Video.SegmentedRenderer.LiveProgress do
  @moduledoc false
  use GenServer

  @render_interval 200

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def start_bar(id, opts) do
    GenServer.call(__MODULE__, {:start_bar, id, opts})
  end

  def inc(id, step \\ 1) do
    GenServer.cast(__MODULE__, {:inc, id, step})
  end

  def complete(id) do
    GenServer.cast(__MODULE__, {:complete, id})
  end

  def log(message) do
    GenServer.call(__MODULE__, {:log, message})
  end

  def stop do
    GenServer.call(__MODULE__, :stop)
  end

  @impl true
  def init(_opts) do
    {:ok, %{bars: %{}, order: [], rendered_lines: 0, timer: schedule_render()}}
  end

  @impl true
  def handle_call({:start_bar, id, opts}, _from, state) do
    bar = %{
      label: Keyword.fetch!(opts, :label),
      total: Keyword.fetch!(opts, :total),
      current: 0,
      start_time: System.monotonic_time(:millisecond),
      absolute: Keyword.get(opts, :absolute_values, false)
    }

    state = %{state | bars: Map.put(state.bars, id, bar), order: state.order ++ [id]}
    {:reply, :ok, state}
  end

  def handle_call({:log, message}, _from, state) do
    clear(state.rendered_lines)
    IO.puts(:stderr, message)
    {:reply, :ok, %{state | rendered_lines: 0}}
  end

  def handle_call(:stop, _from, state) do
    if state.timer, do: Process.cancel_timer(state.timer)
    clear(state.rendered_lines)
    {:stop, :normal, :ok, %{state | rendered_lines: 0}}
  end

  @impl true
  def handle_cast({:inc, id, step}, state) do
    case state.bars[id] do
      nil ->
        {:noreply, state}

      bar ->
        bar = %{bar | current: min(bar.current + step, bar.total)}
        {:noreply, %{state | bars: Map.put(state.bars, id, bar)}}
    end
  end

  def handle_cast({:complete, id}, state) do
    {:noreply, %{state | bars: Map.delete(state.bars, id), order: List.delete(state.order, id)}}
  end

  @impl true
  def handle_info(:render, state) do
    state = render(state)
    {:noreply, %{state | timer: schedule_render()}}
  end

  @impl true
  def terminate(_reason, state) do
    clear(state.rendered_lines)
  end

  defp schedule_render, do: Process.send_after(self(), :render, @render_interval)

  defp render(state) do
    width = terminal_width()
    active = Enum.filter(state.order, &Map.has_key?(state.bars, &1))
    current_count = length(active)
    prev_count = state.rendered_lines

    if prev_count > 0, do: IO.write(:stderr, "\e[#{prev_count}A")

    for id <- active do
      IO.write(:stderr, "\e[2K" <> format_bar(state.bars[id], width) <> "\n")
    end

    clear_extra(prev_count - current_count)

    %{state | rendered_lines: current_count}
  end

  defp clear(0), do: :ok

  defp clear(n) when n > 0 do
    IO.write(:stderr, "\e[#{n}A")
    IO.write(:stderr, String.duplicate("\e[2K\n", n))
    IO.write(:stderr, "\e[#{n}A")
  end

  defp clear_extra(n) when n <= 0, do: :ok

  defp clear_extra(n) do
    IO.write(:stderr, String.duplicate("\e[2K\n", n))
    IO.write(:stderr, "\e[#{n}A")
  end

  defp format_bar(bar, width) do
    pct = if bar.total > 0, do: bar.current / bar.total, else: 0.0
    elapsed_ms = System.monotonic_time(:millisecond) - bar.start_time
    eta_str = eta(elapsed_ms, pct)

    values = if bar.absolute, do: "#{bar.current}/#{bar.total}", else: "#{round(pct * 100)}%"
    suffix = " #{format_time(elapsed_ms)} #{values}#{eta_str}"
    label = String.pad_trailing(bar.label, 35)

    bar_width = max(10, width - String.length(label) - String.length(suffix) - 3)
    filled = round(pct * bar_width)
    empty = bar_width - filled

    "#{label}[#{String.duplicate("=", filled)}#{String.duplicate(" ", empty)}]#{suffix}"
  end

  defp eta(_elapsed_ms, pct) when pct <= 0.0, do: ""

  defp eta(elapsed_ms, pct) when pct > 0.0 do
    remaining_ms = round(elapsed_ms / pct * (1.0 - pct))
    " ETA #{format_time(remaining_ms)}"
  end

  defp format_time(ms) do
    total_s = div(ms, 1000)
    h = div(total_s, 3600)
    m = div(rem(total_s, 3600), 60)
    s = rem(total_s, 60)

    if h > 0 do
      "#{h}:#{String.pad_leading("#{m}", 2, "0")}:#{String.pad_leading("#{s}", 2, "0")}"
    else
      "#{String.pad_leading("#{m}", 2, "0")}:#{String.pad_leading("#{s}", 2, "0")}"
    end
  end

  defp terminal_width do
    with {:error, _} <- :io.columns(:standard_io),
         {:error, _} <- :io.columns(:standard_error) do
      80
    else
      {:ok, cols} -> cols
    end
  end
end
