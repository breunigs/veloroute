defmodule Mix.Tasks.Velo.Videos.FillHistoric do
  use Mix.Task
  require Logger
  @requirements ["app.start"]

  @shortdoc "Fill in the video hash in the historic field of article tracks"
  def run([]), do: fill_all_empty()
  def run(args), do: Enum.each(args, &fill_historic/1)

  defp fill_all_empty() do
    Article.List.all()
    |> Enum.filter(fn mod ->
      mod.tracks()
      |> Enum.any?(fn track ->
        track.historic |> Map.keys() |> Enum.any?(&(&1 == ""))
      end)
    end)
    |> case do
      [] ->
        Logger.info("No articles with empty historic hashes found")

      mods ->
        Enum.each(mods, fn mod ->
          Logger.info("Processing #{inspect(mod)}")
          fill_historic(mod)
        end)
    end
  end

  defp fill_historic(arg) when is_atom(arg), do: do_fill_historic(arg)

  defp fill_historic(arg) when is_binary(arg) do
    case Article.List.resolve(arg) do
      nil ->
        Logger.error("no article found for '#{arg}'")
        exit({:shutdown, 1})

      mod ->
        do_fill_historic(mod)
    end
  end

  defp do_fill_historic(mod) do
    path = Util.module_source_path(mod)
    orig_source = source = File.read!(path)

    {:ok, ast} =
      Code.string_to_quoted(source,
        columns: true,
        token_metadata: true
      )

    candidates = find_empty(ast)

    source =
      Enum.reduce(candidates, source, fn
        candidate, source ->
          track = Enum.at(mod.tracks(), candidate.track_index)
          hash = Video.Generator.dynamic_compile(track).hash()

          Logger.info("#{mod} track #{candidate.track_index}: setting #{hash}")

          replace_in_line_before_column(
            source,
            candidate.line,
            candidate.before_column,
            "\"\"",
            "\"#{hash}\""
          )
      end)

    if source != orig_source, do: File.write!(path, source)
  end

  def find_empty(ast) do
    {_ast, {_count, result}} =
      Macro.prewalk(ast, {-1, []}, fn
        {:%, _meta, [alias_ast, {:%{}, _, kvs}]} = node, {idx, acc} ->
          if video_track?(alias_ast) do
            idx = idx + 1

            matches =
              kvs
              |> Enum.find(fn
                {:historic, _} -> true
                _ -> false
              end)
              |> extract_empty_keys(idx)

            {node, {idx, acc ++ matches}}
          else
            {node, {idx, acc}}
          end

        node, acc ->
          {node, acc}
      end)

    result
  end

  defp video_track?({:__aliases__, _, [:Video, :Track]}), do: true
  defp video_track?(_), do: false

  defp extract_empty_keys(nil, _idx), do: []

  defp extract_empty_keys({:historic, map_ast}, idx) do
    case map_ast do
      {:%{}, _, kvs} ->
        Enum.flat_map(kvs, fn
          {key_ast, value_ast} ->
            if empty_string?(key_ast) do
              [
                %{
                  track_index: idx,
                  line: meta_line(value_ast),
                  before_column: meta_column(value_ast)
                }
              ]
            else
              []
            end
        end)

      _ ->
        []
    end
  end

  defp empty_string?({:<<>>, _, [""]}), do: true
  defp empty_string?(""), do: true
  defp empty_string?(_), do: false

  defp meta_line({_, meta, _}), do: meta[:line]
  defp meta_line(_), do: nil

  defp meta_column({_, meta, _}), do: meta[:column]
  defp meta_column(_), do: nil

  def replace_in_line_before_column(text, line_no, column, search, replacement) do
    lines = String.split(text, "\n", trim: false)

    updated_lines =
      Enum.with_index(lines, 1)
      |> Enum.map(fn {line, idx} ->
        if idx == line_no do
          {prefix, suffix} = split_at_column(line, column)

          new_prefix = String.replace(prefix, search, replacement)

          new_prefix <> suffix
        else
          line
        end
      end)

    Enum.join(updated_lines, "\n")
  end

  defp split_at_column(line, column) do
    graphemes = String.graphemes(line)

    {left, right} = Enum.split(graphemes, column - 1)

    {Enum.join(left), Enum.join(right)}
  end
end
