defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  alias VelorouteWeb.Router.Helpers, as: Routes
  import VelorouteWeb.VariousHelpers

  import Guards

  alias Article

  @initial_state [
    render_target: :html,
    autoplay: false,
    prev_page: nil,
    current_page: nil,
    bounds: struct(Geo.BoundingBox, Settings.initial()),
    bounds_ts: nil,
    map_bounds: nil,
    article_date: nil,
    article_title: nil,
    article_summary: nil,
    search_query: nil,
    search_bounds: nil,
    lon: nil,
    lat: nil,
    bearing: nil,
    tmp_last_article_set: nil,
    visible_types: []
  ]

  def initial_state, do: @initial_state

  def mount(params, _session, socket) do
    socket =
      socket
      |> assign(@initial_state)
      |> VelorouteWeb.Live.VideoState.maybe_update_video(nil, params)
      |> determine_visible_route_groups(nil)

    {:ok, socket}
  end

  def handle_info(:check_updates, socket) do
    socket = socket |> update_url_query
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
      |> update_map(attr)
      |> VelorouteWeb.Live.VideoState.maybe_update_video(article, attr)
      |> determine_visible_route_groups(article)

    {:noreply, socket}
  end

  def handle_event("map-bounds", %{"bounds" => bounds}, socket) do
    Process.send_after(self(), :check_updates, 100)
    {:noreply, assign(socket, :map_bounds, bounds)}
  end

  def handle_event("map-bounds", _attr, socket), do: {:noreply, socket}

  @search_page "suche"
  def handle_event("search", %{"value" => query}, socket) do
    query = if query && query != "", do: String.trim(query), else: socket.assigns.search_query
    search_article = Article.List.find_exact(@search_page)

    socket =
      socket
      |> assign(:search_query, query || "")
      |> assign(:search_bounds, socket.assigns[:map_bounds])

    socket = push_patch(socket, to: article_path(socket, search_article))

    {:noreply, socket}
  end

  def handle_event("video-reverse", attr, socket) do
    Logger.debug("video-reverse #{inspect(attr)}")

    {:noreply, VelorouteWeb.Live.VideoState.reverse(socket, attr)}
  end

  @deprecated "removed from FE, should not be used after a while"
  def handle_event("video-pause", attr, socket) do
    Logger.debug("video-pause #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr, seek: false)
     |> update_url_query()}
  end

  def handle_event("video-current-time", attr, socket) do
    Logger.debug("video-current-time #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr, seek: false)
     |> update_url_query()}
  end

  def handle_event("video-fatal-hls", attr, socket) do
    Logger.debug("video-fatal-hls #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr, seek: false)
     |> assign(:autoplay, true)
     |> update_url_query()}
  end

  def handle_event("video-autoplayed", attr, socket) do
    Logger.debug("video-autoplayed #{inspect(attr)}")

    {:noreply, assign(socket, :autoplay, false)}
  end

  def handle_event("map-click", attr, socket) do
    Logger.debug("map-click #{inspect(attr)}")

    # if we have an article use that, but ignore the default article (i.e. the
    # startpage) when we have a route
    article = find_article(attr["article"])
    route = if attr["article"] && article, do: article, else: find_article(attr["route"])
    # if we don't have an article, switch to the route only if the current page is unrelated
    current = socket.assigns.current_page
    article = article || if route && !Article.List.related?(current, route), do: route

    socket =
      socket
      |> VelorouteWeb.Live.VideoState.maybe_update_video(route, attr)
      |> determine_visible_route_groups(route)

    socket = if article, do: push_patch(socket, to: article_path(socket, article)), else: socket

    {:noreply, socket}
  end

  def handle_event("convert-hash", %{"hash" => hash}, socket) do
    Logger.debug("converting hash #{hash}")
    parts = String.split(hash, "/", parts: 4)

    socket =
      if length(parts) >= 3,
        do:
          update_map(socket, %{
            "lat" => Enum.at(parts, 1),
            "lon" => Enum.at(parts, 2),
            "zoom" => Enum.at(parts, 0)
          }),
        else: socket

    {:noreply, socket}
  end

  def handle_event(ident, attr, socket) do
    msg = "Received unknown/unparsable event '#{ident}': #{inspect(attr)}"
    Logger.warn(msg)

    {:noreply, socket}
  end

  def handle_params(params, uri, socket) when is_binary(uri) do
    socket = assign(socket, :current_url, uri)
    handle_params(params, nil, socket)
  end

  def handle_params(%{"not_found" => "true"}, nil, socket), do: {:noreply, render_404(socket)}

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
          |> VelorouteWeb.Live.VideoState.maybe_update_video(article, params)
          |> determine_visible_route_groups(article)
          |> assign(:autoplay, params["autoplay"] == "true")

    socket =
      set_content(article, socket)
      |> set_bounds(article, Map.get(params, "bounds"))
      |> assign(:tmp_last_article_set, article)

    {:noreply, socket}
  end

  def handle_params(%{"page" => @search_page, "search_query" => query} = params, nil, socket) do
    params
    |> Map.put("article", @search_page)
    |> handle_params(nil, assign(socket, :search_query, query))
  end

  def handle_params(%{"page" => name} = params, nil, socket) do
    params
    |> Map.put("article", name)
    |> handle_params(nil, socket)
  end

  # i.e. there's a path we didn't recognize yet, so it must be a 404.
  def handle_params(%{"path" => list}, nil, socket) when is_list(list),
    do: {:noreply, render_404(socket)}

  def handle_params(params, nil, socket) do
    Logger.debug("params: default (#{inspect(params)})")

    params
    |> Map.put("article", find_article(nil))
    |> handle_params(nil, socket)
  end

  defp set_content(art, %{assigns: %{current_page: art}} = socket) when is_module(art) do
    assign(socket, prev_page: art)
  end

  defp set_content(art, socket) when is_module(art) do
    full_title = Article.Decorators.full_title(art)

    page_title =
      if full_title == "",
        do: Settings.page_title_long(),
        else: Settings.page_title_short() <> full_title

    socket
    |> assign(
      prev_page: socket.assigns.current_page,
      current_page: art,
      page_title: page_title,
      article_date: art.updated_at(),
      article_title: full_title,
      article_summary: art.summary()
    )
    |> determine_visible_route_groups(art)
  end

  defp set_content(_article, socket), do: render_404(socket)

  defp render_404(socket) do
    Logger.error("Non-existing site was accessed: #{socket.assigns.current_url}")

    url =
      Routes.startpage_path(
        VelorouteWeb.Endpoint,
        VelorouteWeb.FrameLive,
        url_query(socket)
      )

    socket
    |> put_flash(:info, 404)
    |> push_patch(to: url)
  end

  defp set_bounds(socket, article, bounds_param)

  defp set_bounds(%{assigns: %{map_bounds: nil}} = socket, article, bounds_param)
       when is_binary(bounds_param) do
    parsed = Geo.BoundingBox.parse(bounds_param)

    if parsed != nil,
      do: assign(socket, bounds: parsed) |> set_bounds_ts,
      else: set_bounds(socket, article, nil)
  end

  defp set_bounds(
         %{assigns: %{prev_page: art}} = socket,
         art,
         _bounds_param
       ) do
    socket
  end

  defp set_bounds(socket, art, _bounds_param) when is_module(art) do
    prev_bbox = socket.assigns.map_bounds
    next_bbox = Article.Decorators.bbox(art)

    cond do
      is_nil(next_bbox) ->
        socket

      is_nil(prev_bbox) ->
        assign(socket, bounds: next_bbox) |> set_bounds_ts

      is_nil(art.id()) ->
        assign(socket, bounds: next_bbox) |> set_bounds_ts

      # i.e. if we have a "route article", zoom only in, but not out
      Geo.CheapRuler.inside_bbox?(next_bbox, Geo.BoundingBox.parse(prev_bbox)) ->
        assign(socket, bounds: next_bbox) |> set_bounds_ts

      true ->
        socket
    end
  end

  defp set_bounds(socket, _article, _bounds_param) do
    socket
  end

  defp set_bounds_ts(socket) do
    assign(socket, bounds_ts: "#{:os.system_time(:second)}")
  end

  defp update_map(socket, %{"lat" => lat, "lon" => lon, "zoom" => zoom}) do
    with {lat, ""} <- Float.parse(lat),
         {lon, ""} <- Float.parse(lon),
         {zoom, ""} <- Float.parse(zoom) do
      socket
      |> assign(bounds: Geo.CheapRuler.center_zoom_to_bounds(%{lon: lon, lat: lat, zoom: zoom}))
      |> set_bounds_ts
    else
      _ -> socket
    end
  end

  defp update_map(socket, %{"bounds" => bounds}) do
    parsed = Geo.BoundingBox.parse(bounds)

    if parsed != nil,
      do: assign(socket, bounds: parsed) |> set_bounds_ts,
      else: socket
  end

  defp update_map(socket, _), do: socket

  defp find_article(nil), do: nil

  defp find_article(name) when is_binary(name) or is_module(name) do
    Article.List.find_exact(name)
  end

  defp find_article(%{assigns: %{current_page: name}}) do
    Article.List.find_exact(name)
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
    bounds = to_string_bounds(assigns.map_bounds || assigns.bounds)
    query = %{"video" => assigns.video_hash, "pos" => assigns.video_start, "bounds" => bounds}

    if blank?(assigns.search_query) do
      Map.delete(query, "search_query")
    else
      Map.put(query, "search_query", assigns.search_query)
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

  defp determine_visible_route_groups(socket, article) do
    # from displayed video
    track = VelorouteWeb.Live.VideoState.current_track(socket.assigns.video)
    parent_ref = track && track.parent_ref
    show = if is_module(parent_ref), do: [parent_ref.route_group()], else: []

    # from the given article (e.g. as ref on links) or the displayed one
    from_articles =
      [article, find_article(socket), find_article(parent_ref)]
      |> Util.compact()
      |> Enum.uniq()
      |> Enum.flat_map(&Article.Decorators.related_route_groups(&1))

    show = from_articles ++ show

    # defaults
    show = if show == [], do: [:alltag], else: show

    assign(socket, visible_types: Enum.uniq(show))
  end
end
