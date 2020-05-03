defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  alias VelorouteWeb.Router.Helpers, as: Routes
  import VelorouteWeb.VariousHelpers

  @slideshow_interval_ms 500

  @initial_state [mly_previous_img: nil, mly_loaded: false, img_next: nil, img_prev: nil]

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(10_000, self(), :check_updates)

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
    do: {:noreply, socket |> slideshow(false) |> set_img(img)}

  def handle_event("sld-step-forward", %{} = _attr, %{assigns: %{img_next: nil}} = socket),
    do: {:noreply, socket}

  def handle_event("sld-step-forward", %{} = _attr, %{assigns: %{img_next: img}} = socket),
    do: {:noreply, socket |> slideshow(false) |> set_img(img)}

  def handle_event("sld-playpause", %{} = _attr, socket) do
    Logger.debug("sld-playpause")

    {:noreply, slideshow(socket, :toggle)}
  end

  def handle_event("sld-reverse", %{} = _attr, socket) do
    Logger.debug("sld-reverse")

    %{img: img} =
      Data.images()
      |> Data.Image.find_reverse(socket.assigns.img, route: socket.assigns.route)

    socket =
      socket
      |> slideshow(false)
      |> set_img(img || socket.assigns.img)

    {:noreply, socket}
  end

  def handle_params(%{"article" => article} = _params, _uri, socket) do
    Logger.debug("params: article")

    {:noreply, article |> Data.find_article() |> set_content(socket)}
  end

  def handle_params(_params, _uri, socket) do
    Logger.debug("params: default")
    {:noreply, Data.find_article() |> set_content(socket)}
  end

  defp set_content(%Data.Article{live_html: live_html, title: t}, socket)
       when is_nil(t) or t == "" do
    assign(socket,
      content: replace_custom_tags(live_html),
      page_title: Settings.page_title()
    )
  end

  defp set_content(%Data.Article{live_html: live_html, title: title}, socket) do
    assign(socket,
      content: replace_custom_tags(live_html),
      page_title: title <> " · " <> Settings.page_title()
    )
  end

  defp set_content(_article, socket) do
    Logger.warn("Non-existing site was accessed")

    # TODO: error message?
    socket
    |> put_flash(:info, "Diese Seite konnte ich leider nicht (mehr?) finden.")
    |> assign(page_title: nil)
  end

  defp update_map(socket, %{"lat" => lat, "lon" => lon, "zoom" => zoom}) do
    with {lat, ""} <- Float.parse(lat),
         {lon, ""} <- Float.parse(lon),
         {zoom, ""} <- Float.parse(zoom) do
      assign(socket, lat: lat, lon: lon, zoom: zoom)
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
    |> maybe_advance_slideshow
  end

  @default_image Settings.image()
  defp maybe_advance_slideshow(%{assigns: %{slideshow: true, img: @default_image}} = socket) do
    Logger.debug("slideshow: replacing default image")
    [%{img: img} | _] = Data.images()[Settings.route()]

    set_img(socket, img)
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
          slideshow(socket, slideshow: false)

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

  defp set_img(%{assigns: %{mly_js: nil}} = socket, img) do
    path = Routes.static_path(VelorouteWeb.Endpoint, "/js/mly.js")
    socket = assign(socket, mly_js: path)
    set_img(socket, img)
  end

  defp set_img(%{assigns: %{img: img}} = socket, img), do: socket
  defp set_img(socket, ""), do: socket

  defp set_img(socket, img) do
    Logger.debug("showing: #{img}")

    %{route: route, prev: prev, next: next} =
      Data.Image.find_surrounding(Data.images(), img, route: socket.assigns.route)

    assign(socket,
      img: img,
      img_next: get_in(next, [:img]),
      img_prev: get_in(prev, [:img]),
      route: route,
      img_load_start: Time.utc_now()
    )
  end

  @static_assigns [
    mapbox_access_token: Credentials.mapbox_access_token(),
    mapillary_api_key: Credentials.mapillary_api_key(),
    bounds: Settings.bounds() |> Enum.map(&to_string/1) |> Enum.join(",")
  ]
  defp render_state(assigns) do
    data = @static_assigns ++ state(assigns)

    Phoenix.HTML.Tag.content_tag(:div, "",
      id: "control",
      "phx-hook": "control",
      data: data
    )
  end

  def state(assigns \\ %{}) do
    # todo: if article is loaded, use its bbox as default?
    s = Settings

    [
      img: Map.get(assigns, :img, start_image()),
      zoom: Map.get(assigns, :zoom, s.zoom()),
      lon: Map.get(assigns, :lon, s.center().lon),
      lat: Map.get(assigns, :lat, s.center().lat),
      route: Map.get(assigns, :lat, s.route()),
      slideshow: Map.get(assigns, :slideshow, false),
      mly_js: Map.get(assigns, :mly_js, nil)
    ]
  end

  defp start_image() do
    # TODO: read from url/hash?
    Settings.image()
  end

  defp replace_custom_tags(source) do
    replace_custom_tag(source, "recent_articles", fn _m ->
      VelorouteWeb.VariousHelpers.recent_articles() |> Phoenix.HTML.safe_to_string()
    end)
  end

  defp replace_custom_tag(source, name, fill) do
    source
    |> String.replace("<#{name}></#{name}>", fill, global: false)
    |> String.replace("<#{name}/>", fill, global: false)
  end
end
