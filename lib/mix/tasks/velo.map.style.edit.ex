defmodule Mix.Tasks.Velo.Map.Style.Edit do
  use Mix.Task

  @port 4001
  @requirements ["app.start"]

  @shortdoc "Allows to edit the map styles"
  def run(args) do
    Mix.Tasks.Velo.Map.Ensure.run([])

    style = style(args)
    url = MapStyleEditor.Main.serve(style: style, port: @port)

    IO.puts(
      :stderr,
      """
      Style editor was opened in your browser.
      If you only see a white map, CTRL+SHIFT+R (force-reload) the page.
      It's also available at #{url}.

      You are editing style #{style}.
      The style is saved automatically upon every edit, you can close the
      browser tab at any time and stop this server using CTRL+\\ or CTRL+C
      """
    )

    System.cmd("xdg-open", [url])
    System.no_halt(true)
  end

  defp style(args) do
    case Basemap.Styles.list() do
      [] ->
        raise("No styles found, please put an example style into #{Basemap.Styles.source()}")

      [style] ->
        style

      list ->
        desired = List.first(args) || ""
        int = with {int, ""} <- Integer.parse(desired), do: int, else: (_ -> nil)

        cond do
          x = Enum.find(list, &(Path.basename(&1, ".json") == desired)) -> x
          int && int < length(list) -> Enum.at(list, int)
          true -> ask_map_style(list)
        end
    end
  end

  defp ask_map_style(list) do
    IO.puts("\nPlease select which style to edit:")

    options =
      list
      |> Enum.with_index(fn path, idx ->
        name = determine_name!(path)
        IO.puts("#{idx}: #{name}")
        [{"#{idx}", path}, {name, path}, {path, path}]
      end)
      |> List.flatten()
      |> Enum.into(%{})

    val = IO.gets("Select by number or name: ") |> String.trim()

    if(is_map_key(options, val)) do
      options[val]
    else
      IO.puts("invalid option selected: #{val}")
      style([])
    end
  end

  defp determine_name!(path) do
    from_file = Path.basename(path, ".json")

    from_json =
      with {:ok, data} <- File.read(path),
           {:ok, json} <- Jason.decode(data),
           id <- get_in(json, ["id"]) do
        id
      else
        _ -> nil
      end

    if from_json && from_file != from_json do
      IO.puts(:stderr, """
      ================================================================================
      Invalid style config: #{path}
      The style specifies an ID "#{from_json}" whereas its filename is "#{from_file}".
      To avoid confusion the filename should be the same as the ID (+ extension).
      ================================================================================
      """)

      exit({:shutdown, 1})
    end

    from_file
  end
end
