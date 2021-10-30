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
    art = assigns.current_page
    attrs = %{}

    attrs =
      cond do
        art.tracks() != [] ->
          Map.put(attrs, "phx-value-article", art.tracks())
      end

    # TODO take an article's tags, then find a related article with tracks

    # new_attr = %{"phx-click" => "map-zoom-to"}

    # new_attr =
    #   cond do
    #     article.tracks != [] ->
    #       Map.put(new_attr, "phx-value-article", article.name)

    #     rel = article |> Article.related_route() ->
    #       Map.put(new_attr, "phx-value-route", rel.id())

    #     true ->
    #       new_attr
    #   end

    # new_attr =
    #   Enum.reduce(attrs, new_attr, fn {key, val}, acc ->
    #     if key in ["bounds", "lat", "lon", "dir", "route", "article", "zoom"] do
    #       Map.put(acc, "phx-value-#{key}", val)
    #     else
    #       acc
    #     end
    #   end)

    # new_attr =
    #   if is_map_key(new_attr, "phx-value-bounds"),
    #     do: new_attr,
    #     else: Map.put_new(new_attr, "phx-value-zoom", "15")

    # {"a", Enum.to_list(new_attr), children}
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
