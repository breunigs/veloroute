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

  def updated_at_time(%{article: art} = assigns) when is_module(art) do
    if art.updated_at() == nil do
      ~H{}
    else
      assigns =
        assign(assigns, %{
          long: VelorouteWeb.VariousHelpers.long_date(art.updated_at()),
          short: VelorouteWeb.VariousHelpers.short_date(art.updated_at()),
          machine: Date.to_string(art.updated_at())
        })

      ~H"""
      <time title={@long} datetime={@machine}><%= @short %></time>
      """
    end
  end

  def construction_duration(%{article: art} = assigns) when is_module(art) do
    ~H"""
    <span class="duration"><%= Data.RoughDate.range(@article.start(), @article.stop()) %></span>
    """
  end

  def article_link(%{article: art, inner_block: _} = assigns) when is_module(art) do
    ~H"""
    <a href={Article.Decorators.path(@article)} data-phx-link-state="push" data-phx-link="patch"><%= render_slot(@inner_block) %></a>
    """
  end

  def article_link(%{article: art} = assigns) when is_module(art) do
    ~H"""
    <a href={Article.Decorators.path(@article)} data-phx-link-state="push" data-phx-link="patch"><%= Article.Decorators.full_title(@article) %></a>
    """
  end

  def list_articles(assigns) do
    grouped = Enum.group_by(assigns.articles, &assigns.grouper.(&1))
    assigns = assign(assigns, :grouped, grouped)

    ~H"""
    <%= for {group, articles} <- @grouped do %>
      <%= if group != "" && group != nil do %>
        <li class="separator"><%= group %></li>
      <% end %>
      <%= for art <- articles do %>
        <li><%= render_slot(@inner_block, art) %></li>
      <% end %>
    <% end %>
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

  defp inner_text(assigns) do
    [%{inner_block: fun}] = assigns.inner_block

    fun.(nil, nil)
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
  end
end
