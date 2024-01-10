defmodule Basemap.Servable do
  @doc """
  Specifies a servable fallback in case a (sub)item for a particular detail is
  not available. For example, it might be an empty map tile instead of serving a
  404.
  """
  @callback fallback() :: binary()
  @optional_callbacks fallback: 0

  defmacro __using__(_opts) do
    quote location: :keep do
      @behaviour Basemap.Servable

      def serve_path(extra \\ "")
      def serve_path("http://" <> _ = extra), do: Basemap.Servable.http_error(extra)
      def serve_path("https://" <> _ = extra), do: Basemap.Servable.http_error(extra)
      def serve_path(extra), do: Basemap.Servable.serve_path(List.flatten([name(), extra]))

      # use production path by default, which we'll replace upon serving the for
      # development modes. In production the file serving can happen without
      # that logic.
      def serve_url(url \\ Settings.url(), extra \\ ""), do: Path.join(url, serve_path(extra))

      def assets_path(extra \\ ""), do: "priv/static" <> serve_path(extra)
    end
  end

  @spec serve_path(list(Path.t()) | Path.t()) :: binary() | {:error, binary()}
  def serve_path(extra \\ "")

  def serve_path("http://" <> _ = extra), do: http_error(extra)
  def serve_path("https://" <> _ = extra), do: http_error(extra)

  def serve_path(extra) when is_list(extra), do: serve_path(Path.join(extra))

  def serve_path(extra) when is_binary(extra) do
    with trimmed = String.trim_leading(extra, "/"),
         {:ok, safe} <- Path.safe_relative(trimmed) do
      Path.join("/assets/basemap/", safe)
    else
      :error -> {:error, "unsafe relative path given: #{extra}"}
    end
  end

  def assets_path(extra \\ "") do
    case serve_path(extra) do
      {:error, reason} -> {:error, reason}
      extra -> "priv/static#{extra}"
    end
  end

  def list do
    [Basemap.Styles, Basemap.Fonts, Basemap.Sprites, Basemap.Tiles]
  end

  def ensure do
    Parallel.each(list(), 2, & &1.ensure())
  end

  def http_error(url) do
    {:error,
     """
     serve_path expectes a sub-dir to be given, but got a full URL instead:
       #{url}
     Did you mean serve_url/2?
     """}
  end
end
