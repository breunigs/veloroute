defmodule Article.Parser do
  def load(path) do
    parsed =
      YamlElixir.read_from_file(path)
      |> case do
        {:ok, parsed} -> parsed
        any -> raise "Cannot parse #{path}: #{inspect(any)}"
      end

    parsed =
      try do
        Enum.into(parsed, %{}, fn {k, v} -> {String.to_existing_atom(k), v} end)
      rescue
        e -> reraise "cannot parse #{path} (#{e.message})", __STACKTRACE__
      end

    name = Path.relative_to(path, "data/articles") |> String.replace_trailing(".yaml", "")

    {:ok, date} =
      Map.get(parsed, :updated, name)
      |> Path.basename()
      |> String.slice(0..9)
      |> case do
        "0000-00-00" -> {:ok, nil}
        x -> Date.from_iso8601(x)
      end

    tags = Map.get(parsed, :tags, []) |> Enum.map(&to_string/1)

    tracks =
      Map.get(parsed, :tracks, [])
      |> Enum.map(fn vid ->
        %Video.Track{
          from: Map.get(vid, "from", ""),
          to: Map.get(vid, "to", ""),
          text: Map.get(vid, "text", ""),
          # TODO if we make articles proper modules, passing the article name would not be so awkward
          parent_ref: parsed.title,
          videos: Map.get(vid, "videos", []) |> to_plain_video_triple(),
          direction: Map.get(vid, "direction", "forward") |> String.to_existing_atom(),
          group: Map.get(vid, "group", "default")
        }
      end)

    data =
      parsed
      |> Map.merge(%{
        name: name,
        date: date,
        text: String.trim(parsed[:text] || ""),
        tags: tags,
        start: parsed |> Map.get(:start) |> Data.RoughDate.parse(),
        end: parsed |> Map.get(:end) |> Data.RoughDate.parse(),
        tracks: tracks
      })
      |> full_title()

    struct(Article, data)
  end

  defp to_plain_video_triple(vids) when is_list(vids) do
    vids
    |> Enum.map(&List.to_tuple/1)
    |> Enum.map(fn {file, from, to} ->
      {file, if(from == "start", do: :start, else: from), if(to == "end", do: :end, else: to)}
    end)
  end

  defp full_title(art = %{title: t}) do
    tn = type_name(art)

    ft =
      cond do
        String.contains?(t, ":") -> t
        tn != nil -> "#{tn}: #{t}"
        true -> t
      end

    Map.put(art, :full_title, ft)
  end

  defp full_title(art), do: art

  defp type_name(%{type: type}) do
    case type do
      "construction" -> "Baustelle"
      "planned-construction" -> "Planung"
      "changed-routing" -> "Routenänderung"
      "ampel" -> "Unfaire Ampel"
      "intent" -> "Vorhaben"
      "issue" -> "Problemstelle"
      "finished" -> "Abgeschlossen"
      _ -> nil
    end
  end

  defp type_name(_), do: nil
end
