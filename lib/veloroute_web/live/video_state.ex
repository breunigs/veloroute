defmodule VelorouteWeb.Live.VideoState do
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
  def update_socket_from_params(%{assigns: assigns} = socket, params) do
    assigns =
      assigns[:video]
      |> Kernel.||(new())
      |> extract_video(params)
      |> extract_start(params)
      |> maybe_reverse_direction(assigns[:video])
      |> for_frontend()

    Phoenix.LiveView.assign(socket, assigns)
  end

  @doc """
  Extracts the video from the article and the start position from the location
  in the params. Currently nothing is done to select the right group from the
  given params.
  """
  def update_from_article(%{assigns: assigns} = socket, article, params) do
    assigns =
      assigns[:video]
      |> Kernel.||(new())
      |> extract_video(article)
      |> extract_start(params)
      |> for_frontend()

    Phoenix.LiveView.assign(socket, assigns)
  end

  def update_from_article(socket, article)
  def update_from_article(socket, nil), do: reset(socket)

  def update_from_article(%{assigns: assigns} = socket, article) do
    prev_state = assigns[:video]

    new_state =
      prev_state
      |> Kernel.||(new())
      |> extract_video(article)

    if video_changes?(prev_state, new_state) do
      IO.puts("video changes!")
      IO.inspect(prev_state)
      IO.inspect(new_state)
      assigns = %{new_state | start: nil} |> for_frontend()
      Phoenix.LiveView.assign(socket, assigns)
    else
      IO.puts("video NOT CHANGED!!")

      socket
    end
  end

  @doc """
  Disables all video related settings on the socket
  """
  def reset(%{assigns: assigns} = socket) do
    IO.puts("resetting")

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

  defp extract_start(%__MODULE__{} = state, params) do
    %{state | start: Geo.Point.from_params(params)}
  end

  defp maybe_reverse_direction(state, prev_state)
  defp maybe_reverse_direction(%__MODULE__{} = state, nil), do: state
  defp maybe_reverse_direction(%__MODULE__{start: nil} = state, _), do: state

  defp maybe_reverse_direction(%__MODULE__{start: start} = state, %__MODULE__{start: start}) do
    reverse_direction(state)
  end

  defp maybe_reverse_direction(%__MODULE__{} = state, _start), do: state

  defp reverse_direction(%__MODULE__{} = state) when is_reversable(state) do
    %{state | direction: if(state.direction == :forward, do: :backward, else: :forward)}
  end

  defp reverse_direction(%__MODULE__{} = state), do: state

  # this variant extracts videos from articles
  defp extract_video(%__MODULE__{} = state, %{tracks: []}), do: state

  defp extract_video(%__MODULE__{} = state, %{tracks: tracks}) when is_list(tracks) do
    %{forward: fws, backward: bws} =
      Enum.group_by(tracks, & &1.direction)
      |> Map.put_new(:forward, [])
      |> Map.put_new(:backward, [])

    fw = List.first(fws)

    bw =
      if fw,
        do: Enum.find(bws, fn track -> track.group == fw.group end),
        else: List.first(bws)

    update_real(state, fw, bw)
  end

  defp extract_video(%__MODULE__{} = state, params) do
    IO.inspect(params)
    state
  end

  defp update_real(state, forward, backward) do
    forward = Video.Rendered.get(forward)
    backward = Video.Rendered.get(backward)

    dir =
      cond do
        state.direction == :forward && forward -> :forward
        state.direction == :backward && backward -> :backward
        forward -> :forward
        backward -> :backward
        true -> :forward
      end

    %{state | forward: forward, backward: backward, direction: dir}
    |> maybe_enable_player()
  end
end
