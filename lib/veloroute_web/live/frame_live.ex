defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  alias VelorouteWeb.Router.Helpers, as: Routes
  import VelorouteWeb.VariousHelpers

  import Guards

  alias Article

  @initial_state [
    type: :html,
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
    ping: nil,
    bearing: nil,
    tmp_last_article_set: nil,
    visible_types: []
  ]

  @default_page Article.List.find_exact("")

  # how long to wait before the ping indicator should be cleared. There's an
  # additional CSS transition happening after.
  @hide_ping_after_ms 5 * 1000

  def initial_state, do: @initial_state

  def mount(params, _session, socket) do
    socket =
      socket
      |> assign(@initial_state)
      |> VelorouteWeb.Live.VideoState.maybe_update_video(nil, nil, params)
      |> determine_visible_types(nil, nil)

    {:ok, socket}
  end

  def handle_info(:check_updates, socket) do
    socket = socket |> update_url_query
    {:noreply, socket}
  end

  def handle_info(:clear_ping, socket) do
    ping =
      if socket.assigns[:ping] &&
           Time.diff(Time.utc_now(), socket.assigns.ping[:clear_after], :millisecond) >=
             @hide_ping_after_ms,
         do: nil,
         else: socket.assigns[:ping]

    {:noreply, assign(socket, :ping, ping)}
  end

  def handle_info(other, socket) do
    Sentry.capture_message("got unexpected info for: #{inspect(other)} at #{inspect(socket)}")
    {:noreply, socket}
  end

  def handle_event("map-zoom-to", attr, socket) do
    Logger.debug("map-zoom-to: #{inspect(attr)}")

    route = Route.from_id(attr["route"])
    article = find_article(attr["article"])

    socket =
      socket
      |> update_map(attr)
      |> update_ping(attr)
      |> VelorouteWeb.Live.VideoState.maybe_update_video(route, article, attr)
      |> determine_visible_types(route, article)

    {:noreply, socket}
  end

  def handle_event("map-bounds", %{"bounds" => bounds}, socket) do
    Process.send_after(self(), :check_updates, 100)
    {:noreply, assign(socket, :map_bounds, bounds)}
  end

  def handle_event("map-bounds", _attr, socket), do: {:noreply, socket}

  @search_page "suche"
  @search_page_full "0000-00-00-#{@search_page}"
  def handle_event("search", %{"value" => query}, socket) do
    query = if query && query != "", do: String.trim(query), else: socket.assigns.search_query

    socket =
      socket
      |> assign(:search_query, query || "")
      |> assign(:search_bounds, socket.assigns[:map_bounds])

    socket =
      if on_search_page?(socket) do
        update_url_query(socket)
      else
        socket = assign(socket, :current_page, @search_page_full)
        url_query = url_query(socket)
        path = Routes.page_path(socket, VelorouteWeb.FrameLive, @search_page, url_query)
        push_patch(socket, to: path)
      end

    {:noreply, socket}
  end

  def handle_event("video-reverse", attr, socket) do
    Logger.debug("video-reverse #{inspect(attr)}")

    {:noreply, VelorouteWeb.Live.VideoState.reverse(socket, attr)}
  end

  def handle_event("video-pause", attr, socket) do
    Logger.debug("video-pause #{inspect(attr)}")

    {:noreply,
     socket
     |> VelorouteWeb.Live.VideoState.set_position(attr)
     |> update_url_query()}
  end

  def handle_event("video-autoplayed", attr, socket) do
    Logger.debug("video-autoplayed #{inspect(attr)}")

    {:noreply, assign(socket, :autoplay, false)}
  end

  def handle_event("map-click", attr, socket) do
    Logger.debug("map-click #{inspect(attr)}")

    article = find_article(attr["article"])
    route = Route.from_id(attr["route"])

    socket =
      socket
      |> VelorouteWeb.Live.VideoState.maybe_update_video(route, article, attr)
      |> determine_visible_types(route, article)

    socket =
      if(article) do
        Logger.debug("article")
        push_patch(socket, to: article_path(socket, article))
      else
        socket
      end

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

  def handle_event("sld-autoplay", %{"route" => route}, socket) do
    Logger.debug("sld-autoplay #{route}")
    route = Route.from_id(route)
    start_from = (route.tracks() |> Enum.find(fn %{direction: dir} -> dir == :forward end)).from

    socket =
      if route do
        socket
        |> VelorouteWeb.Live.VideoState.reset()
        |> VelorouteWeb.Live.VideoState.maybe_update_video(route, nil, start_from)
        |> determine_visible_types(route, nil)
        |> assign(:autoplay, true)
      else
        socket
      end

    {:noreply, socket}
  end

  def handle_event(ident, attr, socket) do
    msg = "Received unknown/unparsable event '#{ident}': #{inspect(attr)}"
    Logger.warn(msg)
    Sentry.capture_message(msg)

    {:noreply, socket}
  end

  def handle_params(params, uri, socket) when is_binary(uri) do
    socket = assign(socket, :current_url, uri)
    handle_params(params, nil, socket)
  end

  def handle_params(%{"not_found" => "true"}, nil, socket), do: {:noreply, render_404(socket)}

  def handle_params(%{"article" => name, "subdir" => subdir} = params, nil, socket)
      when is_binary(subdir) and subdir != "" do
    # name =
    #   cond do
    #     String.match?(name, ~r{^\d\d\d\d-\d\d-\d\d-}) -> Path.join(subdir, name)
    #     true -> Path.join(subdir, "0000-00-00-" <> name)
    #   end

    params
    |> Map.delete("subdir")
    |> Map.put("article", "#{subdir}/#{name}")
    |> handle_params(nil, socket)
  end

  def handle_params(%{"article" => name} = params, nil, socket) do
    Logger.debug("article: #{name} (#{inspect(params)})")

    prev_article = socket.assigns.tmp_last_article_set
    article = find_article(name)

    # temporarily only update videos if the article changed. Otherwise
    # it will always switch back to the video when viewing another route
    # that doesn't have a video yet
    socket =
      if article == prev_article,
        do: socket,
        else:
          socket
          |> VelorouteWeb.Live.VideoState.maybe_update_video(nil, article, params)
          |> determine_visible_types(nil, article)

    socket =
      set_content(article, socket)
      |> set_bounds(article, Map.get(params, "bounds"))
      |> assign(:tmp_last_article_set, article)

    {:noreply, socket}
  end

  def handle_params(%{"page" => @search_page, "search_query" => query} = params, nil, socket) do
    params
    |> Map.put("article", @search_page_full)
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
    |> Map.put("article", @default_page)
    |> handle_params(nil, socket)
  end

  defp set_content(art, %{assigns: %{current_page: art}} = socket) when is_module(art) do
    assign(socket, prev_page: art)
  end

  defp set_content(art, socket) when is_module(art) do
    full_title = Article.Dectorators.full_title(art)

    page_title =
      if full_title == "",
        do: Settings.page_title_long(),
        else: Settings.page_title_short() <> full_title

    assign(socket,
      prev_page: socket.assigns.current_page,
      current_page: art,
      page_title: page_title,
      article_date: art.updated_at(),
      article_title: full_title,
      article_summary: art.summary()
    )
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
    parsed = parse_bounds(bounds_param)

    if parsed != nil,
      do: assign(socket, bounds: parsed) |> set_bounds_ts,
      else: set_bounds(socket, article, nil)
  end

  defp set_bounds(
         %{assigns: %{prev_page: name}} = socket,
         %Article{name: name},
         _bounds_param
       ) do
    socket
  end

  defp set_bounds(socket, %Article{bbox: bbox}, _bounds_param) when is_map(bbox) do
    assign(socket, bounds: bbox) |> set_bounds_ts
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
    parsed = parse_bounds(bounds)

    if parsed != nil,
      do: assign(socket, bounds: parsed) |> set_bounds_ts,
      else: socket
  end

  defp update_map(socket, _), do: socket

  defp update_ping(socket, %{"ping-lat" => lat, "ping-lon" => lon}) do
    with {lat, ""} <- Float.parse(lat),
         {lon, ""} <- Float.parse(lon) do
      Process.send_after(self(), :clear_ping, @hide_ping_after_ms)
      assign(socket, ping: %{lon: lon, lat: lat, clear_after: Time.utc_now()})
    else
      _ -> socket
    end
  end

  defp update_ping(socket, _), do: socket

  defp find_article(nil), do: find_article("")

  defp find_article(name) when is_binary(name) or is_module(name) do
    Article.List.find_exact(name)
  end

  defp find_article(%{assigns: %{current_page: name}}) do
    Article.List.find_exact(name)
  end

  defp article_path(socket, %Article{name: "0000-00-00-" <> name}) do
    query = url_query(socket)
    Routes.page_path(socket, VelorouteWeb.FrameLive, name, query)
  end

  defp article_path(socket, %Article{name: name}) do
    query = url_query(socket)
    Routes.article_path(socket, VelorouteWeb.FrameLive, name, query)
  end

  defp update_url_query(%{assigns: assigns} = socket) do
    %{path: path, query: prev_query} = URI.parse(assigns.current_url)
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

  defp on_search_page?(socket) do
    socket.assigns.current_page == @search_page_full
  end

  defp url_query(%{assigns: assigns} = socket) do
    bounds = to_string_bounds(assigns.map_bounds || assigns.bounds)
    query = %{"video" => assigns.video_hash, "pos" => assigns.video_start, "bounds" => bounds}

    if on_search_page?(socket) && !blank?(assigns.search_query) do
      Map.put(query, "search_query", assigns.search_query)
    else
      Map.delete(query, "search_query")
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

  defp determine_visible_types(socket, route, article) do
    track = VelorouteWeb.Live.VideoState.current_track(socket.assigns.video)
    parent_ref = track && track.parent_ref

    article = article || find_article(socket) || find_article(parent_ref)

    show = if route, do: [route.type()], else: []
    show = if is_module(parent_ref), do: [parent_ref.type() | show], else: []

    show =
      if article,
        do: show ++ Enum.map(Article.related_routes(article), & &1.type()),
        else: show

    show =
      if show == [] do
        [:alltag]
      else
        show
      end

    assign(socket, visible_types: Enum.uniq(show))
  end
end
