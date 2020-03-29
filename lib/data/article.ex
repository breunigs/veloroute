defmodule Data.Article do
  defstruct [:type, :title, :name, :images, :hideFromMap, :tags, :text, :start, :end, :date]

  @required_params [:type, :title, :text, :date, :name]
  def required_params, do: @required_params

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_atom(k), v} end)

    name = Path.basename(path, ".yaml")
    {:ok, date} = name |> String.slice(0..9) |> Date.from_iso8601()

    data = Map.merge(%{name: name, date: date}, parsed)
    struct(Data.Article, data)
  end

  def load_all(path) do
    File.ls!(path)
    |> Enum.map(fn filename ->
      load(Path.join([path, filename]))
    end)
    |> Enum.into(%{}, fn art ->
      {art.name, art}
    end)
  end
end
