defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  alias VelorouteWeb.Router.Helpers, as: Routes
  import VelorouteWeb.VariousHelpers

  alias Data.Article
  import Mapillary, only: [is_ref: 1]

  @initial_state [
    mly_previous_img: nil,
    autoplayed_once: false,
    mly_loaded: false,
    img_next: nil,
    img_prev: nil,
    img_next_disabled: "",
    img_prev_disabled: "",
    prev_page: nil,
    current_page: nil,
    bounds: struct(BoundingBox, Settings.initial()),
    bounds_ts: nil,
    slideshow: false,
    map_bounds: nil,
    sequence: nil,
    article_date: nil,
    article_title: nil,
    search_query: nil,
    search_bounds: nil,
    route: Settings.route(),
    img: Settings.image(),
    lon: nil,
    lat: nil,
    bearing: nil,
    sequence: nil,
    mly_js: nil
  ]

  def initial_state, do: @initial_state

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(5_000, self(), :check_updates)
    {:ok, assign(socket, @initial_state)}
  end

  def handle_info(:check_updates, socket) do
    socket = socket |> update_url_query
    {:noreply, socket}
  end

  def handle_event("map-zoom-to", attr, socket) do
    Logger.debug("map-zoom-to: #{inspect(attr)}")

    socket =
      socket
      |> slideshow(false)
      |> update_map(attr)
      |> update_img(attr)

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
      if socket.assigns.current_page == @search_page_full do
        update_url_query(socket)
      else
        socket = assign(socket, :current_page, @search_page_full)
        url_query = url_query(socket)
        path = Routes.page_path(socket, VelorouteWeb.FrameLive, @search_page, url_query)
        push_patch(socket, to: path)
      end

    {:noreply, socket}
  end

  def handle_event("map-click", attr, %{assigns: assigns} = socket) do
    Logger.debug("map-click #{inspect(attr)}")

    article = Data.ArticleCache.get()[attr["article"]]

    route =
      cond do
        assigns.route && elem(assigns.route, 0) == attr["route"] -> assigns.route
        is_binary(attr["route"]) -> {attr["route"], nil}
        article && is_tuple(article.start_position) -> article.start_position |> elem(0)
        true -> nil
      end

    {route, img} =
      with lon when is_float(lon) <- attr["lon"],
           lat when is_float(lat) <- attr["lat"],
           zoom when is_number(zoom) <- attr["zoom"],
           route when not is_nil(route) <- route do
        Logger.debug("Searching for image on #{inspect(route)}, near lon/lat: #{lon}/#{lat}")
        curimg = assigns.img

        zoom = zoom |> max(1) |> min(18)

        Data.ImageCache.images(route_id: elem(route, 0))
        |> Data.Image.find_around_point(
          %{lat: lat, lon: lon},
          route: route,
          max_dist: 100 * CheapRuler.meters_per_pixel(zoom)
        )
        |> case do
          # none
          [] -> {nil, nil}
          # i.e. reverse on double click
          [{r, _d, %{img: ^curimg}}, {_, _, img} | _rest] -> {r, img}
          # prefer from same route, unless it's the same
          [_ignore, {^route, _d, %{img: ref} = img} | _rest] when ref != curimg -> {route, img}
          [_ign, _, {^route, _d, %{img: ref} = img} | _rest] when ref != curimg -> {route, img}
          [_, _, _, {^route, _d, %{img: ref} = img} | _rest] when ref != curimg -> {route, img}
          # take closest
          other -> List.first(other) |> Tuple.delete_at(1)
        end
      else
        err ->
          Logger.debug(
            "Failed to parse map click params:" <>
              "\nroute=#{inspect(route)}" <>
              "\nattr=#{inspect(attr)}" <>
              "\nerr=#{inspect(err)}"
          )

          {nil, nil}
      end

    img =
      if article && article.start_image && assigns.current_page != article.name,
        do: %{img: article.start_image},
        else: img

    socket =
      cond do
        article ->
          socket |> slideshow(false) |> push_patch(to: article_path(socket, article, img))

        img ->
          socket |> slideshow(false) |> assign(route: route) |> set_img(img)

        true ->
          socket
      end

    {:noreply, socket |> load_mly}
  end

  def handle_event(
        "mly-nodechanged",
        %{"img" => img, "routePlaying" => true},
        %{assigns: %{slideshow: true}} = socket
      ) do
    Logger.debug("mly-nodechanged to #{img} during slideshow, taking it")

    socket =
      socket
      |> assign(mly_loaded: true)
      |> set_img(img)
      |> slideshow(:maybe_stop)

    {:noreply, socket}
  end

  def handle_event("mly-nodechanged", _params, socket),
    do: {:noreply, assign(socket, mly_loaded: true)}

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

    socket =
      if length(parts) >= 4,
        do: set_img(socket, parts |> Enum.at(3) |> String.slice(0..21)),
        else: socket

    {:noreply, socket}
  end

  def handle_event("sld-step-backward", %{} = _attr, %{assigns: %{img_prev: nil}} = socket),
    do: {:noreply, socket}

  def handle_event("sld-step-backward", %{} = _attr, %{assigns: %{img_prev: img}} = socket),
    do: {:noreply, socket |> slideshow(false) |> load_mly |> set_img(img)}

  def handle_event("sld-step-forward", %{} = _attr, %{assigns: %{img_next: nil}} = socket),
    do: {:noreply, socket}

  def handle_event("sld-step-forward", %{} = _attr, %{assigns: %{img_next: img}} = socket),
    do: {:noreply, socket |> slideshow(false) |> load_mly |> set_img(img)}

  def handle_event("sld-playpause", %{} = _attr, socket) do
    Logger.debug("sld-playpause")

    {:noreply, slideshow(socket, :toggle) |> load_mly}
  end

  def handle_event("sld-autoplay", attr, socket) do
    Logger.debug("sld-autoplay")

    socket =
      socket
      |> maybe_update_initial_route(Map.get(attr, "route", nil))
      |> maybe_autoplay()

    {:noreply, socket}
  end

  def handle_event("sld-reverse", %{} = _attr, socket) do
    Logger.debug("sld-reverse")

    img =
      Data.ImageCache.images(route_id: socket.assigns.route |> elem(0))
      |> Data.Image.find_reverse(socket.assigns.img, route: socket.assigns.route)

    socket =
      socket
      |> slideshow(false)
      |> load_mly
      |> set_img(img || socket.assigns.img)

    {:noreply, socket}
  end

  def handle_event(ident, attr, socket) do
    Logger.warn("Received unknown/unparsable event '#{ident}': #{inspect(attr)}")

    {:noreply, socket}
  end

  def handle_params(params, uri, socket) when is_binary(uri) do
    socket = assign(socket, :current_url, uri)
    handle_params(params, nil, socket)
  end

  def handle_params(%{"img" => img} = params, nil, socket)
      when is_binary(img) and byte_size(img) != 22 do
    img = String.slice(img, 0..21)

    params =
      if is_ref(img),
        do: Map.put(params, "img", img),
        else: Map.delete(params, "img")

    handle_params(params, nil, socket)
  end

  def handle_params(%{"not_found" => "true"}, nil, socket), do: {:noreply, render_404(socket)}

  def handle_params(%{"article" => name, "subdir" => subdir} = params, nil, socket)
      when is_binary(subdir) and subdir != "" do
    name =
      cond do
        String.match?(name, ~r{^\d\d\d\d-\d\d-\d\d-}) -> Path.join(subdir, name)
        true -> Path.join(subdir, "0000-00-00-" <> name)
      end

    params
    |> Map.delete("subdir")
    |> Map.put("article", name)
    |> handle_params(nil, socket)
  end

  def handle_params(%{"article" => name} = params, nil, socket) do
    Logger.debug("article: #{name} (#{inspect(params)})")

    article = find_article(name)

    socket =
      set_content(article, socket)
      |> maybe_update_initial_route(article)
      |> set_img(Map.get(params, "img", article))
      |> set_bounds(article, Map.get(params, "bounds"))

    {:noreply, socket}
  end

  def handle_params(%{"page" => @search_page, "search_query" => query} = params, nil, socket) do
    params
    |> Map.put("article", @search_page_full)
    |> handle_params(nil, assign(socket, :search_query, query))
  end

  def handle_params(%{"page" => name} = params, nil, socket) do
    params
    |> Map.put("article", "0000-00-00-#{name}")
    |> handle_params(nil, socket)
  end

  # i.e. there's a path we didn't recognize yet, so it must be a 404.
  def handle_params(%{"path" => list}, nil, socket) when is_list(list),
    do: {:noreply, render_404(socket)}

  def handle_params(params, nil, socket) do
    Logger.debug("params: default (#{inspect(params)})")

    params
    |> Map.put("article", Settings.default_page())
    |> handle_params(nil, socket)
  end

  defp set_content(%Article{name: name}, %{assigns: %{current_page: name}} = socket) do
    assign(socket, prev_page: name)
  end

  defp set_content(%Article{name: name, title: t, date: date}, socket) do
    title =
      if is_nil(t) or t == "",
        do: Settings.page_title_long(),
        else: Settings.page_title_short() <> t

    assign(socket,
      prev_page: socket.assigns.current_page,
      current_page: name,
      page_title: title,
      article_date: date,
      article_title: t
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
      |> assign(bounds: CheapRuler.center_zoom_to_bounds(%{lon: lon, lat: lat, zoom: zoom}))
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

  # todo: auto detect route if missing?
  defp update_img(socket, %{"img" => img}), do: set_img(socket, img)
  defp update_img(socket, _), do: socket

  defp slideshow(socket, :toggle), do: slideshow(socket, !socket.assigns.slideshow)

  defp slideshow(%{assigns: %{img_next: nil}} = socket, :maybe_stop), do: slideshow(socket, false)
  defp slideshow(socket, :maybe_stop), do: socket

  defp slideshow(socket, true) do
    socket = maybe_replace_start_image(socket)

    Logger.debug(
      "slideshow: starting from route=#{inspect(socket.assigns.route)} img=#{socket.assigns.img}"
    )

    seq_str =
      Data.Image.sequence_from(
        Data.ImageCache.images(),
        socket.assigns.img,
        route: socket.assigns.route
      )
      |> sequences_to_scalar

    socket
    |> assign(sequence: seq_str)
    |> assign(slideshow: true)
    |> assign(autoplayed_once: true)
    |> load_mly
  end

  defp slideshow(socket, false) do
    Logger.debug("slideshow: stop")

    socket
    |> assign(slideshow: false)
    |> assign(sequence: nil)
  end

  defp sequences_to_scalar(nil), do: nil

  defp sequences_to_scalar(seqs) when is_list(seqs) do
    Enum.map(seqs, fn %{seq: seq, from: from, to: to} ->
      "#{seq} #{from} #{to}"
    end)
    |> Enum.join(" ")
  end

  @default_image Settings.image()
  defp maybe_replace_start_image(%{assigns: %{img: @default_image}} = socket) do
    route = socket.assigns.route || Settings.route()
    Logger.debug("slideshow: replacing default image (current route: #{inspect(route)})")

    [%{img: img} | _] = Data.ImageCache.images([route])[route]

    socket
    |> assign(route: route)
    |> set_img(img)
  end

  defp maybe_replace_start_image(socket), do: socket

  defp maybe_autoplay(%{assigns: %{autoplayed_once: true}} = socket), do: socket
  defp maybe_autoplay(%{assigns: %{slideshow: true}} = socket), do: socket
  defp maybe_autoplay(socket), do: slideshow(socket, true)

  defp maybe_update_initial_route(socket, taglike)

  defp maybe_update_initial_route(%{assigns: %{mly_js: m}} = socket, _) when is_binary(m),
    do: socket

  defp maybe_update_initial_route(%{assigns: %{slideshow: true}} = socket, _),
    do: socket

  defp maybe_update_initial_route(socket, %Article{start_position: {route, _img}}) do
    Logger.debug("Setting new initial route to #{inspect(route)} (case 1)")
    assign(socket, route: route)
  end

  defp maybe_update_initial_route(socket, %Article{tags: [tag | _rest]}),
    do: maybe_update_initial_route(socket, tag)

  defp maybe_update_initial_route(socket, %Article{}),
    do: socket

  defp maybe_update_initial_route(socket, nil), do: socket

  defp maybe_update_initial_route(socket, tag) when is_binary(tag) do
    route = Data.ImageCache.images() |> Data.Image.find_all_routes(tag) |> List.first()

    if route && route != socket.assigns.route,
      do: Logger.debug("Setting new initial route to #{inspect(route)} (case 2)")

    assign(socket, route: route || socket.assigns.route)
  end

  defp load_mly(%{assigns: %{mly_js: nil}} = socket) do
    Logger.debug("loading mly")
    path = Routes.static_path(VelorouteWeb.Endpoint, "/js/mly.js")
    assign(socket, mly_js: path)
  end

  defp load_mly(socket), do: socket

  defp set_img(socket, ""), do: socket
  defp set_img(socket, nil), do: socket

  defp set_img(socket, %Article{start_image: img}) when is_ref(img), do: set_img(socket, img)
  defp set_img(socket, %Article{}), do: socket
  defp set_img(socket, %{img: img}) when is_ref(img), do: set_img(socket, img)

  defp set_img(%{assigns: %{img: img}} = socket, img), do: socket

  defp set_img(socket, img) when is_ref(img) do
    alt_img =
      case find_article(socket) do
        %Article{start_position: {_, img}} -> img
        _ -> nil
      end

    %{route: route, prev: prev, curr: curr, next: next} =
      Data.Image.find_surrounding(
        Data.ImageCache.images(),
        [img, alt_img],
        route: socket.assigns.route
      )

    %{lon: lon, lat: lat, bearing: bearing} = curr || socket.assigns

    Logger.debug("showing: #{img} (route: #{inspect(route)}, curr: #{inspect(curr)})")

    assign(socket,
      img: img,
      lon: lon,
      lat: lat,
      bearing: bearing,
      img_next: get_in(next, [:img]),
      img_prev: get_in(prev, [:img]),
      route: route,
      img_load_start: Time.utc_now()
    )
    |> update_img_navigate_buttons()
  end

  defp update_img_navigate_buttons(socket) do
    assign(socket,
      img_next_disabled: if(is_nil(socket.assigns.img_next), do: "disabled"),
      img_prev_disabled: if(is_nil(socket.assigns.img_prev), do: "disabled")
    )
  end

  defp find_article(""), do: find_article(Settings.default_page())
  defp find_article(nil), do: find_article(Settings.default_page())

  defp find_article(name) when is_binary(name) do
    Data.ArticleCache.get()[name]
  end

  defp find_article(%{assigns: %{current_page: name}}) do
    Data.ArticleCache.get()[name]
  end

  defp article_path(socket, %Article{start_image: img} = art, nil) do
    article_path(socket, art, %{img: img})
  end

  defp article_path(socket, %Article{name: name}, %{img: img}) do
    query = assign(socket, img: img) |> url_query()
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
    query = %{"img" => assigns.img, "bounds" => bounds}

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
end
