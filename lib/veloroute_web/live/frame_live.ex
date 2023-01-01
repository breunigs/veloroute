defmodule VelorouteWeb.FrameLive do
  use VelorouteWeb, :live_view

  require Logger

  alias VelorouteWeb.Router.Helpers, as: Routes
  import VelorouteWeb.VariousHelpers

  import Guards

  alias Article

  @default_bounds struct(Geo.BoundingBox, Settings.initial())
  @initial_state [
    render_target: :html,
    prev_page: nil,
    current_page: nil,
    map_bounds: @default_bounds,
    article_original_date: nil,
    article_date: nil,
    article_title: nil,
    article_summary: nil,
    search_query: nil,
    search_bounds: nil,
    tmp_last_article_set: nil
  ]

  def initial_state, do: @initial_state

  def mount(_params, _session, socket) do
    {:ok, assign(socket, @initial_state)}
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
      |> update_map_bounds(attr)
      |> VelorouteWeb.Live.VideoState.maybe_update_video(article, attr)

    {:noreply, socket}
  end

  def handle_event("map-bounds", %{"bounds" => bounds}, socket) do
    Process.send_after(self(), :check_updates, 100)
    {:noreply, assign(socket, :map_bounds, bounds)}
  end

  def handle_event("map-bounds", _attr, socket), do: {:noreply, socket}

  def handle_event("search", %{"value" => ""}, socket) do
    {:noreply, socket}
  end

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
     |> autoplay()
     |> update_url_query()}
  end

  def handle_event("map-click", attr, socket) do
    # if we have an article use that, but ignore the default article (i.e. the
    # startpage) when we have a route
    article = find_article(attr["article"])
    route = if attr["article"] && article, do: article, else: find_article(attr["route"])
    # if we don't have an article, switch to the route only if the current page is unrelated
    current = socket.assigns.current_page
    article = article || if route && !Article.List.related?(current, route), do: route

    socket = VelorouteWeb.Live.VideoState.maybe_update_video(socket, route, attr)

    socket =
      if article,
        do: push_patch(socket, to: article_path(socket, article)),
        else: update_url_query(socket)

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
          |> update_map_bounds(params)
          |> VelorouteWeb.Live.VideoState.maybe_update_video(article, params)
          |> maybe_autoplay(params["autoplay"] == "true")

    socket =
      socket
      |> set_content(article)
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
      page_title: page_title,
      article_original_date: art.created_at(),
      article_date: art.updated_at(),
      article_title: if(full_title == "", do: page_title, else: full_title),
      article_summary: art.summary()
    )
  end

  defp set_content(socket, _article), do: render_404(socket)

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

  defp update_map_bounds(socket, bounds) when is_struct(bounds, Geo.BoundingBox) do
    socket
    |> push_event("bounds:adjust", bounds)
    |> assign(map_bounds: bounds)
  end

  defp update_map_bounds(socket, %{"bounds" => bounds}) do
    update_map_bounds(socket, Geo.BoundingBox.parse(bounds))
  end

  defp update_map_bounds(socket, %{}), do: socket
  defp update_map_bounds(socket, nil), do: socket

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
    bounds = to_string_bounds(assigns[:map_bounds])
    query = %{"video" => assigns[:video_hash], "pos" => assigns[:video_start], "bounds" => bounds}

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
end
