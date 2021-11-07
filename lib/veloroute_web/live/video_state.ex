defmodule VelorouteWeb.Live.VideoState do
  require Logger
  import Guards

  @known_params [
    :forward,
    :forward_track,
    :backward,
    :backward_track,
    :start,
    :start_generation,
    :direction
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          forward: Video.Rendered.t() | nil,
          backward: Video.Rendered.t() | nil,
          forward_track: Video.Track.t() | nil,
          backward_track: Video.Track.t() | nil,
          start: Geo.Point.like() | nil,
          start_generation: integer(),
          direction: :forward | :backward
        }

  import Video.Track, only: [valid_hash: 1]

  @doc """
  Extracts all video related settings from the params hash and updates itself in
  the assigns, convenience accessors for video and also some shared assigns like
  lat/lon.
  """
  def maybe_update_video(socket, article, %{"video" => hash} = params)
      when valid_hash(hash) do
    with rendered when not is_nil(rendered) <- Video.Rendered.get(hash),
         src when is_list(src) <- rendered.sources(),
         obj when not is_nil(obj) <- Article.List.find_by_sources(src) do
      # sort so that the desired track is on top
      tracks = obj.tracks |> Enum.sort_by(fn t -> t.videos() != src end)

      state = socket.assigns[:video] || new()
      state = update_from_tracks(state, tracks, nil)

      socket
      |> Phoenix.LiveView.assign(for_frontend(state))
      |> set_position(params)
    else
      _ -> maybe_update_video(socket, article, Map.delete(params, "video"))
    end
  end

  def maybe_update_video(%{assigns: assigns} = socket, article, params) do
    old_state = assigns[:video] || new()
    accurate_new_start = Geo.Point.from_params(params)

    tracks =
      if is_module(article),
        do: Article.Decorators.article_with_tracks(article).tracks(),
        else: []

    new_state =
      old_state
      |> update_direction_from_params(params)
      |> update_from_tracks(tracks, accurate_new_start || old_state.start)

    new_state =
      cond do
        accurate_new_start && old_state.start == accurate_new_start &&
          !video_changes?(old_state, new_state) && !is_map_key(params, "dir") ->
          Logger.debug("same position clicked again, reverse")

          set_start(new_state, accurate_new_start)
          |> reverse_direction()

        accurate_new_start ->
          Logger.debug("have new accurate position; updating")

          set_start(new_state, accurate_new_start)

        article && article.tracks() != [] ->
          Logger.debug("have article with tracks, trying to start from article bbox")
          set_start(new_state, nil)

        # if there's an article only update the position if the article is
        # related to the shown route. This is usually the case if an article has
        # tagged the related route
        article && current_track(new_state) &&
            Util.overlap?(current_track(new_state).parent_ref.tags(), article.tags()) ->
          Logger.debug("route is related to current article, updating position")
          set_start(new_state, maybe_article_center(article) || old_state.start)

        true ->
          Logger.debug("no position information, not changing")
          new_state
      end

    Phoenix.LiveView.assign(socket, for_frontend(new_state))
  end

  @spec current_track(t()) :: Video.Track.t() | nil
  def current_track(%__MODULE__{direction: :forward, forward_track: fw}), do: fw
  def current_track(%__MODULE__{direction: :backward, backward_track: bw}), do: bw

  @spec current_rendered(t()) :: Video.Rendered.t() | nil
  def current_rendered(%__MODULE__{direction: :forward, forward: fw}), do: fw
  def current_rendered(%__MODULE__{direction: :backward, backward: bw}), do: bw

  defp maybe_article_center(art) when is_module(art) do
    if Article.has_category?(art, "Blog") do
      Article.Decorators.geo_center(art)
    end
  end

  @doc """
  Disables all video related settings on the socket
  """
  def reset(%{assigns: assigns} = socket) do
    Logger.debug("resetting")

    assigns =
      assigns[:video]
      |> Kernel.||(new())
      |> Map.merge(%{forward: nil, backward: nil})
      |> set_start(nil)
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

  def reverse(%{assigns: %{video: state}} = socket, params) do
    assigns =
      state
      |> reverse_direction()
      |> extract_start(params)
      |> for_frontend()

    Phoenix.LiveView.assign(socket, assigns)
  end

  @doc """
  Set the current video position from the given time in milliseconds in the
  "pos" param.
  """
  def set_position(%{assigns: %{video: state}} = socket, params) do
    with pos <- parse_integer(params["pos"]),
         rendered <- current_rendered(state),
         true <- 0 <= pos && pos <= rendered.length_ms do
      # no idea why the Map.take is needed, but otherwise Dialyzer complains
      point = Video.Rendered.start_from(rendered, pos) |> Map.take([:lat, :lon])

      assigns = state |> set_start(point) |> for_frontend()
      Phoenix.LiveView.assign(socket, assigns)
    else
      _ ->
        Logger.debug("failed to set pos from params: #{inspect(params)}")
        socket
    end
  end

  defp parse_integer(num) when is_integer(num), do: num

  defp parse_integer(num) when is_binary(num) do
    with {num, ""} <- Integer.parse(num) do
      num
    else
      _ -> nil
    end
  end

  defp new() do
    sett = Settings.start_image()
    default_tracks = Article.List.find_exact(sett.article_id).tracks()

    %__MODULE__{
      forward_track: nil,
      backward_track: nil,
      forward: nil,
      backward: nil,
      start: sett.position,
      start_generation: 0,
      direction: sett.direction
    }
    |> update_from_tracks(default_tracks, sett.position)
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

    Logger.debug("video=#{video.hash}, starting from #{start_from.time_offset_ms}")

    [
      video: state,
      video_hash: video.hash,
      video_start: start_from.time_offset_ms,
      video_start_gen: state.start_generation,
      video_coords: coords,
      video_reversable: is_reversable(state),
      video_poster: video_poster(video, start_from),
      lon: start_from.lon,
      lat: start_from.lat,
      bearing: start_from.bearing
    ]
  end

  defp for_frontend(%__MODULE__{} = state) do
    Logger.debug("no video loaded, resetting FE state")

    [
      video: state,
      video_hash: "",
      video_start: 0,
      video_start_gen: state.start_generation,
      video_poster: nil,
      video_coords: '',
      video_reversable: false
    ]
  end

  @spec video_poster(Video.Rendered.t(), %{
          :time_offset_ms => integer(),
          optional(atom()) => any()
        }) :: binary()
  defp video_poster(video, start_from) do
    VelorouteWeb.Router.Helpers.image_extract_path(
      VelorouteWeb.Endpoint,
      :image,
      video.hash,
      start_from.time_offset_ms
    )
  end

  defp extract_start(state, art) when is_module(art) do
    set_start(state, Geo.CheapRuler.center(art.bbox()))
  end

  defp extract_start(%__MODULE__{} = state, params) do
    set_start(state, Geo.Point.from_params(params))
  end

  @spec set_start(t(), Geo.Point.like() | nil) :: t()
  defp set_start(%__MODULE__{} = state, start) do
    %{state | start: start, start_generation: state.start_generation + 1}
  end

  defp reverse_direction(%__MODULE__{} = state) when is_reversable(state) do
    %{state | direction: if(state.direction == :forward, do: :backward, else: :forward)}
  end

  defp reverse_direction(%__MODULE__{} = state), do: state

  defp update_from_tracks(state, tracks, near_position)
  defp update_from_tracks(state, [], _pos), do: state

  # Due to slight inaccuracies when clicking, users might reverse the track all the time when
  # in practice they just wanted to skip aloung the route. Therefore we slightly prefer tracks
  # in th the current direction.
  @same_direction_bonus_in_meters 15

  # if we have a position, change the tracks default order by closeness to the position
  defp update_from_tracks(state, tracks, near_position) when is_map(near_position) do
    sorted =
      Enum.sort_by(tracks, fn track ->
        rendered = Video.Rendered.get(track)

        if is_nil(rendered) do
          10_000_000
        else
          dist =
            rendered.coords()
            |> Geo.CheapRuler.closest_point_on_line(near_position)
            |> Map.fetch!(:dist)

          if track.direction == state.direction,
            do: dist - @same_direction_bonus_in_meters,
            else: dist
        end
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

    fw_track = if(closest.direction == :forward, do: closest, else: reverse)
    bw_track = if(closest.direction == :forward, do: reverse, else: closest)

    fw_ren = Video.Rendered.get(fw_track)
    bw_ren = Video.Rendered.get(bw_track)

    %{
      state
      | forward_track: if(fw_ren, do: fw_track),
        forward: fw_ren,
        backward_track: if(bw_ren, do: bw_track),
        backward: bw_ren,
        direction: closest.direction
    }
    |> maybe_fix_direction()
  end

  defp update_direction_from_params(state, %{"dir" => dir})
       when dir in ["forward", "backward"] do
    %{state | direction: String.to_existing_atom(dir)}
  end

  defp update_direction_from_params(state, _params), do: state

  defp maybe_fix_direction(state) when not has_video(state) and is_reversable(state),
    do: reverse_direction(state)

  defp maybe_fix_direction(state), do: state

  def reverse(:forward), do: :backward
  def reverse(:backward), do: :forward
end
