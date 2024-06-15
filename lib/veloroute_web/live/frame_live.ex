defmodule VelorouteWeb.FrameLive do
  use VelorouteWeb, :live_view
  require Logger
  import Guards

  @search_page Data.Article.Static.Suche
  @search_page_name @search_page.name()

  @default_bounds struct(Geo.BoundingBox, Settings.initial())
  @initial_state [
    prev_page: nil,
    current_page: nil,
    map_bounds: @default_bounds,
    article_original_date: nil,
    article_date: nil,
    article_title: nil,
    article_summary: nil,
    search_query: "",
    search_results: nil,
    tmp_last_article_set: nil,
    limit_to_map_bounds: false,
    show_map_image: false,
    og_image: nil,
    enable_drawing_tools: false,
    lang_user_set: false,
    lang: nil
  ]

  def mount(params, session, socket) do
    draw =
      Application.get_env(:veloroute, :enable_drawing_tools) ||
        params["enable_drawing_tools"] == "1"

    state =
      Keyword.merge(@initial_state,
        enable_drawing_tools: draw,
        lang: session["lang"],
        lang_user_set: session["lang_user_set"],
        map_bounds: Geo.BoundingBox.parse(params["bounds"]) || @default_bounds
      )

    socket =
      socket
      |> assign(state)
      |> maybe_run_events_from_url(params)
      |> search(params["search_query"])

    {:ok, socket}
  end

  def handle_info(:check_updates, socket) do
    socket = socket |> update_url_query
    {:noreply, socket}
  end

  def handle_info({ref, _result}, socket) when is_reference(ref) do
    Process.demonitor(ref, [:flush])
    Logger.debug("ignoring result of other async task (via #{inspect(ref)})")
    {:noreply, socket}
  end

  def handle_info(other, socket) do
    Logger.info("got unexpected info for: #{inspect(other)} at #{inspect(socket)}")
    {:noreply, socket}
  end

  def handle_event("map-zoom-to", attr, socket) do
    Logger.debug("map-zoom-to: #{inspect(attr)}")

    article = find_article(attr["article"] || attr["ref"])

    socket =
      socket
      |> update_map_bounds(attr)
      |> VelorouteWeb.Live.VideoState.maybe_update_video(article, attr)

    {:noreply, socket}
  end

  def handle_event("map-bounds", %{"bounds" => bounds}, socket) do
    Process.send_after(self(), :check_updates, 100)
    {:noreply, assign(socket, :map_bounds, Geo.BoundingBox.parse(bounds))}
  end

  def handle_event("map-bounds", _attr, socket), do: {:noreply, socket}

  def handle_event("limit-to-map-bounds", _attr, socket) do
    {:noreply, assign(socket, :limit_to_map_bounds, !socket.assigns.limit_to_map_bounds)}
  end

  def handle_event("toggle-map-image", _attr, socket) do
    socket =
      socket
      |> assign(:show_map_image, !socket.assigns.show_map_image)
      |> update_map_image()

    {:noreply, socket}
  end

  def handle_event("search", %{"search_query" => query}, socket) do
    {:noreply, search(socket, query) |> show_search_page()}
  end

  def handle_event("search", %{"value" => query}, socket) do
    {:noreply, search(socket, query) |> show_search_page()}
  end

  def handle_event("video-reverse", attr, socket) do
    Logger.debug("video-reverse #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.reverse(attr)
     |> update_url_query()}
  end

  @deprecated "removed from FE, should not be used after a while"
  def handle_event("video-pause", attr, socket) do
    Logger.debug("video-pause #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr)
     |> update_url_query()}
  end

  def handle_event("video-current-time", attr, socket) do
    Logger.debug("video-current-time #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr)
     |> update_url_query()}
  end

  def handle_event("video-fatal-hls", attr, socket) do
    Logger.debug("video-fatal-hls #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr)
     |> autoplay()
     |> update_url_query()}
  end

  def handle_event("map-click", attr, socket) do
    # if we have an article use that, but ignore the default article (i.e. the
    # startpage) when we have a route
    article = find_article(attr["article"])

    route =
      if attr["article"] && article,
        do: article,
        else: find_most_relevant_article(attr["route"], socket.assigns)

    # if we don't have an article, switch to the route only if the current page is unrelated
    current = socket.assigns.current_page
    article = article || if route && !Article.List.related?(current, route), do: route

    article =
      if current == Data.Article.Static.Datenexport,
        do: nil,
        else: article

    socket = VelorouteWeb.Live.VideoState.maybe_update_video(socket, route, attr)

    socket =
      if article do
        socket
        |> assign(:tmp_last_article_set, article)
        |> push_patch(to: article_path(socket, article))
      else
        update_url_query(socket)
      end

    {:noreply, socket}
  end

  def handle_event("video-ended", %{"action" => "play"}, %{assigns: assigns} = socket) do
    current_track = VelorouteWeb.Live.VideoState.current_track(assigns.video)
    current_rendered = VelorouteWeb.Live.VideoState.current_rendered(assigns.video)

    socket =
      with %{action: :play} = action <- Map.get(current_track, :end_action),
           %{lat: lat, lon: lon} when is_module(current_rendered) <-
             List.last(current_rendered.coords()) do
        socket
        |> VelorouteWeb.Live.VideoState.maybe_update_video(action.route, %{
          "group" => action.group,
          "direction" => to_string(action.direction),
          "lat" => lat,
          "lon" => lon
        })
        |> maybe_autoplay(true)
      else
        _ -> socket
      end

    {:noreply, socket}
  end

  def handle_event("impressum", _params, socket) do
    text = "#{Credentials.impressum_address()}\n\n#{Settings.email()}"
    {:noreply, push_event(socket, "impressum", %{text: text})}
  end

  def handle_event(ident, attr, socket) do
    msg = "Received unknown/unparsable event '#{ident}': #{inspect(attr)}"
    Logger.warning(msg)
    {:noreply, socket}
  end

  def handle_params(params, uri, socket) when is_binary(uri) do
    socket = assign(socket, :current_url, uri)
    handle_params(params, nil, socket)
  end

  def handle_params(%{"not_found" => "true"}, nil, socket),
    do: {:noreply, render_404(socket, "not found param set")}

  def handle_params(%{"article" => name, "subdir" => "articles"} = params, nil, socket) do
    params
    |> Map.delete("subdir")
    |> Map.put("article", name)
    |> handle_params(nil, socket)
  end

  def handle_params(%{"article" => name, "subdir" => subdir} = params, nil, socket)
      when is_binary(subdir) and subdir != "" do
    params
    |> Map.delete("subdir")
    |> Map.put("article", "#{subdir}/#{name}")
    |> handle_params(nil, socket)
  end

  def handle_params(%{"article" => name} = params, nil, socket) do
    Logger.debug("article: #{name} (#{inspect(params)})")

    prev_article = socket.assigns.tmp_last_article_set
    article = find_article(name || "")

    # only update videos if the article changed. Otherwise it will slightly
    # change the position we might've just set through map-click
    socket =
      if article == prev_article,
        do: socket,
        else:
          socket
          |> update_map_bounds(params)
          |> VelorouteWeb.Live.VideoState.maybe_update_video(article, params)
          |> maybe_autoplay(params["autoplay"] == "true")

    socket =
      socket
      |> set_content(article)
      |> set_bounds(article, Map.get(params, "bounds"))
      |> update_og_image()
      |> assign(:tmp_last_article_set, article)

    {:noreply, socket}
  end

  def handle_params(%{"page" => @search_page_name, "search_query" => query} = params, nil, socket) do
    params
    |> Map.put("article", @search_page_name)
    |> handle_params(nil, assign(socket, :search_query, query))
  end

  def handle_params(%{"page" => name} = params, nil, socket) do
    params
    |> Map.put("article", name)
    |> handle_params(nil, socket)
  end

  # i.e. there's a path we didn't recognize yet, so it must be a 404.
  def handle_params(%{"path" => list}, nil, socket) when is_list(list) do
    {:noreply, render_404(socket, "path not recognized")}
  end

  def handle_params(params, nil, socket) do
    Logger.debug("params: default (#{inspect(params)})")

    params
    |> Map.put("article", find_article(nil))
    |> handle_params(nil, socket)
  end

  defp set_content(%{assigns: %{current_page: art}} = socket, art) when is_module(art) do
    assign(socket, prev_page: art)
  end

  defp set_content(socket, art) when is_module(art) do
    full_title = Article.Decorators.full_title(art)

    page_title =
      if full_title == "",
        do: Settings.page_title_long(),
        else: Settings.page_title_short() <> full_title

    socket
    |> assign(
      prev_page: socket.assigns.current_page,
      current_page: art,
      canonical_url: canonical(art),
      alternate_urls: alternate(art, socket.assigns.lang),
      page_title: page_title,
      article_original_date: art.created_at(),
      article_date: art.updated_at(),
      article_title: if(full_title == "", do: page_title, else: full_title),
      article_summary: art.summary()
    )
    |> update_map_image()
  end

  defp set_content(socket, _article), do: render_404(socket, "article not found")

  defp render_404(socket, reason) do
    Logger.error("Non-existing site was accessed (#{reason}): #{socket.assigns.current_url}")

    socket
    |> put_flash(:info, 404)
    |> push_patch(to: ~p"/?#{url_query(socket)}")
  end

  defp search(socket, query) do
    query = if query && query != "", do: String.trim(query), else: socket.assigns.search_query
    bbox = Geo.BoundingBox.parse(socket.assigns[:map_bounds]) || Settings.initial()

    querier = fn ->
      with {:ok, results} <- Search.Meilisearch.Runner.query(query, bbox) do
        {:ok, %{search_results: results}}
      end
    end

    socket
    |> assign(:search_query, query)
    |> assign_async(:search_results, querier)
  end

  defp show_search_page(socket) do
    push_patch(socket, to: article_path(socket, @search_page))
  end

  defp set_bounds(socket, article, bounds_param)

  defp set_bounds(%{assigns: %{map_bounds: @default_bounds}} = socket, article, bounds_param)
       when is_binary(bounds_param) do
    parsed = Geo.BoundingBox.parse(bounds_param)

    if parsed != nil,
      do: update_map_bounds(socket, parsed),
      else: set_bounds(socket, article, nil)
  end

  defp set_bounds(%{assigns: %{prev_page: art}} = socket, art, _bounds_param) do
    socket
  end

  defp set_bounds(%{assigns: %{prev_page: nil}} = socket, _art, _bounds_param) do
    socket
  end

  defp set_bounds(socket, art, _bounds_param) when is_module(art) do
    prev_bbox = socket.assigns.map_bounds
    next_bbox = Article.Decorators.bbox(art)

    cond do
      is_nil(next_bbox) ->
        socket

      is_nil(prev_bbox) ->
        update_map_bounds(socket, next_bbox)

      is_nil(art.id()) ->
        update_map_bounds(socket, next_bbox)

      # i.e. if we have a "route article", zoom only in, but not out
      Geo.CheapRuler.inside_bbox?(next_bbox, Geo.BoundingBox.parse(prev_bbox)) ->
        update_map_bounds(socket, next_bbox)

      true ->
        socket
    end
  end

  defp set_bounds(socket, _article, _bounds_param) do
    socket
  end

  defp update_map_bounds(%{assigns: %{map_bounds: bounds}} = socket, bounds), do: socket

  defp update_map_bounds(socket, bounds) when is_struct(bounds, Geo.BoundingBox) do
    preload1 =
      bounds
      |> Geo.CheapRuler.buffer_bbox(2000)
      |> Geo.CheapRuler.union(socket.assigns.map_bounds)
      |> Basemap.Tiles.tile_path_for_bounds()

    preload2 = bounds |> Basemap.Tiles.tile_path_for_bounds()

    socket
    |> push_event("bounds:adjust", bounds)
    |> push_event("map:preload:tile", %{url: preload1, low_prio_url: preload2})
    |> assign(map_bounds: bounds)
  end

  defp update_map_bounds(socket, %{"bounds" => bounds}) do
    update_map_bounds(socket, Geo.BoundingBox.parse(bounds))
  end

  defp update_map_bounds(socket, %{}), do: socket
  defp update_map_bounds(socket, nil), do: socket

  defp update_map_image(socket) do
    show = socket.assigns.show_map_image
    art = socket.assigns.current_page
    data = Data.MapImage.for_frontend(if art && show, do: art.map_image())
    Phoenix.LiveView.push_event(socket, :show_map_image, data)
  end

  defp find_article(nil), do: nil

  defp find_article(name) when is_binary(name) or is_module(name) do
    Article.List.find_exact(name)
  end

  defp find_article(%{assigns: %{current_page: name}}) do
    Article.List.find_exact(name)
  end

  defp find_most_relevant_article(nil, _assigns), do: nil

  defp find_most_relevant_article(routes, %{current_page: current}) do
    arts = routes |> List.wrap() |> Enum.map(&find_article/1) |> Enum.uniq() |> Util.compact()

    # when there's multiple routes being clicked, prefer keeping the current one,
    # or at least select one that is somewhat related
    sorted =
      Enum.sort_by(
        arts,
        &{
          &1 == current,
          current.route_group() == &1.route_group(),
          Article.List.overlap?(current, &1)
        },
        :desc
      )

    List.first(sorted)
  end

  defp article_path(socket, art) when is_module(art) do
    query = url_query(socket)
    Article.Decorators.path(art, query)
  end

  defp update_url_query(%{assigns: assigns} = socket) do
    %{path: path, query: prev_query} = URI.new!(assigns.current_url)
    query = url_query(socket)

    if prev_query != nil && URI.decode_query(prev_query) == query do
      socket
    else
      socket
      |> push_patch(
        to: path <> "?" <> URI.encode_query(query),
        replace: true
      )
      |> preserve_flash(socket)
    end
  end

  defp url_query(%{assigns: assigns}) do
    bounds = Geo.BoundingBox.to_string_bounds(assigns[:map_bounds])

    query = %{
      "video" => assigns[:video_vanity] || assigns[:video_hash],
      "pos_sec" => if(assigns[:video_start], do: assigns[:video_start] / 1000.0),
      "bounds" => bounds
    }

    query =
      if assigns[:lang] &&
           (assigns[:lang] != Settings.default_language() || assigns[:lang_user_set]),
         do: Map.put(query, "lang", assigns[:lang]),
         else: query

    if blank?(assigns[:search_query]) do
      Map.delete(query, "search_query")
    else
      Map.put(query, "search_query", assigns[:search_query])
    end
  end

  defp preserve_flash(socket, old_socket) do
    old_socket.assigns.flash
    |> Enum.reduce(socket, fn {type, msg}, socket ->
      put_flash(socket, type, msg)
    end)
  end

  defp blank?(""), do: true
  defp blank?(nil), do: true
  defp blank?(_), do: false

  defp autoplay(socket), do: maybe_autoplay(socket, true)
  defp maybe_autoplay(socket, true), do: push_event(socket, "video:autoplay", %{})
  defp maybe_autoplay(socket, false), do: socket

  defp canonical(art) do
    if art, do: Article.Decorators.path(art), else: "/"
  end

  defp alternate(nil, _lang), do: %{}

  defp alternate(art, lang) when is_module(art) do
    art.languages()
    |> List.delete(lang)
    |> Enum.into(%{}, fn lang ->
      {lang, Article.Decorators.path(art) <> "?lang=#{lang}"}
    end)
  end

  @default_center_zoom Settings.bounds()
                       |> Geo.BoundingBox.parse()
                       |> VelorouteWeb.VariousHelpers.to_string_center_zoom()
  defp update_og_image(%{assigns: %{current_page: nil}} = socket) do
    url = ~s(/map/___static/#{@default_center_zoom}/1280x720)
    assign(socket, :og_image, make_absolute(url))
  end

  defp update_og_image(%{assigns: assigns} = socket) do
    related_tracks = Article.Decorators.related_tracks(assigns.current_page)
    current_track = VelorouteWeb.Live.VideoState.current_track(assigns.video)

    url =
      if Enum.member?(related_tracks, current_track) do
        ~p"/images/thumbnails/#{assigns.video_hash}/#{assigns.video_start}"
      else
        center_zoom = VelorouteWeb.VariousHelpers.to_string_center_zoom(assigns.map_bounds)
        ~s(/map/___static/#{center_zoom}/1280x720)
      end

    assign(socket, :og_image, make_absolute(url))
  end

  defp make_absolute("/" <> path) do
    if Application.get_env(:veloroute, :env) == :prod do
      Settings.url() <> "/" <> path
    else
      cfg = Application.get_env(:veloroute, VelorouteWeb.Endpoint)
      "http://#{cfg[:url][:host]}:#{cfg[:http][:port]}/#{path}"
    end
  end

  @supported_events_from_url ["map-zoom-to"]
  defp maybe_run_events_from_url(socket, %{event: event} = params)
       when event in @supported_events_from_url do
    {:noreply, socket} = handle_event(event, params, socket)
    socket
  end

  defp maybe_run_events_from_url(socket, %{event: event}) do
    Logger.info("got unsupported URL event: #{event}")
    socket
  end

  defp maybe_run_events_from_url(socket, _params), do: socket
end
