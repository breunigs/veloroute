defmodule VelorouteWeb.Live.Map do
  use VelorouteWeb, :live_component
  require Logger

  @default_route_groups Settings.map_layers()
                        |> Enum.filter(fn %Layer{active: a} -> a end)
                        |> Enum.map(fn %Layer{route_group: rg} -> rg end)
                        |> Enum.uniq()

  @default_assigns %{
    styles: Settings.map_styles(),
    layers: Settings.map_layers(),
    server_route_groups: @default_route_groups,
    initial: true,
    highlight_route: nil
  }
  def mount(socket) do
    {:ok, assign(socket, @default_assigns)}
  end

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> filter_styles_by_env()
      |> update_server_route_groups()
      |> reset_layers_on_change()
      |> highlight_route()
      |> maybe_map_preview()
      |> push_changes()

    {:ok, socket}
  end

  defp filter_styles_by_env(%{assigns: %{styles: styles}} = socket) do
    env = Application.get_env(:veloroute, :env)

    styles =
      Enum.filter(styles, fn style ->
        envs = Map.get(style, :only, [env])
        Enum.member?(envs, env)
      end)

    assign(socket, :styles, styles)
  end

  @spec render(%{:styles => any, optional(any) => any}) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    assigns = assign(assigns, %{active_style_id: active_style_id(assigns)})

    ~H"""
    <div role="region" aria-label="Straßenkarte, die ausgewählte Radrouten anzeigt">
      <div phx-update="ignore" phx-ignore-attr="class" id={@id} data-style={@active_style_id}>
        <%= @preview_image %>
      </div>

      <div id="layerSwitcher" role="menu">
        <button title="Routen und Kartenhintergründe auswählen"></button>
        <div class="maplibregl-ctrl-group">
          <%= for layer <- @layers do %>
            <button
              value={layer.name}
              class={"layer #{if layer.active, do: "active"}"}
              aria-checked={if layer.active, do: "true", else: "false"}
              role="menuitemcheckbox"
              phx-target={@myself}
              phx-click={
                Phoenix.LiveView.JS.push("toggle-layer")
                |> Phoenix.LiveView.JS.dispatch("plausible", detail: %{event: "toggleLayer"})
              }><%= layer.name %></button>
          <% end %>

          <%= for style <- @styles do %>
            <button
              value={style.id}
              class={"style #{if style.active, do: "active"}"}
              aria-checked={if style.active, do: "true", else: "false"}
              role="menuitemradio"
              phx-target={@myself}
              phx-click="switch-style"><%= style.name %></button>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("toggle-layer", %{"value" => val}, %{assigns: %{layers: layers}} = socket) do
    layers =
      Enum.map(layers, fn %{name: name, active: active} = layer ->
        %{layer | active: if(name == val, do: !active, else: active)}
      end)

    socket = socket |> assign(:layers, layers) |> push_changes()
    {:noreply, socket}
  end

  def handle_event("switch-style", %{"value" => val}, %{assigns: %{styles: styles}} = socket) do
    styles = Enum.map(styles, fn style -> %{style | active: style.id == val} end)
    socket = socket |> assign(:styles, styles) |> push_changes()
    {:noreply, socket}
  end

  def handle_event("show-routes", %{"name" => selected}, %{assigns: %{layers: layers}} = socket) do
    layers =
      Enum.map(layers, fn %{name: name} = layer ->
        %{layer | active: name == selected}
      end)

    socket = socket |> assign(:layers, layers) |> push_changes()
    {:noreply, socket}
  end

  @push_to_frontend [:layers, :styles, :highlight]
  defp push_changes(%{assigns: assigns} = socket) do
    updates =
      assigns
      |> Enum.filter(fn {key, _val} ->
        key in @push_to_frontend && updated?(socket, key)
      end)
      |> Enum.reduce(%{}, fn {key, val}, updates ->
        Map.put(updates, key, val)
      end)

    # need to reapply the layer selection on style switch
    updates =
      if is_map_key(updates, :styles) && !default_layers?(assigns),
        do: Map.put(updates, :layers, assigns.layers),
        else: updates

    if map_size(updates) > 0,
      do: Phoenix.LiveView.push_event(socket, :map, updates),
      else: socket
  end

  @default_visibility Settings.map_layers()
                      |> Enum.into(%{}, fn %{name: name, active: active} ->
                        {name, active}
                      end)
  defp default_layers?(assigns) do
    Enum.all?(assigns.layers, fn %{name: name, active: active} ->
      @default_visibility[name] == active
    end)
  end

  defp update_server_route_groups(socket) do
    # from displayed video
    track = VelorouteWeb.Live.VideoState.current_track(socket.assigns.video)
    video_art = Article.List.find_exact(track && track.parent_ref)

    route_groups =
      [socket.assigns.current_page, video_art]
      |> Util.compact()
      |> Enum.uniq()
      |> Enum.flat_map(&Article.Decorators.related_route_groups(&1))

    # always show ungrouped layers (i.e. articles)
    route_groups = if route_groups == [], do: @default_route_groups, else: [nil | route_groups]
    route_groups = route_groups |> Enum.uniq() |> Enum.sort()

    Logger.debug("Server side layers: #{inspect(route_groups)}")

    assign(socket, server_route_groups: route_groups)
  end

  defp highlight_route(socket) do
    track = VelorouteWeb.Live.VideoState.current_track(socket.assigns.video)

    if track && track.parent_ref do
      assign(socket, highlight: track.parent_ref.id())
    else
      socket
    end
  end

  defp reset_layers_on_change(socket) do
    if updated?(socket, :server_route_groups) do
      layers =
        Enum.map(socket.assigns.layers, fn ll ->
          %{ll | active: ll.route_group in socket.assigns.server_route_groups}
        end)

      socket
      |> assign(:layers, layers)
    else
      socket
    end
  end

  defp updated?(socket, key) do
    Phoenix.Component.changed?(socket, key) &&
      (!Phoenix.Component.changed?(socket, :initial) ||
         socket.assigns[key] != @default_assigns[key])
  end

  defp active_style_id(%{assigns: assigns}), do: active_style_id(assigns)

  defp active_style_id(%{styles: styles}) do
    %{id: id} = Enum.find(styles, fn %{active: active} -> active end)
    id
  end

  defp maybe_map_preview(%{assigns: %{preview_image: _any}} = socket), do: socket

  defp maybe_map_preview(%{assigns: assigns} = socket) do
    video_route_id = VelorouteWeb.Live.VideoState.route_id(assigns.video)
    cz = VelorouteWeb.VariousHelpers.to_string_center_zoom(assigns.map_bounds)

    assigns = %{
      video_route_id: video_route_id,
      cz: cz,
      sizes: [
        {1600, 1200},
        {1300, 1000},
        {1100, 900},
        {900, 700},
        {700, 700},
        {500, 500}
      ]
    }

    preview_image = ~H"""
    <picture id="mapPreview">
      <%= for {w, h} <- @sizes do %>
        <source
          media={"(min-width: #{w+300}px), (min-height: #{h*1.5}px)"}
          srcset={"/map/___static/#{@cz}/#{w}x#{h}?highlightRoute=#{@video_route_id}"}>
      <% end %>
      <img src={"/map/___static/#{@cz}/500x500?highlightRoute=#{@video_route_id}"} fetchpriority="high">
    </picture>
    """

    assign(socket, :preview_image, preview_image)
  end
end
