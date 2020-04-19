defmodule VelorouteWeb.FrameLive do
  use Phoenix.LiveView
  require Logger

  def render(assigns) do
    ~L"""

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


    <!--<div class="thermostat">
      <div class="bar <%= @mode %>">
        <a href="#" phx-click="toggle-mode"><%= @mode %></a>
        <span>bla</span>
      </div>
      <div class="controls">
        <span class="reading"><%= @val %></span>
        <button phx-click="dec" class="minus">-</button>
        <button phx-click="inc" class="plus">+</button>
        <span class="weather">
        </span>
      </div>
    </div>-->
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(100, self(), :tick)

    socket =
      socket
      |> assign(val: 72, mode: :cooling, time: NaiveDateTime.local_now())

    {:ok, socket}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign(socket, time: NaiveDateTime.local_now())}
  end

  def handle_event("inc", _, socket) do
    if socket.assigns.val >= 75, do: raise("boom")
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def handle_event("toggle-mode", _, socket) do
    {:noreply,
     update(socket, :mode, fn
       :cooling -> :heating
       :heating -> :cooling
     end)}
  end

  def handle_params(%{"article" => article} = _params, _uri, socket) do
    {:noreply, article |> Data.find_article() |> set_content(socket)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, Data.find_article() |> set_content(socket)}
  end

  defp set_content(%Data.Article{live_html: live_html}, socket) do
    #     defp parse_html(text) do
    #     text
    # |> Floki.find("td.tone_1_pad a")
    # |> Floki.attribute("href")
    # |> Enum.filter(&(String.contains?(&1, "/files/details/")))
    # |> Enum.map(&("https://www.demonoid.ooo" <> &1)
    # end

    assign(socket, :content, live_html)
  end

  defp set_content(_article, socket) do
    Logger.warn("Non-existing site was accessed")

    socket
    # TODO: put_flash doesn't work?
    |> put_flash(:info, "Diese Seite konnte ich leider nicht (mehr?) finden.")
    |> push_patch(to: "/")
  end
end
