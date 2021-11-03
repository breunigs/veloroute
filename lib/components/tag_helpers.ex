defmodule TagHelpers do
  use Phoenix.Component
  import Guards

  def mailto(%{inner_block: _x} = assigns) do
    ~H"""
    <a href={Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end

  def mailto(assigns) do
    ~H"""
    <a href={Settings.email()}><%= Settings.email() %></a>
    """
  end

  def ref(assigns) do
    name = assigns[:name] || inner_text(assigns)
    art = Article.List.find_with_tags(name)
    unless is_module(art), do: raise("Failed to find a ref for #{name}")

    assigns = assign(assigns, :path, Article.Decorators.path(art))
    ~H"<a href={@path}><%= render_block(@inner_block) %></a>"
  end

  def icon(assigns) do
    id_from_attr = assigns[:name]
    content = inner_text(assigns)
    id = id_from_attr || content

    art = Article.List.category('Static') |> Article.List.find_with_tags(id)

    unless is_module(art),
      do: raise("Icon refs '#{id}', but no Static article with such a tag or name found")

    query = if assigns[:autoplay] == "true", do: %{autoplay: true}
    link_attr = %{href: art.path(query), data_phx_link: "patch", data_phx_link_state: "push"}

    # link_attr =
    #   if assigns[:autoplay] == "yes",
    #     do: Map.merge(link_attr, %{phx_click: "sld-autoplay", phx_value_article: art.id()}),
    #     else: link_attr

    icon = VelorouteWeb.VariousHelpers.route_icon(id)
    assigns = assign(assigns, %{icon: icon, link_attr: link_attr, id: id})

    # ~H"""
    # <a href={@path} {@extra_attrs} phx-value-article={@id} data-phx-link-state="push" data-phx-link="patch">
    #   <%= @icon %><%= if @id != content, do: render_block(@inner_block) %>
    # </a>
    # """
    ~H"""
    <a {@link_attr}>
      <%= @icon %><%= if @id != content, do: render_block(@inner_block) %>
    </a>
    """
  end

  def articles(assigns) do
    ~H"""
    FIXME FIXME FIXME
    """
  end

  @spec structured_links(map()) :: Phoenix.LiveView.Rendered.t()
  def structured_links(assigns) do
    art = assigns.current_page
    links = art.links(assigns)

    links =
      case assigns[:gpx] do
        "true" -> links ++ [Article.Decorators.gpx_links(art)]
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
