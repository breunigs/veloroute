defmodule Article.Parser do
  def load(path, article_dir \\ "data/articles") do
    parsed =
      YamlElixir.read_from_file(path)
      |> case do
        {:ok, parsed} -> parsed
        any -> raise "Cannot parse #{path}: #{inspect(any)}"
      end

    parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_existing_atom(k), v} end)

    name = Path.relative_to(path, article_dir) |> String.replace_trailing(".yaml", "")

    {:ok, date} =
      Map.get(parsed, :updated, name)
      |> Path.basename()
      |> String.slice(0..9)
      |> case do
        "0000-00-00" -> {:ok, nil}
        x -> Date.from_iso8601(x)
      end

    tags = Map.get(parsed, :tags, []) |> Enum.map(&to_string/1)

    # if !is_nil(date) && is_nil(simg),
    #   do: raise("Article #{path} is dated, but no start image could be found")

    data =
      parsed
      |> Map.merge(%{
        name: name,
        date: date,
        text: String.trim(parsed[:text] || ""),
        tags: tags,
        start: parsed |> Map.get(:start) |> Data.RoughDate.parse(),
        end: parsed |> Map.get(:end) |> Data.RoughDate.parse()
      })
      |> full_title()

    struct(Article, data)
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
