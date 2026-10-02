defmodule Joiner.UI do
  def setup_owl do
    :ok = :logger.remove_handler(:default)

    :ok =
      :logger.add_handler(:default, :logger_std_h, %{
        config: %{type: {:device, Owl.LiveScreen}},
        formatter: Logger.Formatter.new(Application.fetch_env!(:logger, :default_formatter))
      })
  end

  @spec prefix_index([Owl.Data.t()], integer(), Owl.Data.sequence(), Owl.Data.t()) :: Owl.Data.t()
  def prefix_index(lines, start_at \\ 1, color \\ :red, join \\ "\n") do
    lines
    |> Enum.with_index()
    |> Enum.flat_map(fn {row, idx} ->
      [Owl.Data.tag(to_string(idx + start_at), color), ": ", row, join]
    end)
  end

  @typep col :: Joiner.Options.table_columns()
  @spec table([row :: %{col() => any()}], Joiner.Options.t()) :: Owl.Data.t()
  def table(data, opts) do
    Owl.Table.new(
      data,
      render_cell: &table_formatter/1,
      padding_x: 1,
      sort_columns: table_sorter(opts)
    )
  end

  @spec table_sorter(Joiner.Options.t()) :: (col(), col() -> boolean())
  defp table_sorter(opts) do
    table_order =
      ([:weighted] ++
         Joiner.Options.non_weight_table_columns() ++
         Enum.sort(Map.keys(opts.weights)))
      |> Enum.uniq()

    table_order = table_order |> Enum.with_index() |> Enum.into(%{})

    fn a, b -> table_order[a] < table_order[b] end
  end

  defp table_formatter(val) when is_float(val), do: rnd(val * 100.0, 2) <> "%"
  defp table_formatter(val), do: to_string(val)

  @spec input_with_preview(
          [Joiner.Segment.t()],
          any(),
          Joiner.Options.t(),
          binary() | nil,
          binary() | nil,
          %{binary() => atom()}
        ) ::
          pos_integer() | :none | atom()
  def input_with_preview(segments, preview, opts, title, custom_player, extra \\ %{}) do
    case read_valid_input(length(segments), extra) do
      :preview ->
        Joiner.Preview.start_player!(preview, title, custom_player)
        input_with_preview(segments, preview, opts, title, custom_player, extra)

      other ->
        Joiner.Preview.stop(preview)
        other
    end
  end

  @doc """
  Asks the user to pick a number in `[1, max]` or one of the named options.
  `extra` is merged over the built-in names, so e.g. `%{"" => :ready}` can
  replace the default meaning of just pressing enter.
  """
  @spec read_valid_input(non_neg_integer(), %{binary() => atom()}) ::
          pos_integer() | :none | :preview | atom()
  def read_valid_input(max, extra \\ %{}) do
    Owl.LiveScreen.await_render()

    start = DateTime.utc_now()

    val =
      Owl.IO.input(optional: true, label: "Select which join to use")
      |> Kernel.||("")
      |> String.trim()

    stop = DateTime.utc_now()
    # something is fishy
    if DateTime.diff(stop, start, :millisecond) < 1000, do: Process.sleep(2000)

    static = %{
      "p" => :preview,
      "preview" => :preview,
      "?" => :preview,
      "" => :preview,
      "m" => :none,
      "manual" => :none,
      "n" => :none,
      "none" => :none
    }

    Map.merge(static, extra)[val] ||
      case Integer.parse(val) do
        {idx, ""} when idx >= 1 and idx <= max ->
          idx

        {_idx, ""} ->
          Owl.IO.puts(Owl.Data.tag("Integer out of range [1-#{max}]", :red))
          read_valid_input(max, extra)

        _ ->
          Owl.IO.puts(Owl.Data.tag("not a valid integer nor other option", :red))
          read_valid_input(max, extra)
      end
  end

  defp rnd(val, decimals) do
    :erlang.float_to_binary(val, decimals: decimals)
  end
end
