defmodule VelorouteWeb.Live.VideoState do
  require Logger

  @known_params [
    :forward,
    :backward,
    :start,
    :direction,
    :group,
    :player_js
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          forward: Video.Rendered.t() | nil,
          backward: Video.Rendered.t() | nil,
          start: Geo.Point.t() | nil,
          group: binary(),
          direction: :forward | :backward,
          player_js: binary() | nil
        }

  @doc """
  Extracts all video related settings from the params hash and updates itself in
  the assigns, convenience accessors for video and also some shared assigns like
  lat/lon.
  """
  def maybe_update_video(%{assigns: assigns} = socket, route, article, params) do
    tracks = extract_tracks(article)
    tracks = if tracks == [], do: extract_tracks(route), else: tracks
    accurate_new_start = Geo.Point.from_params(params)

    old_state = assigns[:video] || new()
    new_state = update_from_tracks(old_state, tracks, accurate_new_start || old_state.start)

    new_state =
      cond do
        # video changed, accept low quality positioning
        video_changes?(old_state, new_state) ->
          start = accurate_new_start || maybe_article_center(article)
          %{new_state | start: start}

        # same position clicked again, reverse
        accurate_new_start && old_state.start == accurate_new_start ->
          %{new_state | start: accurate_new_start}
          |> reverse_direction()

        # same video, but new position
        accurate_new_start ->
          %{new_state | start: accurate_new_start}

        # no changed
        true ->
          old_state
      end

    Phoenix.LiveView.assign(socket, for_frontend(new_state))
  end

  defp extract_tracks(nil), do: []
  defp extract_tracks(%Article{tracks: tracks}) when length(tracks) > 0, do: tracks

  defp extract_tracks(%Article{images: imgs}) when is_number(imgs) or is_binary(imgs),
    do: "#{imgs}" |> route_by_tags() |> extract_tracks()

  defp extract_tracks(%Article{tags: tags}), do: tags |> route_by_tags() |> extract_tracks()
  defp extract_tracks(module) when is_atom(module), do: module.tracks()

  defp route_by_tags(tags) do
    tags
    |> List.wrap()
    |> Route.List.by_tags()
    |> Enum.find(fn route -> length(route.tracks()) > 0 end)
  end

  defp maybe_article_center(%Article{bbox: bbox}), do: Geo.CheapRuler.center(bbox)
  defp maybe_article_center(_), do: nil

  @doc """
  Disables all video related settings on the socket
  """
  def reset(%{assigns: assigns} = socket) do
    Logger.debug("resetting")

    assigns =
      assigns[:video]
      |> Kernel.||(new())
      |> Map.merge(%{forward: nil, backward: nil, start: nil})
      |> for_frontend()

    Phoenix.LiveView.assign(socket, assigns)
  end

  defp video_changes?(old_state, new_state)

  defp video_changes?(%__MODULE__{forward: f, backward: b}, %__MODULE__{forward: f, backward: b}),
    do: false

  defp video_changes?(_old_state, _new_state), do: true

  @doc """
  Reverse a video if possible, using the given coordinate to determine
  where to play the reveresed video from.
  """
  def reverse(%{assigns: %{video: nil}} = socket, _params), do: socket

  def reverse(%{assigns: %{video: video}} = socket, params) do
    assigns =
      video
      |> reverse_direction()
      |> extract_start(params)
      |> for_frontend()

    Phoenix.LiveView.assign(socket, assigns)
  end

  defp new() do
    %__MODULE__{
      forward: nil,
      backward: nil,
      start: nil,
      group: nil,
      direction: :forward,
      player_js: nil
    }
  end

  defguardp has_video(state)
            when (state.direction == :forward and not is_nil(state.forward)) or
                   (state.direction == :backward and not is_nil(state.backward))

  defguardp is_reversable(state)
            when not is_nil(state.forward) and not is_nil(state.backward)

  @spec for_frontend(t()) :: keyword()

  defp for_frontend(%__MODULE__{} = state) when has_video(state) do
    video = if state.direction == :forward, do: state.forward, else: state.backward

    start_from = Video.Rendered.start_from(video, state.start)
    coords = Video.Rendered.coord_io_list(video)

    [
      video: state,
      video_hash: video.hash,
      video_start: start_from.time_offset_ms,
      video_coords: coords,
      video_reversable: is_reversable(state),
      video_player_js: state.player_js,
      lon: start_from.lon,
      lat: start_from.lat,
      bearing: start_from.bearing
    ]
  end

  defp for_frontend(%__MODULE__{} = state) do
    [
      video: state,
      video_hash: "",
      video_start: 0,
      video_coords: '',
      video_reversable: false,
      video_player_js: state.player_js
    ]
  end

  defp maybe_enable_player(%__MODULE__{player_js: nil} = state) when has_video(state) do
    path = VelorouteWeb.Router.Helpers.static_path(VelorouteWeb.Endpoint, "/js/video_player.js")
    %{state | player_js: path}
  end

  defp maybe_enable_player(%__MODULE__{} = state), do: state

  defp extract_start(state, %Article{bbox: bbox}) when is_map(bbox) do
    %{state | start: Geo.CheapRuler.center(bbox)}
  end

  defp extract_start(%__MODULE__{} = state, params) do
    %{state | start: Geo.Point.from_params(params)}
  end

  defp reverse_direction(%__MODULE__{} = state) when is_reversable(state) do
    %{state | direction: if(state.direction == :forward, do: :backward, else: :forward)}
  end

  defp reverse_direction(%__MODULE__{} = state), do: state

  defp update_from_tracks(state, tracks, near_position)
  defp update_from_tracks(state, [], _pos), do: state

  # if we have a position, change the tracks default order by closeness to the position
  defp update_from_tracks(state, tracks, near_position) when is_map(near_position) do
    sorted =
      Enum.sort_by(tracks, fn track ->
        track.rendered_ref.coords()
        |> Geo.CheapRuler.closest_point_on_line(near_position)
        |> Map.fetch!(:dist)
      end)

    update_from_tracks(state, sorted, nil)
  end

  # if no position is given, assume tracks are already sorted by distance
  defp update_from_tracks(state, tracks, nil) do
    closest = hd(tracks)

    reverse =
      Enum.find(tracks, fn track ->
        track.group == closest.group && track.direction == reverse(closest.direction)
      end)

    fw = if(closest.direction == :forward, do: closest, else: reverse)
    bw = if(closest.direction == :forward, do: reverse, else: closest)

    fw = Video.Rendered.get(fw)
    bw = Video.Rendered.get(bw)

    %{state | forward: fw, backward: bw, direction: closest.direction}
    |> maybe_enable_player()
  end

  def reverse(:forward), do: :backward
  def reverse(:backward), do: :forward
end
