defmodule VelorouteWeb.Live.VideoState do
  @known_params [
    :forward,
    :backward,
    :start,
    :direction,
    :player_js
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{
          forward: Video.Rendered.t() | nil,
          backward: Video.Rendered.t() | nil,
          start: Geo.Point.t() | nil,
          direction: :forward | :backward,
          player_js: binary() | nil
        }

  @doc """
  Extracts all video related settings from the params hash and updates itself in the assigns, convenience accessors for video and also some shared assigns like lat/lon.
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
  Disables all video related settings on the socket
  """
  def reset(%{assigns: assigns} = socket) do
    assigns =
      assigns[:video]
      |> Kernel.||(new())
      |> Map.merge(%{forward: nil, backward: nil, start: nil})
      |> for_frontend()

    Phoenix.LiveView.assign(socket, assigns)
  end

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
      direction: :forward,
      player_js: nil
    }
  end

  defguardp has_video(state)
            when (state.direction == :forward and not is_nil(state.forward)) or
                   (state.direction == :backward and not is_nil(state.backward))

  defguardp is_reversable(state)
            when not is_nil(state.forward) and not is_nil(state.backward)

  defguard has_video_params(params)
           when is_map_key(params, "video_forward") or is_map_key(params, "video_backward")

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

  defp maybe_reverse_direction(%__MODULE__{} = state, nil), do: state

  defp maybe_reverse_direction(%__MODULE__{start: start} = state, start),
    do: reverse_direction(state)

  defp maybe_reverse_direction(%__MODULE__{start: start} = state, %__MODULE__{start: start}),
    do: reverse_direction(state)

  defp maybe_reverse_direction(%__MODULE__{} = state, _start), do: state

  defp reverse_direction(%__MODULE__{} = state) when is_reversable(state) do
    %{state | direction: if(state.direction == :forward, do: :backward, else: :forward)}
  end

  defp reverse_direction(%__MODULE__{} = state), do: state

  defp extract_video(%__MODULE__{} = state, %{"video_forward" => f, "video_backward" => b})
       when is_binary(f) and is_binary(b) do
    update_real(state, f, b)
  end

  defp extract_video(%__MODULE__{} = state, %{"video_forward" => f}) when is_binary(f) do
    update_real(state, f, nil)
  end

  defp extract_video(%__MODULE__{} = state, %{"video_backward" => b}) when is_binary(b) do
    update_real(state, nil, b)
  end

  # this variant extracts videos from articles
  defp extract_video(%__MODULE__{} = state, %{video_forward: f, video_backward: b}) do
    update_real(state, f, b)
  end

  defp extract_video(%__MODULE__{} = state, _params), do: state

  defp update_real(state, forward, backward) do
    forward = Cache.Videos.get(forward)
    backward = Cache.Videos.get(backward)

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
