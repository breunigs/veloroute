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
    bounds: nil,
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
    socket = socket |> maybe_advance_slideshow
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

  def handle_event("map-click", attr, socket) do
    Logger.debug("map-click #{inspect(attr)}")

    article = Data.ArticleCache.get()[attr["article"]]

    route =
      cond do
        socket.assigns.route |> elem(0) == attr["route"] -> socket.assigns.route
        is_binary(attr["route"]) -> {attr["route"], nil}
        article && is_tuple(article.start_position) -> article.start_position |> elem(0)
        true -> nil
      end

    img =
      with lon when is_float(lon) <- attr["lon"],
           lat when is_float(lon) <- attr["lat"],
           route when not is_nil(route) <- route do
        Logger.debug("Searching for image on #{inspect(route)}, near lon/lat: #{lon}/#{lat}")
        curimg = socket.assigns.img

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

    socket = if article, do: set_content(article, "", socket), else: socket
    socket = if article && !img, do: maybe_update_initial_route(socket, article), else: socket
    socket = set_img(socket, img || article)

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

  def handle_params(%{"article" => name} = _params, uri, socket) do
    Logger.debug("params: article #{name}")

    article = find_article(name)

    socket =
      set_content(article, uri, socket)
      |> maybe_update_initial_route(article)
      |> set_img(article)

    {:noreply, socket}
  end

  def handle_params(%{"page" => name} = _params, uri, socket) do
    Logger.debug("params: page #{name}")

    page = find_article("0000-00-00-#{name}")

    socket =
      set_content(page, uri, socket)
      |> maybe_update_initial_route(page)

    {:noreply, socket}
  end

  def handle_params(params, uri, socket) do
    Logger.debug("params: default (#{inspect(params)})")
    {:noreply, find_article() |> set_content(uri, socket)}
  end

  defp set_content(%Article{name: name, title: t} = art, _uri, socket) do
    title =
      if is_nil(t) or t == "",
        do: Settings.page_title_long(),
        else: Settings.page_title_short() <> t

    assign(socket,
      content: Phoenix.View.render(VelorouteWeb.ArticleView, name, []),
      bounds: Map.get(art, :bbox, socket.assigns.bounds),
      page_title: title
    )
  end

  defp set_content(_article, uri, socket) do
    Logger.error("Non-existing site was accessed: #{uri}")

    socket
    |> put_flash(:info, 404)
    |> push_patch(to: Routes.startpage_path(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive))
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
    |> assign(autoplayed_once: socket.assigns.slideshow || status)
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

  defp maybe_update_initial_route(%{assigns: %{autoplayed_once: true}} = socket, _),
    do: socket

  defp maybe_update_initial_route(socket, %Article{start_position: {route, img}}) do
    Logger.debug("Setting new initial route to #{inspect(route)}")
    assign(socket, route: route, alt_img: img)
  end

  defp maybe_update_initial_route(socket, %Article{tags: [tag | _rest]}),
    do: maybe_update_initial_route(socket, tag)

  defp maybe_update_initial_route(socket, %Article{}),
    do: socket

  defp maybe_update_initial_route(socket, nil), do: socket

  defp maybe_update_initial_route(socket, tag) when is_binary(tag) do
    route = Data.ImageCache.images() |> Data.Image.find_all_routes(tag) |> List.first()

    if route && route != socket.assigns.route,
      do: Logger.debug("Setting new initial route to #{inspect(route)}")

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
  defp set_img(socket, %{img: img}) when is_ref(img), do: set_img(socket, img)

  defp set_img(%{assigns: %{img: img}} = socket, img), do: socket

  defp set_img(socket, img) when is_ref(img) do
    %{route: route, prev: prev, curr: %{lon: lon, lat: lat, bearing: bearing}, next: next} =
      Data.Image.find_surrounding(
        Data.ImageCache.images(),
        [img, get_in(socket.assigns, [:alt_img])],
        route: socket.assigns.route
      )

    Logger.debug("showing: #{img} (route: #{inspect(route)})")

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
    # todo: if article is loaded, use its bbox as default?
    [
      img: Map.get(assigns, :img, Settings.image()),
      lon: Map.get(assigns, :lon),
      lat: Map.get(assigns, :lat),
      bearing: Map.get(assigns, :bearing),
      slideshow: Map.get(assigns, :slideshow, false),
      mly_js: Map.get(assigns, :mly_js, nil),
      bounds: Map.get(assigns, :bounds) |> to_string_bounds
    ]
  end

  defp find_article(), do: find_article(Settings.default_page())
  defp find_article(""), do: find_article(Settings.default_page())
  defp find_article(nil), do: find_article(Settings.default_page())

  defp find_article(name) do
    Logger.debug("Loading article #{name}")
    Data.ArticleCache.get()[name]
  end
end
