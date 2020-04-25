defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  def render(assigns) do
    ~L"""

    <script>
      window.mapbox_access_token = "<%= Credentials.mapbox_access_token %>";
      window.mapillary_api_key = "<%= Credentials.mapillary_api_key %>";
      window.bounds = [<%= Settings.bounds |> Enum.map(&to_string/1) |> Enum.join(",") %>];
      window.startImg = "<%= Settings.image %>";
      window.startZoom = <%= Settings.zoom %>;
      window.startLonLat = [<%= Settings.center.lon %>, <%= Settings.center.lat %>];
    </script>

    <%= render_state(assigns) %>

    <div id="map" phx-update="ignore"></div>
    <div id="mly" phx-update="ignore"></div>

    <div id="sidebar">
      <div id="switcher"><div>↤</div></div>
      <%= live_patch "veloroute.hamburg", to: "/", class: "header" %>
      <%= live_flash(@flash, :info) %>
      <div id="content">
        <%= Phoenix.HTML.raw @content %>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    # if connected?(socket), do: :timer.send_interval(100, self(), :tick)

    socket =
      socket
      |> assign(state())

    {:ok, socket}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign(socket, time: NaiveDateTime.local_now())}
  end

  def handle_event("map-zoom-to", attr, socket) do
    socket =
      socket
      |> update_map(attr)
      |> update_img(attr)

    {:noreply, socket}
  end

  def handle_event("mly-nodechanged", %{"img" => img}, socket) do
    {:noreply, assign(socket, mly_loaded: true, mly_img: img)}
  end

  def handle_params(%{"article" => article} = _params, _uri, socket) do
    {:noreply, article |> Data.find_article() |> set_content(socket)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, Data.find_article() |> set_content(socket)}
  end

  defp set_content(%Data.Article{live_html: live_html}, socket) do
    assign(socket, :content, live_html)
  end

  defp set_content(_article, socket) do
    Logger.warn("Non-existing site was accessed")

    socket
    # TODO: put_flash doesn't work?
    |> put_flash(:info, "Diese Seite konnte ich leider nicht (mehr?) finden.")
    |> push_patch(to: "/")
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
  defp update_img(socket, %{"img" => img}), do: assign(socket, :img, img)
  defp update_img(socket, _), do: socket

  defp render_state(assigns) do
    data =
      [
        mapbox_access_token: Credentials.mapbox_access_token(),
        mapillary_api_key: Credentials.mapillary_api_key(),
        bounds: Settings.bounds() |> Enum.map(&to_string/1) |> Enum.join(",")
      ] ++ state(assigns)

    IO.inspect(data)

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
      img: Map.get(assigns, :img, s.image()),
      zoom: Map.get(assigns, :zoom, s.zoom()),
      lon: Map.get(assigns, :lon, s.center().lon),
      lat: Map.get(assigns, :lat, s.center().lat),
      route: Map.get(assigns, :lat, s.route())
    ]
  end
end
