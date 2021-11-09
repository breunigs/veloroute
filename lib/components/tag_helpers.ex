defmodule Components.TagHelpers do
  use Phoenix.Component
  import Guards

  @paywall_hostnames ["abendblatt.de", "www.abendblatt.de"]

  @doc """
  a links change the current page and may point to internal or external pages
  """
  @spec a(map()) :: Phoenix.LiveView.Rendered.t()
  def a(%{href: href} = assigns) do
    attrs =
      case URI.parse(href) do
        %{host: nil, path: "/" <> _rest} ->
          %{"data-phx-link-state": "push", "data-phx-link": "patch", href: href}

        %{host: h} when h in @paywall_hostnames ->
          %{target: "_blank", rel: "nofollow", href: href}

        %{host: h} when is_binary(h) ->
          %{target: "_blank", href: href}

        %{scheme: "mailto"} ->
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
  @spec m(map()) :: Phoenix.LiveView.Rendered.t()

  def m(%{render_target: :feed} = assigns) do
    ~H"<i><%= render_block(@inner_block) %></i>"
  end

  def m(%{render_target: :html} = assigns) do
    attr = %{"phx-click" => "map-zoom-to"}
    art = Article.List.find_exact(assigns[:ref]) || assigns.current_page

    geo = Map.take(assigns, [:bounds, :lat, :lon, :dir, :zoom])

    # add article only if a video is referenced. Otherwise it might show the
    # video for that article starting from 0:00, instead of just moving the map.
    attr =
      if Map.keys(geo) != [:bounds] do
        art_with_tracks = Article.Decorators.article_with_tracks(art)
        Map.put(attr, "phx-value-article", art_with_tracks.name())
      else
        attr
      end

    attr =
      Enum.reduce(geo, attr, fn {key, val}, acc ->
        Map.put(acc, "phx-value-#{key}", val)
      end)

    attr =
      if is_map_key(attr, "phx-value-bounds"),
        do: attr,
        else: Map.put_new(attr, "phx-value-zoom", "15")

    assigns = assign(assigns, :attr, attr)
    ~H"<a {attr}><%= render_block(@inner_block) %></a>"
  end

  @spec mailto(map()) :: Phoenix.LiveView.Rendered.t()
  def mailto(%{inner_block: _x} = assigns) do
    ~H"""
    <a href={"mailto:"<>Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end

  def mailto(assigns) do
    ~H"""
    <a href={"mailto:"<>Settings.email()}><%= Settings.email() %></a>
    """
  end

  @spec updated_at_time(map()) :: Phoenix.LiveView.Rendered.t()
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

  @spec article_link(map()) :: Phoenix.LiveView.Rendered.t()
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

  @spec list_articles(map()) :: Phoenix.LiveView.Rendered.t()
  def list_articles(assigns) do
    assigns = assign_new(assigns, :grouper, fn -> & &1.updated_at.year end)
    grouped = Util.ordered_group_by(assigns.articles, assigns.grouper)
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

  @spec ref(map()) :: Phoenix.LiveView.Rendered.t()
  def ref(assigns) do
    name = assigns[:name] || inner_text(assigns)
    art = Article.List.category("Static") |> Article.List.find_with_tags(name)
    unless is_module(art), do: raise("Failed to find a ref for #{name}")

    assigns = assign(assigns, :path, Article.Decorators.path(art))

    ~H"""
    <a class="ref" href={@path}><%= render_block(@inner_block) %></a>
    """
  end

  @spec icon(map()) :: Phoenix.LiveView.Rendered.t()
  def icon(assigns) do
    id_from_attr = assigns[:name]
    content = inner_text(assigns)
    id = id_from_attr || content

    art = Article.List.category("Static") |> Article.List.find_with_tags(id)

    unless is_module(art),
      do: raise("Icon refs '#{id}', but no Static article with such a tag or name found")

    query = if assigns[:autoplay] == "true", do: %{autoplay: true}

    link_attr = %{
      href: Article.Decorators.path(art, query),
      data_phx_link: "patch",
      data_phx_link_state: "push"
    }

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
  @spec noindex(map()) :: Phoenix.LiveView.Rendered.t()
  def noindex(assigns) do
    ~H"""
    <div data-nosnippet="yes"><%= render_block(@inner_block) %></div>
    """
  end

  @spec construction_duration(map()) :: Phoenix.LiveView.Rendered.t()
  def construction_duration(%{article: art} = assigns) when is_module(art) do
    ~H"""
    <span class="duration"><%= Data.RoughDate.range(@article.start(), @article.stop()) %></span>
    """
  end

  @spec construction_duration_header(map()) :: Phoenix.LiveView.Rendered.t()
  def construction_duration_header(%{article: art} = assigns) do
    range = Data.RoughDate.range(art.start(), art.stop())
    assigns = assign(assigns, range: range)

    cond do
      range == "" ->
        ~H""

      art.type() == :finished ->
        ~H{<span class="duration">Umbau abgeschlossen (Bauzeit <%= @range %>)</span>}

      true ->
        ~H{<span class="duration">vermutete Bauzeit: <%= @range %></span>}
    end
  end

  @spec article_updated_at(map()) :: Phoenix.LiveView.Rendered.t()
  def article_updated_at(%{article: art} = assigns) do
    if art.updated_at() do
      ~H"""
        <time class="updated">Letzte Änderung <%= Article.Decorators.updated_at(@article) %></time>
      """
    else
      ~H""
    end
  end

  @spec linkify(map(), Article.link()) :: Phoenix.LiveView.Rendered.t()
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
