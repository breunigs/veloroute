defmodule LinkHelpers do
  use Phoenix.Component

  @paywall_hostnames ["abendblatt.de", "www.abendblatt.de"]

  @known_a_attrs [:href, :__changed__, :current_page, :type, :inner_block]
  @doc """
  a links change the current page and may point to internal or external pages
  """
  def a(%{type: :feed, href: href} = assigns) do
    ~H"<a href={href}><%= render_block(@inner_block) %></a>"
  end

  def a(%{type: :html, href: href} = assigns) do
    attrs =
      case URI.parse(href) do
        %{host: nil, path: "/" <> _rest} ->
          %{"data-phx-link-state": "push", "data-phx-link": "patch", href: href}

        %{host: h} when h in @paywall_hostnames ->
          %{target: "_blank", rel: "nofollow", href: href}

        %{host: h} when is_binary(h) ->
          %{target: "_blank", href: href}

        _any ->
          raise("<.a> link has an unknown href '#{href}' specified: #{inspect(assigns)}")
      end

    assigns = assign(assigns, :attrs, attrs)

    ~H"""
    <a {attrs}><%= render_block(@inner_block) %></a>
    """
  end

  @doc """
  m links modify the video or map position, but do otherwise not modify the current page
  """
  def m(%{type: :feed} = assigns) do
    ~H"<i><%= render_block(@inner_block) %></i>"
  end

  def m(%{type: :html} = assigns) do
    attr = %{"phx-click" => "map-zoom-to"}
    art = assigns.current_page

    art_with_tracks =
      if art.tracks() == [] do
        art
        |> Article.List.related()
        |> Article.List.with_tracks()
        |> Enum.at(0)
      else
        art
      end

    attr =
      if art_with_tracks,
        do: Map.put(attr, "phx-value-article", art_with_tracks.name()),
        else: attr

    attr =
      Enum.reduce(assigns, attr, fn {key, val}, acc ->
        if key in [:bounds, :lat, :lon, :dir, :route, :article, :zoom] do
          Map.put(acc, "phx-value-#{key}", val)
        else
          acc
        end
      end)

    attr =
      if is_map_key(attr, "phx-value-bounds"),
        do: attr,
        else: Map.put_new(attr, "phx-value-zoom", "15")

    assigns = assign(assigns, :attr, attr)
    ~H"<a {attr}><%= render_block(@inner_block) %></a>"
  end
end
