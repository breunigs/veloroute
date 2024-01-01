defmodule VelorouteWeb.CSSInline do
  use Phoenix.Component
  require Logger

  @path_prefix "./priv/static/assets"

  path = fn name -> Path.join(@path_prefix, "#{name}.css") end

  load = fn name ->
    path = path.(name)

    case File.read(path) do
      # strip unicode byte order mark
      {:ok, "\uFEFF" <> css} ->
        Phoenix.HTML.raw("<style>#{css}</style>")

      {:ok, css} ->
        Phoenix.HTML.raw("<style>#{css}</style>")

      {:error, reason} ->
        Logger.warning("CSS Failed to read #{path}: #{reason}.")
        Logger.warning("CSS will be loaded by the browser instead of inlined.")
        nil
    end
  end

  @external_resource path.(:app)
  @css %{:app => load.(:app)}
  @known Map.keys(@css)

  def tag(name) when name in @known do
    @css[name] || fallback(name)
  end

  defp fallback(name) do
    assigns = %{url: "/assets/#{name}.css"}

    ~H"""
    <link rel="stylesheet" href={@url}/>
    """
  end
end
