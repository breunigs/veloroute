defmodule VelorouteWeb.CSSInline do
  use Phoenix.Component

  @path_prefix "./priv/static/css"

  path = fn name -> Path.join(@path_prefix, "#{name}.css") end

  load = fn name ->
    path = path.(name)

    case File.read(path) do
      {:ok, css} ->
        Phoenix.HTML.raw("<style>#{css}</style>")

      {:error, reason} ->
        IO.puts(:stderr, "CSS Failed to read #{path}: #{reason}.")
        IO.puts(:stderr, "CSS will be loaded by the browser instead of inlined.")
        nil
    end
  end

  @external_resource path.(:app)
  @css %{:app => load.(:app)}
  @known Map.keys(@css)

  def tag(conn, name) when name in @known do
    @css[name] || fallback(conn, name)
  end

  defp fallback(conn, name) do
    assigns = %{url: VelorouteWeb.Router.Helpers.static_path(conn, "/css/#{name}.css")}

    ~H"""
    <link rel="stylesheet" href={@url}/>
    """
  end
end
