defmodule Components.TagHelpers do
  use Phoenix.Component
  import Guards

  @paywall_hostnames ["abendblatt.de", "www.abendblatt.de"]

  @doc """
  a links change the current page and may point to internal or external pages
  """
  attr :href, :string
  attr :name, :string
  attr :rest, :global
  slot(:inner_block, required: true)

  def a(%{href: _h, name: _n} = assigns),
    do:
      raise("Link contains both href and name, but you should pick only one: #{inspect(assigns)}")

  def a(%{name: name} = assigns) do
    art = Article.List.find_exact(name)

    if is_nil(art),
      do: raise("Tried to find article by name '#{name}', but no such article exists")

    article_link(Map.put(assigns, :article, art))
  end

  def a(%{href: href} = assigns) do
    {attrs, extra_text} =
      case URI.new(href) do
        {:ok, %{host: nil, path: "/" <> _rest}} ->
          {%{"data-phx-link-state": "push", "data-phx-link": "patch"}, ""}

        {:ok, %{host: h}} when h in @paywall_hostnames ->
          {%{target: "_blank", rel: "nofollow"}, " [€]"}

        {:ok, %{host: h}} when is_binary(h) ->
          {%{target: "_blank"}, ""}

        _any ->
          raise("<.a> link has an unknown href '#{href}' specified: #{inspect(assigns)}")
      end

    attrs = Map.merge(Map.take(assigns, [:title, :href]), attrs)
    assigns = assign(assigns, %{attrs: attrs, extra_text: extra_text})

    ~H"""
    <a {@attrs}><%= render_block(@inner_block) %></a><%= @extra_text %>
    """
  end

  @doc """
  m links modify the video or map position, but do otherwise not modify the current page
  """
  @spec m(map()) :: Phoenix.LiveView.Rendered.t()
  attr :current_page, :atom, required: true
  attr :render_target, :atom, values: [:feed, :html], required: true
  attr :bounds, :string
  attr :lat, :float
  attr :lon, :float
  attr :dir, :string, values: ["forward", "backward"]
  attr :group, :string
  attr :ref, :string
  slot(:inner_block, required: true)

  def m(%{render_target: :feed} = assigns) do
    ~H"<i><%= render_block(@inner_block) %></i>"
  end

  def m(%{render_target: :html} = assigns) do
    attr = %{"phx-click" => Phoenix.LiveView.JS.push("map-zoom-to")}
    art = Article.List.find_exact(assigns[:ref]) || assigns.current_page

    geo = Map.take(assigns, [:bounds, :lat, :lon, :dir, :group])

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

    polylines = Data.AutoGenerated.StreetPolyline.get(inner_text(assigns))
    attr = if polylines, do: Map.update!(attr, "phx-click", &ping(&1, polylines)), else: attr

    assigns = assign(assigns, :attr, attr)
    ~H"<a {@attr}><%= render_block(@inner_block) %></a>"
  end

  defp ping(js, polylines) do
    Phoenix.LiveView.JS.dispatch(js, "map:ping", detail: %{polylines: polylines})
  end

  @spec mailto(map()) :: Phoenix.LiveView.Rendered.t()
  attr :email, :string
  attr :subject, :string
  attr :body, :string
  slot(:inner_block)

  def mailto(%{inner_block: _x, email: _e} = assigns) do
    ~H"""
    <a href={"mailto:#{@email}"}><%= render_block(@inner_block) %></a>
    """
  end

  def mailto(%{inner_block: _x, subject: subject, body: body} = assigns) do
    assigns =
      Map.merge(assigns, %{
        email: Settings.email(),
        subject: URI.encode(subject),
        body: URI.encode(body)
      })

    ~H"""
    <a href={"mailto:#{@email}?subject=#{@subject}&body=#{@body}"}><%= render_block(@inner_block) %></a>
    """
  end

  def mailto(%{inner_block: []} = assigns) do
    ~H"""
    <a href={"mailto:"<>Settings.email()}><%= Settings.email() %></a>
    """
  end

  def mailto(%{inner_block: _x} = assigns) do
    ~H"""
    <a href={"mailto:"<>Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end

  @spec updated_at_time(map()) :: Phoenix.LiveView.Rendered.t()
  attr :article, :atom

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
  attr :article, :atom
  attr :class, :string
  slot(:inner_block)

  def article_link(%{article: art, inner_block: []} = assigns) when is_module(art) do
    assigns = Map.put_new(assigns, :class, "")

    ~H"""
    <a href={Article.Decorators.path(@article)} class={@class} data-phx-link-state="push" data-phx-link="patch" title={@article.summary()}><%= Article.Decorators.full_title(@article) %></a>
    """
  end

  def article_link(%{article: art, inner_block: _} = assigns) when is_module(art) do
    assigns = Map.put_new(assigns, :class, "")

    ~H"""
    <a href={Article.Decorators.path(@article)} class={@class} data-phx-link-state="push" data-phx-link="patch" title={@article.summary()}><%= render_slot(@inner_block, :already_linked) %></a>
    """
  end

  @spec list_articles(map()) :: Phoenix.LiveView.Rendered.t()
  attr :grouper, :any, doc: "fn/1 getting an article, outputting the value to group by"
  attr :articles, :list
  slot(:inner_block, required: true)

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
  attr :name, :string
  slot(:inner_block, required: true)

  def ref(assigns) do
    name = assigns[:name] || inner_text(assigns)
    art = Article.List.category("Static") |> Article.List.find_with_tags(name)
    unless is_module(art), do: raise("Failed to find a ref for #{name}")

    assigns
    |> Map.merge(%{article: art, class: "ref"})
    |> article_link()
  end

  @spec abbr(map()) :: Phoenix.LiveView.Rendered.t()
  slot(:inner_block, required: true)

  def abbr(assigns) do
    name = inner_text(assigns)

    case name do
      "BVM" -> ~H{<abbr title="Behörde für Verkehr und Mobilitätswende">BVM</abbr>}
      "BWVI" -> ~H{<abbr title="Behörde für Wirtschaft, Verkehr und Innovation">BWVI</abbr>}
      "LGV" -> ~H{<abbr title="Landesbetrieb Geoinformation und Vermessung">LGV</abbr>}
      "LSBG" -> ~H{<abbr title="Landesbetrieb Straßen, Brücken und Gewässer">LSBG</abbr>}
      "HPA" -> ~H{<abbr title="Hamburg Port Authority">HPA</abbr>}
    end
  end

  @spec icon(map()) :: Phoenix.LiveView.Rendered.t()
  attr :name, :string
  attr :autoplay, :boolean, default: false
  attr :link, :boolean, default: true
  slot(:inner_block, required: true)

  def icon(assigns) do
    id_from_attr = assigns[:name]
    content = inner_text(assigns)
    id = id_from_attr || content

    art = Article.List.category("Static") |> Article.List.find_with_tags(id)

    unless is_module(art),
      do: raise("Icon refs '#{id}', but no Static article with such a tag or name found")

    query = if assigns[:autoplay], do: %{autoplay: true}
    href = Article.Decorators.path(art, query)
    # icon = VelorouteWeb.VariousHelpers.route_icon(art)

    assigns =
      assign(assigns, %{
        href: href,
        summary: art.summary(),
        style: "background: #{art.color()}",
        class: "icon #{art.route_group()}",
        id: art.display_id()
      })

    cond do
      !assigns[:link] ->
        assigns = assign(assigns, :content, if(content != "", do: content, else: id))

        ~H"""
        <span style={@style} class={@class}><%= @content %></span>
        """

      art.display_id() == content || art.id() == content ->
        ~H"""
        <a href={@href}
           data-phx-link-state="push"
           data-phx-link="patch"
           title={@summary}
           style={@style}
           class={@class}
        ><%= @id %></a>
        """

      true ->
        ~H"""
        <a href={@href} data-phx-link-state="push" data-phx-link="patch" title={@summary}>
          <span style={@style} class={@class}><%= @id %></span><%= render_block(@inner_block) %>
        </a>
        """
    end
  end

  attr :href, :string, required: true

  def allris(assigns) do
    ~H"""
    <.a href={@href} title="Unterlagen im offiziellen Sitzunsdienst Hamburgs anzeigen. Weniger benutzerfreundlich als die zuerst verlinkte Alternative.">Originalseite</.a>
    """
  end

  def no_mobile(assigns) do
    ~H"""
    <span class="noMobile"><%= render_block(@inner_block) %></span>
    """
  end

  @spec structured_links(map()) :: Phoenix.LiveView.Rendered.t()
  attr :current_page, :atom, required: true
  attr :gpx, :boolean, default: false

  def structured_links(assigns) do
    art = assigns.current_page

    links =
      assigns
      |> art.links()
      |> Enum.map(fn
        {text, href} -> {text, href, nil, Allris.convert_url_to_bvhh(href)}
        {text, extra, href} -> {text, href, extra, Allris.convert_url_to_bvhh(href)}
        other -> other
      end)
      |> Enum.map(fn
        {text, href, nil, nil} ->
          assigns = %{text: text, href: href}
          ~H"<.a href={@href}><%= @text %></.a>"

        {text, href, nil, bvhh} ->
          assigns = %{text: text, href: href, bvhh: bvhh}

          ~H"<.a href={@bvhh}><%= @text %></.a><.no_mobile> (<.allris href={@href} />)</.no_mobile>"

        {text, href, extra, nil} ->
          assigns = %{text: text, href: href, extra: extra}
          ~H"<.a href={@href}><%= @text %></.a> (<%= @extra %>)"

        {text, href, extra, bvhh} ->
          assigns = %{text: text, href: href, extra: extra, bvhh: bvhh}

          ~H"<.a href={@bvhh}><%= @text %></.a> (<%= @extra %><.no_mobile>, <.allris href={@href} /></.no_mobile>)"

        other ->
          other
      end)

    links = if assigns[:gpx], do: links ++ [Article.Decorators.gpx_links(art)], else: links
    assigns = %{links: links}

    case length(links) do
      0 -> ~H""
      1 -> ~H{<p><%= hd(@links) %></p>}
      _ -> ~H{<ul><%= for link <- @links do %><li><%= link %></li><% end %></ul>}
    end
  end

  @doc """
  Wraps content into a div that will not be used by search engines
  """
  @spec noindex(map()) :: Phoenix.LiveView.Rendered.t()
  slot(:inner_block, required: true)

  def noindex(assigns) do
    ~H"""
    <div data-nosnippet="yes"><%= render_block(@inner_block) %></div>
    """
  end

  @spec construction_duration(map()) :: Phoenix.LiveView.Rendered.t()
  attr :article, :atom

  def construction_duration(%{article: art} = assigns) when is_module(art) do
    ~H"""
    <span class="duration"><%= Data.RoughDate.range(@article.start(), @article.stop()) %></span>
    """
  end

  @spec construction_duration_header(map()) :: Phoenix.LiveView.Rendered.t()
  attr :article, :atom

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
  attr :article, :atom

  def article_updated_at(%{article: art} = assigns) do
    if art.updated_at() do
      assigns =
        Map.merge(assigns, %{
          human: Article.Decorators.updated_at(art),
          machine: Date.to_string(art.updated_at()),
          subject: "Fehler im Artikel \"#{art.title()}\"",
          body: "Moin,\n\nim Artikel \"#{art.title()}\" stimmt etwas nicht:\n\n"
        })

      ~H"""
      <div class="artfooter">
          <.mailto subject={@subject} body={@body}>Fehler melden</.mailto>
          &middot;
          <time class="updated" datetime={@machine}>Letzte Änderung <%= @human %></time>
        </div>
      """
    else
      ~H""
    end
  end

  @spec roaddiagram(map()) :: Phoenix.LiveView.Rendered.t()
  attr :src, :string, required: true
  attr :class, :string, default: ""
  attr :width, :integer
  attr :alt, :string, required: true

  def roaddiagram(%{src: src, class: class} = assigns) do
    {w, h} = Data.ImageSize.size("data/images/#{src}.svg")
    ratio = h / w

    w = if is_map_key(assigns, :width), do: assigns.width, else: 400
    assigns = assign(assigns, w: w, h: round(w * ratio))

    style = if is_map_key(assigns, :width), do: "width: #{w}px;", else: ""
    style = if is_map_key(assigns, :style), do: style <> assigns.style, else: style
    assigns = assign(assigns, style: style, class: "roaddiagram " <> class)

    ~H"""
    <img src={"/images/#{@src}.svg"} width={@w} height={@h} class={@class} alt={@alt} style={@style}/>
    """
  end

  defp inner_text(assigns) do
    [%{inner_block: fun}] = assigns.inner_block

    fun.(nil, nil)
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
  end
end
