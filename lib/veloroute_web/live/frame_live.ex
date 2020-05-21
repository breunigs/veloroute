defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  alias VelorouteWeb.Router.Helpers, as: Routes
  import VelorouteWeb.VariousHelpers

  alias Data.Article
  import Mapillary, only: [is_ref: 1]

  @slideshow_interval_ms 500

  @initial_state [
    mly_previous_img: nil,
    autoplayed_once: false,
    mly_loaded: false,
    img_next: nil,
    img_prev: nil,
    prev_page: nil,
    current_page: nil,
    bounds: nil,
    map_bounds: nil,
    route: Settings.route()
  ]

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(5_000, self(), :check_updates)

    socket =
      socket
      |> assign(@initial_state)
      |> assign(state())

    {:ok, socket}
  end

  def handle_info(:check_updates, socket) do
    socket = socket |> maybe_advance_slideshow |> update_url_query
    {:noreply, socket}
  end

  def handle_event("map-zoom-to", attr, socket) do
    Logger.debug("map-zoom-to")

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

    img =
      with lon when is_float(lon) <- attr["lon"],
           lat when is_float(lon) <- attr["lat"],
           route when not is_nil(route) <- route do
        Logger.debug("Searching for image on #{inspect(route)}, near lon/lat: #{lon}/#{lat}")
        curimg = assigns.img

        Data.ImageCache.images()
        |> Data.Image.find_around_point(
          %{lat: lat, lon: lon},
          route: route,
          max_dist: 100
        )
        |> case do
          # none
          [] -> nil
          # i.e. reverse on double click
          [{_r, _d, %{img: ^curimg}}, {_, _, img} | _rest] -> img
          # prefer from same route, unless it's the same
          [_______, {^route, _d, %{img: ref} = img} | _rest] when ref != curimg -> img
          [____, _, {^route, _d, %{img: ref} = img} | _rest] when ref != curimg -> img
          [_, _, _, {^route, _d, %{img: ref} = img} | _rest] when ref != curimg -> img
          # take closest
          other -> List.first(other) |> elem(2)
        end
      end

    socket =
      cond do
        article -> socket |> push_patch(to: article_path(socket, article, img))
        img -> socket |> set_img(img)
        true -> socket
      end

    {:noreply, socket |> load_mly}
  end

  # ignore double events for the same image
  def handle_event(
        "mly-nodechanged",
        %{"img" => desired},
        %{assigns: %{mly_previous_img: prev}} = socket
      )
      when prev == desired do
    Logger.debug("mly-nodechanged double event img=#{prev}")
    {:noreply, socket}
  end

  def handle_event("mly-nodechanged", %{"img" => img}, socket) do
    Logger.debug("mly-nodechanged to #{img}")

    socket =
      socket
      |> assign(mly_loaded: true, mly_previous_img: img)
      |> assign(img_load_last: Time.utc_now())
      |> slideshow_schedule_next_img

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

    socket =
      if length(parts) >= 4,
        do: set_img(socket, Enum.at(parts, 3)),
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
      Data.ImageCache.images()
      |> Data.Image.find_reverse(socket.assigns.img, route: socket.assigns.route)

    socket =
      socket
      |> slideshow(false)
      |> load_mly
      |> set_img(img || socket.assigns.img)

    {:noreply, socket}
  end

  def handle_params(params, uri, socket) when is_binary(uri) do
    socket = assign(socket, :current_url, uri)
    handle_params(params, nil, socket)
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

  def handle_params(%{"page" => name} = params, nil, socket) do
    params
    |> Map.put("article", "0000-00-00-#{name}")
    |> handle_params(nil, socket)
  end

  def handle_params(params, nil, socket) do
    Logger.debug("params: default (#{inspect(params)})")

    params
    |> Map.put("article", Settings.default_page())
    |> handle_params(nil, socket)
  end

  defp set_content(%Article{name: name}, %{assigns: %{current_page: name}} = socket) do
    assign(socket, prev_page: name)
  end

  defp set_content(%Article{name: name, title: t}, socket) do
    title =
      if is_nil(t) or t == "",
        do: Settings.page_title_long(),
        else: Settings.page_title_short() <> t

    assign(socket,
      prev_page: socket.assigns.current_page,
      current_page: name,
      page_title: title
    )
  end

  defp set_content(_article, socket) do
    Logger.error("Non-existing site was accessed: #{socket.assigns.current_url}")

    socket
    |> put_flash(:info, 404)
    |> push_patch(to: Routes.startpage_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive))
  end

  defp set_bounds(socket, article, bounds_param)

  defp set_bounds(%{assigns: %{map_bounds: nil}} = socket, article, bounds_param)
       when is_binary(bounds_param) do
    parsed = parse_bounds(bounds_param)

    if parsed != nil,
      do: assign(socket, bounds: parsed),
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
    assign(socket, bounds: bbox)
  end

  defp set_bounds(socket, _article, _bounds_param) do
    socket
  end

  defp update_map(socket, %{"lat" => lat, "lon" => lon, "zoom" => zoom}) do
    with {lat, ""} <- Float.parse(lat),
         {lon, ""} <- Float.parse(lon),
         {zoom, ""} <- Float.parse(zoom) do
      assign(socket, bounds: CheapRuler.center_zoom_to_bounds(%{lon: lon, lat: lat, zoom: zoom}))
    else
      _ -> socket
    end
  end

  defp update_map(socket, _), do: socket

  # todo: auto detect route if missing?
  defp update_img(socket, %{"img" => img}), do: set_img(socket, img)
  defp update_img(socket, _), do: socket

  defp slideshow(socket, :toggle), do: slideshow(socket, !socket.assigns.slideshow)

  defp slideshow(socket, status) when is_boolean(status) do
    Logger.debug("slideshow: setting state to #{status}")

    socket
    |> assign(slideshow: status)
    |> assign(autoplayed_once: socket.assigns.autoplayed_once || status)
    |> maybe_advance_slideshow
  end

  @default_image Settings.image()
  defp maybe_advance_slideshow(%{assigns: %{slideshow: true, img: @default_image}} = socket) do
    Logger.debug("slideshow: replacing default image")
    route = socket.assigns.route

    [%{img: img} | _] = Data.ImageCache.images()[route]

    socket
    |> assign(:route, route)
    |> set_img(img)
  end

  defp maybe_advance_slideshow(%{assigns: %{slideshow: false}} = socket), do: socket
  defp maybe_advance_slideshow(%{assigns: %{mly_loaded: false}} = socket), do: socket

  defp maybe_advance_slideshow(%{assigns: %{mly_previous_img: prev, img: curr}} = socket)
       when prev != curr,
       do: socket

  defp maybe_advance_slideshow(%{assigns: %{img_load_last: %Time{}}} = socket) do
    if slideshow_next_img_in(socket) == 0 do
      case socket.assigns do
        %{img_next: nil} ->
          Logger.debug("slideshow: no more images")
          slideshow(socket, false)

        %{img_next: img} ->
          Logger.debug("slideshow: advancing to #{img}")
          set_img(socket, img)
      end
    else
      socket
    end
  end

  defp maybe_advance_slideshow(socket) do
    Logger.warn(":img_load_last not set in state, even though mly was loaded")
    assign(socket, :img_load_last, Time.utc_now())
  end

  defp slideshow_next_img_in(%{assigns: %{img_load_last: %Time{} = t}} = socket) do
    diff = Time.diff(Time.utc_now(), t, :millisecond)
    max(@slideshow_interval_ms - diff - slideshow_image_load_latency(socket), 0)
  end

  defp slideshow_next_img_in(_socket), do: nil

  defp slideshow_schedule_next_img(socket) do
    remain = slideshow_next_img_in(socket)
    if remain != nil, do: Process.send_after(self(), :check_updates, remain)
    socket
  end

  defp slideshow_image_load_latency(%{
         assigns: %{img_load_start: %Time{} = start, img_load_last: %Time{} = finish}
       }) do
    lag = Time.diff(finish, start, :millisecond)
    Logger.debug("img load time is #{lag}ms")
    max(lag, 0)
  end

  defp slideshow_image_load_latency(_socket), do: 0

  defp maybe_autoplay(%{assigns: %{autoplayed_once: true}} = socket), do: socket
  defp maybe_autoplay(%{assigns: %{slideshow: true}} = socket), do: socket
  defp maybe_autoplay(socket), do: slideshow(socket, true) |> load_mly

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
  end

  defp render_state(assigns) do
    Phoenix.HTML.Tag.content_tag(:div, "",
      id: "control",
      "phx-hook": "control",
      data: state(assigns)
    )
  end

  def state(assigns \\ %{}) do
    [
      img: Map.get(assigns, :img, Settings.image()),
      lon: Map.get(assigns, :lon),
      lat: Map.get(assigns, :lat),
      bearing: Map.get(assigns, :bearing),
      slideshow: Map.get(assigns, :slideshow, false),
      mly_js: Map.get(assigns, :mly_js, nil),
      bounds: Map.get(assigns, :bounds, Settings.initial()) |> to_string_bounds
    ]
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
    # IO.puts(path)
    # IO.puts(prev_query)

    query = url_query(socket)

    if prev_query != nil && URI.decode_query(prev_query) == query,
      do: socket,
      else:
        push_patch(socket,
          to: path <> "?" <> URI.encode_query(query),
          replace: true
        )
  end

  defp url_query(%{assigns: assigns}) do
    bounds = to_string_bounds(assigns.map_bounds || assigns.bounds)
    %{"img" => assigns.img, "bounds" => bounds}
  end
end
