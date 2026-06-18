defmodule Components.TagHelpers do
  use Phoenix.Component
  use VelorouteWeb, :verified_routes

  require Settings
  import Guards

  @paywall_hostnames Settings.c(:paywall_hostnames)
  @default_language Settings.c(:default_language)

  @doc """
  a links change the current page and may point to internal or external pages
  """
  attr :href, :string
  attr :ref, :atom
  attr :rel, :string
  attr :target, :string
  attr :rest, :global
  slot(:inner_block, required: true)

  def a(%{href: _h, name: _n} = assigns),
    do:
      raise("Link contains both href and name, but you should pick only one: #{inspect(assigns)}")

  def a(%{ref: ref} = assigns) do
    art = Article.List.find_exact(ref)

    if is_nil(art),
      do: raise("Tried to find article by name '#{ref}', but no such article exists")

    article_link(Map.put(assigns, :ref, art))
  end

  def a(%{href: href} = assigns) do
    {attrs, extra_text} =
      case URI.new(href) do
        {:ok, %{host: nil, path: "/updates.atom" <> _rest}} ->
          {%{target: "_blank"}, ""}

        {:ok, %{host: nil, path: "/" <> _rest}} ->
          {%{"data-phx-link-state": "push", "data-phx-link": "patch"}, ""}

        {:ok, %{host: h}} when h in @paywall_hostnames ->
          {%{target: "_blank", rel: "nofollow"}, " [€]"}

        {:ok, %{host: h}} when is_binary(h) ->
          {%{target: "_blank"}, ""}

        _any ->
          raise("<.a> link has an unknown href '#{href}' specified: #{inspect(assigns)}")
      end

    attrs = Map.merge(Map.take(assigns, [:title, :href, :rel, :target]), attrs)
    assigns = assign(assigns, %{attrs: attrs, extra_text: extra_text})

    ~H"""
    <a {@attrs} {@rest}><%= render_slot(@inner_block) %></a><%= @extra_text %>
    """
  end

  @doc """
  v links modify the video or map position, but do otherwise not modify the current page
  """
  @spec v(map()) :: Phoenix.LiveView.Rendered.t()
  attr :bounds, :string, required: true
  attr :lat, :float, required: true
  attr :lon, :float, required: true
  attr :ref, :atom, required: true
  attr :dir, :string, values: ["forward", "backward"]
  attr :group, :string
  attr :highlight, :string
  attr :rest, :global
  slot(:inner_block, required: true)

  def v(assigns) do
    art = Article.List.find_exact(assigns[:ref])
    if is_nil(art), do: raise("missing attribute 'ref' on link '#{inner_text(assigns)}'")
    art_with_tracks = Article.Decorators.article_with_tracks(art)

    value = %{
      article: art_with_tracks.name(),
      bounds: assigns.bounds,
      lat: assigns.lat,
      lon: assigns.lon,
      dir: assigns.dir
    }

    value =
      if assigns[:group],
        do: Map.put(value, :group, assigns.group),
        else: value

    click_handler =
      Phoenix.LiveView.JS.push("map-zoom-to", value: value)
      |> ping(assigns[:highlight])

    attr = %{
      "phx-click" => click_handler,
      "href" => "?event=map-zoom-to&#{URI.encode_query(value)}",
      "onclick" => "return false",
      "class" => "video"
    }

    # if a highlight is present, assume the inner text might need translation
    attr =
      if Map.has_key?(assigns, :highlight),
        do: attr,
        else: Map.merge(attr, %{translate: "no", lang: @default_language})

    assigns = assign(assigns, :attr, attr)
    ~H"<a {@attr} {@rest}><%= render_slot(@inner_block) %></a>"
  end

  @spec m(map()) :: Phoenix.LiveView.Rendered.t()
  attr :bounds, :string, required: true
  attr :highlight, :string
  attr :lat, :float
  attr :lon, :float
  attr :rest, :global
  slot(:inner_block, required: true)

  def m(assigns) do
    assigns = assign(assigns, :rest, Map.put_new(assigns.rest, "class", "map"))

    ping =
      if assigns[:lat] && assigns[:lon],
        do: %{name: assigns[:highlight], center: %{lat: assigns.lat, lon: assigns.lon}},
        else: %{name: assigns[:highlight]}

    js =
      %Phoenix.LiveView.JS{}
      |> Phoenix.LiveView.JS.dispatch("map:ping", detail: ping)
      |> Phoenix.LiveView.JS.push("map-zoom-to", value: %{bounds: assigns.bounds})

    href = "?bounds=#{Geo.BoundingBox.to_string_bounds(assigns.bounds)}"
    assigns = assign(assigns, %{js: js, href: href})

    ~H"<a phx-click={@js} href={@href} onclick='return false' {@rest}><%= render_slot(@inner_block) %></a>"
  end

  @spec language_switcher(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :current_lang, :string
  attr :rest, :global

  def language_switcher(assigns) do
    ~H"""
    <%= for lang <- @ref.languages(), lang != @current_lang do %>
      <Components.TagHelpers.language_switch_link lang={lang} {@rest}/> &middot;
    <% end %>
    """
  end

  @spec language_switch_link(map()) :: Phoenix.LiveView.Rendered.t()
  attr :lang, :string, required: true
  attr :rest, :global

  def language_switch_link(assigns) do
    copy = %{"en" => "Prefer English?", "de" => "Lieber auf Deutsch?"}[assigns.lang]
    copy = copy || "Switch to #{assigns.lang}"

    cookie =
      "document.cookie='lang=#{assigns.lang}; expires=Fri, 31 Dec 9999 00:00:00 GMT; SameSite=Strict; Secure'; return false"

    assigns = assign(assigns, copy: copy, cookie: cookie)

    ~H"""
    <a {@rest}
      onclick={@cookie}
      href={"?lang=#{@lang}"}
      lang={@lang}
      phx-click={Phoenix.LiveView.JS.push("switch_language", value: %{lang: @lang})}>
      {@copy}
    </a>
    """
  end

  @spec search(map()) :: Phoenix.LiveView.Rendered.t()
  attr :query, :string
  attr :rest, :global
  slot(:inner_block, required: true)

  def search(assigns) do
    query = assigns[:query] || inner_text(assigns)
    assigns = assign(assigns, :rest, Map.put_new(assigns.rest, "class", "search"))

    js = Phoenix.LiveView.JS.push("search", value: %{value: query})

    href = "/?" <> URI.encode_query(search_query: query)
    assigns = assign(assigns, %{js: js, href: href})

    ~H"<a phx-click={@js} href={@href} onclick='return false' {@rest}><%= render_slot(@inner_block) %></a>"
  end

  defp ping(js, name) do
    Phoenix.LiveView.JS.dispatch(js, "map:ping", detail: %{name: name})
  end

  @spec show_route_group(map()) :: Phoenix.LiveView.Rendered.t()
  attr :group, :atom, required: true
  attr :rest, :global
  slot(:inner_block, required: true)

  def show_route_group(assigns) do
    assigns = assign(assigns, :rest, Map.put_new(assigns.rest, "class", "map"))
    assigns = assign(assigns, :js, show_route_groups_js(assigns.group))

    ~H"""
    <a phx-click={@js} {@rest}><%= render_slot(@inner_block) %></a>
    """
  end

  use Memoize

  defmemop show_route_groups_js(group) do
    layer_name = Enum.find(Settings.r(:map_layers), &(&1.route_group == group)).name

    routes =
      Article.Index.find(:all, [
        :intersect,
        {:all, :category, ["Static"]},
        {:all, :route_group, [group]}
      ])

    bbox =
      routes
      |> Enum.map(&Article.Decorators.bbox/1)
      |> Geo.CheapRuler.union()

    Phoenix.LiveView.JS.push("show-routes", value: %{name: layer_name}, target: "#map")
    |> Phoenix.LiveView.JS.dispatch("click", to: "#switcher")
    |> Phoenix.LiveView.JS.push("map-zoom-to", value: %{bounds: bbox})
  end

  attr :checked, :boolean, required: true
  attr :ref, :atom, required: true
  attr :lang, :string
  attr :rest, :global
  slot(:inner_block)

  def map_image_toggle_layer_switcher(assigns) do
    if assigns.ref.map_image() do
      assigns = map_toggle_title(assigns)

      ~H"""
        <button
          title={@title}
          value="map_image_toggle"
          class={"style #{if @checked, do: "active"}"}
          aria-checked={if @checked, do: "true", else: "false"}
          role="menuitemradio"
          phx-click="toggle-map-image"><%= if @lang == "en" do %>exact site map<% else %>genauer Lageplan<% end %></button>

        <div class="layerSpacer"></div>
      """
    else
      ~H""
    end
  end

  @spec map_image_toggle(map()) :: Phoenix.LiveView.Rendered.t()
  attr :checked, :boolean, required: true
  attr :title, :string, required: true
  attr :rest, :global
  slot(:inner_block)

  def map_image_toggle(assigns) do
    ~H"""
    <form {@rest} title={@title}>
      <input type="checkbox" name="toggle-map-image" value="toggle-map-image" id="toggle-map-image" phx-change="toggle-map-image" checked={if(@checked, do: "checked")}>
      <label for="toggle-map-image"><%= render_slot(@inner_block) || "genauen Lageplan anzeigen" %></label>
    </form>
    """
  end

  @spec h4_planning(map()) :: Phoenix.LiveView.Rendered.t()
  attr :checked, :boolean
  attr :ref, :atom, required: true
  attr :rest, :global
  slot(:inner_block)

  def h4_planning(assigns) do
    headline =
      case {assigns.ref.type(), assigns[:lang]} do
        {:intent, "en"} -> "Intent"
        {:intent, _} -> "Vorhaben"
        {_, "en"} -> "Planning"
        _ -> "Planung"
      end

    assigns = assign(assigns, headline: headline)

    if assigns.ref.map_image() do
      assigns = map_toggle_title(assigns)

      ~H"""
      <div class="headlineForm">
        <h4 {@rest}><%= render_slot(@inner_block) || @headline %></h4>
        <.map_image_toggle checked={@checked} title={@title}/>
      </div>
      """
    else
      ~H"""
      <h4 {@rest}><%= render_slot(@inner_block) || @headline %></h4>
      """
    end
  end

  defp map_toggle_title(assigns) do
    title =
      if assigns[:lang] == "en",
        do: """
        Site map only visible on high zoom – once buildings are shown.

        They are made by planning offices and departments, not by #{Settings.r(:feed_author)}:
        """,
        else: """
        Pläne nur auf hohen Zoomstufen sichtbar – sobald Häuser angezeigt werden.

        Die Pläne sind von Ämtern und Planungsbüros, nicht von #{Settings.r(:feed_author)}:
        """

    title =
      assigns.ref.map_image()
      |> Data.MapImage.attribution()
      |> Enum.reduce(title, fn {name, link}, title ->
        title <> "• #{name}\n   #{link}\n"
      end)
      |> String.trim()

    assign(assigns, :title, title)
  end

  defp maybe_disable_hyphens(assigns) do
    if assigns |> inner_text() |> String.contains?("@"),
      do: assign(assigns, :rest, Map.put_new(assigns.rest, "class", "noHyphens")),
      else: assigns
  end

  @spec mailto(map()) :: Phoenix.LiveView.Rendered.t()
  attr :email, :string
  attr :subject, :string
  attr :body, :string
  attr :rest, :global
  slot(:inner_block)

  def mailto(%{inner_block: _x, subject: subject, body: body} = assigns) do
    assigns =
      assigns
      |> Map.merge(%{
        email: Map.get(assigns, :email) || "#{Settings.r(:email_name)} <#{Settings.r(:email)}>",
        subject: URI.encode(subject),
        body: URI.encode(body)
      })
      |> maybe_disable_hyphens()

    ~H"""
    <a href={"mailto:#{@email}?subject=#{@subject}&body=#{@body}"} {@rest}><%= render_slot(@inner_block) %></a>
    """
  end

  def mailto(%{inner_block: _x, email: _e} = assigns) do
    assigns = maybe_disable_hyphens(assigns)

    ~H"""
    <a href={"mailto:#{@email}"} {@rest}><%= render_slot(@inner_block) %></a>
    """
  end

  def mailto(%{inner_block: []} = assigns) do
    ~H"""
    <a href={"mailto:#{Settings.r(:email_name)} <#{Settings.r(:email)}>" } class="noHyphens" {@rest}><%= Settings.r(:email) %></a>
    """
  end

  def mailto(%{inner_block: _x} = assigns) do
    assigns = maybe_disable_hyphens(assigns)

    ~H"""
    <a href={"mailto:#{Settings.r(:email_name)} <#{Settings.r(:email)}>"} {@rest}><%= render_slot(@inner_block) %></a>
    """
  end

  @spec updated_at_time(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string

  def updated_at_time(%{ref: art} = assigns) when is_module(art) do
    if art.updated_at() == nil do
      ~H{}
    else
      lang = assigns[:lang] || @default_language
      rd = Data.RoughDate.from_full_date(art.updated_at())

      assigns =
        assign(assigns, %{
          long: Data.RoughDate.to_str(rd, lang),
          short: Data.RoughDate.short(rd, lang),
          machine: Date.to_string(art.updated_at())
        })

      ~H"""
      <time title={@long} datetime={@machine}><%= @short %></time>
      """
    end
  end

  @spec article_link(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string, default: @default_language
  attr :class, :string, default: ""
  slot(:inner_block)

  def article_link(%{ref: art, lang: lang} = assigns) when is_module(art) do
    assigns =
      assign(assigns, %{
        href: art.path(),
        summary: art.summary(lang),
        title: Article.Decorators.full_title(art, lang)
      })

    ~H"""
    <a href={@href} class={@class} data-phx-link-state="push" data-phx-link="patch" title={@summary}><%= render_slot(@inner_block, :already_linked) || @title %></a>
    """
  end

  @spec list_articles(map()) :: Phoenix.LiveView.Rendered.t()
  attr :grouper, :any,
    default: nil,
    doc: "fn/1 getting an article, outputting the value to group by"

  attr :filter, :any,
    default: nil,
    doc: "fn/1 getting an article, returning if article should be kept"

  attr :refs, :list, required: true
  slot(:inner_block, required: true)

  def list_articles(%{refs: articles, filter: filter, grouper: grouper} = assigns) do
    articles = Enum.to_list(articles)
    filtered = if filter, do: Enum.filter(articles, filter), else: articles
    hidden = length(articles) - length(filtered)
    grouped = Util.ordered_group_by(filtered, grouper || (& &1.updated_at().year))
    assigns = assign(assigns, %{grouped: grouped, hidden: hidden})

    ~H"""
    <li :if={@hidden>0} class="aside"><%= @hidden %> gefiltert</li>
    <%= for {group, articles_for_group} <- @grouped do %>
      <%= if group != "" && group != nil do %>
        <li class="separator" role="separator"><%= group %></li>
      <% end %>
      <%= for art <- articles_for_group do %>
        <li><%= render_slot(@inner_block, art) %></li>
      <% end %>
    <% end %>
    """
  end

  @spec ref(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom
  attr :lang, :string, default: @default_language
  slot(:inner_block, required: true)

  def ref(assigns) do
    name = assigns[:ref] || String.downcase(inner_text(assigns))
    art = Article.List.find_exact(name)
    unless is_module(art), do: raise("Failed to find a ref for #{name}")

    assigns
    |> Map.merge(%{ref: art, class: "ref", lang: assigns.lang})
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

  @spec icon_only(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom
  slot(:inner_block, required: true)

  def icon_only(assigns) do
    content = inner_text(assigns)
    id = assigns[:ref] || content
    art = Article.List.find_exact(id)

    assigns =
      assign(assigns, %{
        style: "background: #{art.color()}",
        class: "icon #{art.route_group()}"
      })

    ~H"""
    <span style={@style} class={@class} translate="no"><%= render_slot(@inner_block) %></span>
    """
  end

  @spec icon(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom
  attr :bounds, :string
  attr :lat, :float
  attr :lon, :float
  attr :dir, :string, values: ["forward", "backward"]
  attr :autoplay, :boolean, default: false
  attr :rest, :global
  slot(:inner_block, required: true)

  def icon(assigns) do
    content = inner_text(assigns)
    id = assigns[:ref] || content

    art = Article.List.find_exact(id)

    unless is_module(art),
      do: raise("Icon refs '#{id}', but no article with such a id/name/display_id")

    # query encoding is slow, so here's an over-optimized version
    href = "#{art.path()}?"
    href = if v = assigns[:bounds], do: href <> "bounds=#{v}&", else: href
    href = if v = assigns[:lat], do: href <> "lat=#{v}&", else: href
    href = if v = assigns[:lon], do: href <> "lon=#{v}&", else: href
    href = if v = assigns[:dir], do: href <> "dir=#{v}&", else: href
    href = if assigns[:autoplay], do: href <> "autoplay=true&", else: href
    href = binary_slice(href, 0..-2//1)

    assigns =
      assign(assigns, %{
        href: href,
        summary: art.summary(),
        title: art.title(),
        style: "background: #{art.color()}",
        class: "icon #{art.route_group()}",
        id: art.display_id()
      })

    cond do
      art.display_id() == content || art.id() == content ->
        ~H"""
        <a href={@href}
           data-phx-link-state="push"
           data-phx-link="patch"
           title={@summary}
           style={@style}
           class={@class}
           aria-label={@title}
           {@rest}
        ><%= @id %></a>
        """

      content == "RSW" ->
        ~H"""
        <a href={@href}
           data-phx-link-state="push"
           data-phx-link="patch"
           title={@summary}
           aria-label={@title}
           class="customicon"
           {@rest}
        >
          <img src={~p"/images/rsw.svg"} alt="Radschnellweg Symbol der StVO" loading="lazy"/>
        </a>
        """

      true ->
        ~H"""
        <a href={@href} data-phx-link-state="push" data-phx-link="patch" title={@summary} aria-label={@title} {@rest}>
          <span style={@style} class={@class}><%= @id %></span><%= render_slot(@inner_block) %>
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
    <span class="noMobile"><%= render_slot(@inner_block) %></span>
    """
  end

  @spec structured_links(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :gpx, :boolean, default: false
  attr :lang, :string, default: @default_language

  def structured_links(%{ref: art} = assigns) do
    links =
      assigns
      |> art.links()
      |> Enum.map(fn
        {text, href} -> {text, href, nil, Allris.convert_url_to_bvhh(href)}
        {text, extra, href} -> {text, href, extra, Allris.convert_url_to_bvhh(href)}
        other -> other
      end)
      |> Enum.map(fn
        {text, "https://web.archive.org/" <> _rest = href, nil, bvhh} ->
          {text, maybe_direct_link_archive(href), "Archiv", bvhh}

        {text, "https://web.archive.org/" <> _rest = href, %Phoenix.LiveView.Rendered{} = extra,
         bvhh} ->
          assigns = %{extra: extra}
          {text, maybe_direct_link_archive(href), ~H{Archiv, <%= @extra %>}, bvhh}

        {text, "https://web.archive.org/" <> _rest = href, extra, bvhh} ->
          {text, maybe_direct_link_archive(href), "Archiv, #{extra}", bvhh}

        other ->
          other
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

        {text} when is_binary(text) ->
          text

        other ->
          other
      end)

    if assigns[:gpx] && !Article.has_category?(art, "Static"),
      do: raise("GPX requested in structured_links for non-Static article #{art}")

    links =
      if assigns[:gpx], do: links ++ Article.Decorators.gpx_links(art, assigns.lang), else: links

    assigns = %{links: links}

    case length(links) do
      0 -> ~H""
      1 -> ~H{<p class="links"><%= hd(@links) %></p>}
      _ -> ~H{<ul class="links"><%= for link <- @links do %><li><%= link %></li><% end %></ul>}
    end
  end

  defp maybe_direct_link_archive("https://web.archive.org/" <> _rest = href) do
    if Regex.match?(~r|/web/[0-9]+/https?://|, href) do
      href
      |> String.replace("/https://", "if_/https://")
      |> String.replace("/http://", "if_/http://")
    else
      href
    end
  end

  @doc """
  Wraps content into a div that will not be used by search engines
  """
  @spec noindex(map()) :: Phoenix.LiveView.Rendered.t()
  slot(:inner_block, required: true)

  def noindex(assigns) do
    ~H"""
    <div data-nosnippet="yes"><%= render_slot(@inner_block) %></div>
    """
  end

  @spec construction_duration(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string

  def construction_duration(%{ref: ref} = assigns) when is_module(ref) do
    lang = assigns[:lang] || @default_language
    assigns = %{duration: Data.RoughDate.range(ref.start(), ref.stop(), lang)}

    ~H"""
    <span class="duration"><%= @duration %></span>
    """
  end

  @spec construction_duration_header(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string

  def construction_duration_header(%{ref: art} = assigns) do
    lang = assigns[:lang] || @default_language
    range = Data.RoughDate.range(art.start(), art.stop(), lang)
    assigns = assign(assigns, range: range)

    cond do
      range == "" ->
        ~H""

      art.type() == :finished ->
        ~H{<span class="duration">Umbau abgeschlossen (Bauzeit <%= @range %>)</span>}

      true ->
        ~H{<span class="duration" aria-describedby="buildTimeGuess">vermutete Bauzeit: <%= @range %></span>}
    end
  end

  @spec construction_duration_header(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string

  def construction_duration_paragraph(%{ref: art} = assigns) do
    lang = assigns[:lang] || @default_language
    range = Data.RoughDate.range(art.start(), art.stop(), lang)
    assigns = assign(assigns, range: range)

    if range == "" || art.type() == :finished do
      ~H""
    else
      if lang == "en" do
        ~H"""
        <h4 lang="en">Suspected construction period</h4>
        <p lang="en"><em><%= @range %></em> – <span id="buildTimeGuess">the estimate is a rough guide only. Due to coordination of construction times, political decisions which require re-planning, shortage of staff and similar reasons, the actual construction period changes often. For daily updated infos, see <.a href="https://www.hamburg.de/verkehr/stau-und-baustellen/baustellen-826026">hamburg.de/baustellen</.a>.</span></p>
        """
      else
        ~H"""
        <h4>Vermutete Bauzeit</h4>
        <p><em><%= @range %></em> – <span id="buildTimeGuess">der Zeitraum ist nur zur groben Orientierung. Durch Abstimmung der Baustellen untereinander („Baustellenkoordination“), politische Beschlüsse die eine Neuplanung erfordern, Personalmangel in den Ämtern und ähnlichem verschieben sich die Termine häufig. Für tagesaktuelle Infos siehe <.a href="https://www.hamburg.de/verkehr/stau-und-baustellen/baustellen-826026">hamburg.de/baustellen</.a>.</span></p>
        """
      end
    end
  end

  @spec article_updated_at(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string, required: true

  def article_updated_at(%{ref: art} = assigns) do
    if art.updated_at() do
      assigns =
        assigns
        |> assign(%{
          machine: Date.to_string(art.updated_at()),
          machine_created: Date.to_string(art.created_at())
        })
        |> assign(
          if(assigns.lang == "de",
            do: %{
              human: "Letzte Änderung #{Article.Decorators.updated_at(art, assigns.lang)}",
              subject: "Fehler im Artikel \"#{art.title()}\"",
              body: "Moin,\n\nim Artikel \"#{art.title()}\" stimmt etwas nicht:\n\n",
              report_error: "Fehler melden"
            },
            else: %{
              human: "Last change #{Article.Decorators.updated_at(art, assigns.lang)}",
              subject: "Mistake in article \"#{art.title()}\"",
              body: "Hi,\n\nthere's something amiss in \"#{art.title()}\":\n\n",
              report_error: "Report mistake"
            }
          )
        )

      ~H"""
        <div class="artfooter" lang={@lang}>
          <.no_mobile><.language_switcher ref={@ref} current_lang={@lang}/></.no_mobile>
          <.mailto subject={@subject} body={@body}>{@report_error}</.mailto>
          &middot;
          <time class="updated" datetime={@machine} itemprop="dateModified" content={@machine}><%= @human %></time>
          <span itemprop="datePublished" content={@machine_created}></span>
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

  defp inner_text(%{inner_block: [%{inner_block: %{static: static}}]})
       when is_list(static) do
    Enum.join(static)
  end

  defp inner_text(assigns) do
    ~H{<%= render_slot(@inner_block) %>}
    |> Phoenix.LiveView.Engine.safe_to_iodata()
    |> IO.iodata_to_binary()
  end
end
