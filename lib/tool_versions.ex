defmodule ToolVersions do
  @tool_path Path.join([__DIR__, "..", ".tool-versions"])
  @extra_versions %{debian: "bookworm-20240812-slim"}

  @self_path __ENV__.file
  def path, do: @self_path

  @doc ~S"""
  Parses an asdf .tool-versions formatted string, and returns a map with atom keys

  ## Examples

      iex> ToolVersions.parse_tool_versions(\"""
      ...> elixir 1.13.4
      ...> erlang 25.0.2
      ...> \""")
      %{elixir: "1.13.4", erlang: "25.0.2"}
  """
  @spec parse_tool_versions(binary()) :: %{atom() => binary()}
  def parse_tool_versions(contents) do
    contents
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [key, version] -> {String.to_atom(key), version} end)
    |> Enum.into(%{})
  end

  use Memoize

  defmemop get_cached do
    @tool_path
    |> File.read!()
    |> parse_tool_versions()
    |> Map.merge(@extra_versions)
  end

  @doc """
  Given an atom of a tool, will read preferably from the .tool-versions file.
  However, there are also some hardcoded versions specified directly in the
  ToolVersions file.
  """
  @spec get(atom()) :: binary() | nil
  def get(tool) when is_atom(tool) and not is_nil(tool) do
    Map.get(get_cached(), tool)
  end
end
