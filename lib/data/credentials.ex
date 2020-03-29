defmodule Data.Credentials do
  @enforce_keys [:mapbox_username, :mapbox_secret_token]
  defstruct @enforce_keys

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_atom(k), v} end)
    struct(Data.Credentials, parsed)
  end
end
