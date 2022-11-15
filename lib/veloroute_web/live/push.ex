defmodule VelorouteWeb.Live.Push do
  use VelorouteWeb, :live_component

  alias Phoenix.LiveView.JS

  def render(assigns) when not is_map_key(assigns, :test_status) do
    assigns = assign(assigns, :test_status, nil)
    render(assigns)
  end

  def render(%{supported: false} = assigns) do
    wrapper(assigns, "⛔ Browser unterstützt keine Benachrichtigungen", [:retry])
  end

  def render(%{permission: "denied"} = assigns) do
    wrapper(
      assigns,
      "Browser verbietet Benachrichtigungen. Prüfe Deine Einstellungen und erlaube #{settings_host()}.",
      [:retry]
    )
  end

  def render(%{permission: "granted", subscription: %{}} = assigns) do
    wrapper(assigns, " ✅ aktiviert", [:unsubscribe, :test_link])
  end

  def render(%{subscription: nil} = assigns) do
    wrapper(assigns, "ausgeschaltet", [:enroll])
  end

  def render(assigns) do
    wrapper(
      assigns,
      "Prüfe Status…",
      []
    )
  end

  def handle_event(
        "status",
        %{"supported" => sup, "permission" => perm, "subscription" => sub},
        socket
      )
      when is_boolean(sup) and is_binary(perm) do
    sub = sub |> Push.Subscription.new() |> Push.Subscription.ensure_or_nil()

    {:noreply,
     assign(socket, %{
       supported: sup,
       permission: perm,
       subscription: sub,
       test_status: nil
     })}
  end

  @test_notification_ttl_seconds 1 * 60
  def handle_event("test-notification", _params, %{assigns: %{subscription: sub}} = socket)
      when is_map(sub) do
    socket = assign(socket, :test_timestamp, :os.system_time(:seconds))

    send_test_notification(socket)

    msg = "Der Server versucht eine Test-Benachrichtigung zu verschicken."
    socket = assign(socket, :test_status, {:sending, msg})
    {:noreply, socket}
  end

  def handle_event(
        "test-notification-reply",
        %{"test_timestamp" => x},
        %{assigns: %{test_timestamp: x}} = socket
      ) do
    socket =
      assign(
        socket,
        :test_status,
        {:received, "Dein Gerät hat die Test-Benachrichtigung empfangen und angezeigt."}
      )

    {:noreply, socket}
  end

  def handle_event("test-notification-reply", %{"test_timestamp" => _x}, socket) do
    # i.e. we received a non-matching timestamp
    {:noreply, socket}
  end

  def handle_event("unsubscribe", _params, %{assigns: %{subscription: sub}} = socket) do
    with {:error, reason} <- Push.Subscription.delete(sub) do
      IO.puts(:stderr, "Failed to delete #{Push.Subscription.ident(sub)}: #{inspect(reason)}")
    end

    socket =
      socket
      |> assign(:subscription, nil)
      |> assign(:test_status, nil)
      |> Phoenix.LiveView.push_event("push:unsubscribe", %{})

    {:noreply, socket}
  end

  def handle_event(event, params, socket) do
    IO.puts("push event #{event}: unknown param configuration.")
    IO.puts("Params:")
    IO.inspect(params)
    IO.puts("Assigns:")
    IO.inspect(socket.assigns)
    {:noreply, socket}
  end

  defp send_test_notification(socket)

  defp send_test_notification(%{assigns: assigns}) do
    pid = self()

    Task.start(fn ->
      noti = %Push.Notification{
        title: "Test-Benachrichtigung von #{Settings.feed_author()}",
        body: "Du kannst die Benachrichtigungen jederzeit wieder abbestellen:",
        url: assigns.self_url,
        extra: %{report: %{test_timestamp: assigns.test_timestamp}},
        ttl_seconds: @test_notification_ttl_seconds
      }

      test_status =
        case Push.Subscription.send(assigns.subscription, noti, false) do
          {:ok, _resp} ->
            {:sent,
             "Der Server hat die Test-Benachrichtigung verschickt. Sie sollte in Kürze auf Deinem Gerät angezeigt werden."}

          {:error, reason} ->
            {:error, "Der Server konnte die Test-Benachrichtigung nicht verschicken: #{reason}"}
        end

      send_update(pid, __MODULE__, id: assigns.id, test_status: test_status)
    end)
  end

  defp wrapper(assigns, status, actions) do
    assigns =
      assigns
      |> update_test_status()
      |> assign(:status, status)
      |> assign(:actions, actions)
      |> assign(:public_key, Push.Subscription.public_key())

    ~H"""
    <div
      id={@id}
      phx-hook="LazyLoadJS"
      data-lazy-load-js="/assets/push_client.js"
      data-lazy-load-callback="pushInit"
      data-service-worker-url="/assets/push_service_worker.js"
      phx-target={@myself}
    >
      <div><img src="/images/bell.svg"/> Push-Benachrichtigungen: <%= @status %></div>
      <%= for action <- @actions do %>
        <div class="push-action" :if={action == :test_link}>
          <a
            phx-click={JS.dispatch("push:test")}
            phx-throttle="3000"
            phx-target={@myself}
            class={@test_link_class}
          >Vorschau / Testen</a>
          <span title={elem(@test_status, 1)} :if={@test_icon} style="cursor: help"><%= @test_icon %></span>
        </div>

        <div class="push-action" :if={action == :enroll}>
          <a
            phx-click={JS.dispatch("push:enroll", detail: %{public_key: @public_key})}
            phx-throttle="1000"
          >
            Aktivieren?
          </a>
        </div>

        <div class="push-action" :if={action == :retry}>
          <a phx-click={
            JS.dispatch("push:status")
            |> JS.transition("disabled", time: 1000)
            } phx-throttle="1000">
            Nochmal versuchen?
          </a>
        </div>

        <div class="push-action" :if={action == :unsubscribe}>
          <a
            phx-click={JS.push("unsubscribe", target: @myself) |> JS.dispatch("push:unsubscribe")}
            phx-throttle="1000"
          >
            Abbestellen?
          </a>
        </div>
      <% end %>
    </div>
    """
  end

  defp update_test_status(assigns) do
    {icon, link_class} =
      case assigns.test_status do
        {:sending, _} -> {"⌛", "disabled"}
        {:sent, _} -> {"⌛", "disabled"}
        {:received, _} -> {"✓", nil}
        {:error, _} -> {"⚠", nil}
        nil -> {nil, nil}
      end

    assigns
    |> assign(:test_icon, icon)
    |> assign(:test_link_class, link_class)
  end

  defp settings_host(), do: URI.parse(Settings.url()).host
end
