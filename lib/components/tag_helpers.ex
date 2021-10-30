defmodule TagHelpers do
  use Phoenix.Component
  import Guards

  def mailto(assigns) do
    ~H"""
    <a href={Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end

  def ref(assigns) do
    name = assigns[:name] || inner_text(assigns)
    art = Article.List.find_with_tags(name)
    unless is_module(art), do: raise("Failed to find a ref for #{name}")

    assigns = assign(assigns, :path, Article.Dectorators.path(art))
    ~H"<a href={@path}><%= render_block(@inner_block) %></a>"
  end

  def icon(assigns) do
    id_from_attr = assigns[:name]
    content = inner_text(assigns)
    id = id_from_attr || content

    art = Article.List.category('Static') |> Article.List.find_with_tags(id)
    # FIXME: remove this default
    art = art || Article.List.find_exact("")

    unless is_module(art),
      do: raise("Icon refs '#{id}', but no Static article with such a tag or name found")

    extra_attrs = filter_attr_prefix(assigns, "phx-")
    icon = VelorouteWeb.VariousHelpers.route_icon(id)
    assigns = assign(assigns, %{extra_attrs: extra_attrs, icon: icon, path: art.path()})

    ~H"""
    <a href={@path} {@extra_attrs}><%= @icon %><%= if id != content, do: render_block(@inner_block) %></a>
    """
  end

  def m(assigns) do
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

  @spec structured_links(map()) :: Phoenix.LiveView.Rendered.t()
  def structured_links(assigns) do
    art = assigns.current_page
    links = art.links()

    links =
      case assigns[:gpx] do
        "yes" -> links ++ [Article.Dectorators.gpx_links(art)]
        nil -> links
        other -> raise("gpx=#{other} not supported, allowed are 'yes' or absence")
      end

    case length(links) do
      0 ->
        ~H""

      1 ->
        ~H"<p><%= linkify(assigns, hd(links)) %></p>"

      _more ->
        ~H"""
        <ul>
        <%= for link <- links do %>
          <li><%= linkify(assigns, link) %></li>
        <% end %>
        </ul>
        """
    end
  end

  @doc """
  Wraps content into a div that will not be used by search engines
  """
  def noindex(assigns) do
    ~H"""
    <div data-nosnippet="yes"><%= render_block(@inner_block) %></div>
    """
  end

  @spec linkify(map(), Article.Behaviour.link()) :: Phoenix.LiveView.Rendered.t()
  defp linkify(assigns, {text, href}) do
    assigns = assign(assigns, :text, text)
    assigns = assign(assigns, :href, href)
    ~H"<a href={@href}><%= @text %></a>"
  end

  defp linkify(_assigns, heex), do: heex

  defp filter_attr_prefix(assigns, prefix) do
    Enum.filter(assigns, fn {k, _v} ->
      String.starts_with?(to_string(k), prefix)
    end)
  end

  defp inner_text(assigns) do
    assigns.inner_block.(nil, nil)
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
  end
end
