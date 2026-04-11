defmodule Video.Rendered do
  # TODO ideally this would be the type of a class implementing the behaviour
  @type t() :: module()

  @type polyline() :: %{polyline: binary(), interval: float(), precision: pos_integer()}
  @type vanity :: binary()

  @callback name() :: binary()
  @callback hash() :: binary()
  @callback length_ms() :: integer()
  @callback sources() :: Video.Track.plain()
  @callback timed_polyline() :: binary()
  @callback recording_dates() :: Video.Track.timed_info()
  @callback street_names() :: Video.Track.timed_info()
  @callback rendered?() :: boolean()
  @callback renderer() :: pos_integer()
  @callback bbox() :: Geo.BoundingBox.t()

  @timed_precision 6

  @doc """
  Binary length of the abbreviated hash used for vanity names
  """
  @vanity_id_length 5
  def vanity_id_length, do: @vanity_id_length

  @doc """
  Returns the vanity ID for this video
  """
  @spec vanity(t()) :: vanity()
  def vanity(rendered) do
    [vanity, _] = String.split(rendered.name(), ":", parts: 2)
    abbrev = rendered.hash() |> String.slice(0, @vanity_id_length)
    abbrev <> "-" <> vanity
  end

  @polyline_interval_ms 1000.0 / 60.0
  @polyline_precision 6
  @cut_iterations 3
  @cut_corner_dist 0.25
  @avg_range_m 10.0
  @max_overlap_m 5.0
  @min_heading_deg 170.0

  def polyline(rendered) do
    %{
      polyline:
        Geo.Nif.nif_timed_smoother_polyline(
          rendered.timed_polyline(),
          @timed_precision,
          @cut_iterations,
          @cut_corner_dist,
          @avg_range_m,
          @max_overlap_m,
          @min_heading_deg,
          @polyline_interval_ms,
          @polyline_precision,
          Geo.CheapRuler.kx(),
          Geo.CheapRuler.ky()
        ),
      interval: @polyline_interval_ms,
      precision: @polyline_precision
    }
  end

  @doc """
  Returns the recording data string for the given timestamp

  ## Examples

      iex> Video.Rendered.recording_date_for(Video.RenderedTest.Example, 11)
      "after ten ms"
  """
  @spec recording_date_for(t(), non_neg_integer()) :: binary()
  def recording_date_for(rendered, time_in_ms) when time_in_ms >= 0 do
    Enum.reduce_while(rendered.recording_dates(), "", fn %{timestamp: ts, text: binary}, prev ->
      if ts <= time_in_ms, do: {:cont, binary}, else: {:halt, prev}
    end)
  end

  @doc """
  Returns the street name for the given timestamp

  ## Examples

      iex> Video.Rendered.street_name_for(Video.RenderedTest.Example, 11)
      "after ten ms"
  """
  @spec street_name_for(t(), non_neg_integer()) :: binary()
  def street_name_for(rendered, time_in_ms) when time_in_ms >= 0 do
    Enum.reduce_while(rendered.street_names(), "", fn %{timestamp: ts, text: binary}, prev ->
      if ts <= time_in_ms, do: {:cont, binary}, else: {:halt, prev}
    end)
  end

  @doc """
  Returns the total line distance in meters for this video's track.
  """
  @spec line_distance(t()) :: float()
  def line_distance(rendered) do
    Geo.Nif.nif_timed_line_distance(
      rendered.timed_polyline(),
      @timed_precision,
      Geo.CheapRuler.kx(),
      Geo.CheapRuler.ky()
    )
    |> case do
      {:error, reason} -> {:error, "#{rendered}: #{reason}"}
      other -> other
    end
  end

  @doc """
  Returns `{start_coord, end_coord}` where each is a map with
  `:lat`, `:lon`, `:time_offset_ms`, and `:bearing`.
  """
  @spec start_end_coords(t()) :: {indicator(), indicator()}
  def start_end_coords(rendered) do
    Geo.Nif.nif_timed_start_end_coords(
      rendered.timed_polyline(),
      @timed_precision,
      Geo.CheapRuler.kx(),
      Geo.CheapRuler.ky()
    )
  end

  @doc """
  Finds the closest point on this video's track to the given point.
  Returns a map with `:dist`, `:lat`, `:lon`, `:time_offset_ms`, and `:bearing`.
  """
  @spec closest_point(t(), Geo.Point.like(), float()) :: %{
          dist: float(),
          lat: float(),
          lon: float(),
          time_offset_ms: non_neg_integer(),
          bearing: float()
        }
  def closest_point(rendered, point, epsilon \\ 0.0) do
    Geo.Nif.nif_timed_closest_point(
      rendered.timed_polyline(),
      @timed_precision,
      point.lon,
      point.lat,
      epsilon,
      Geo.CheapRuler.kx(),
      Geo.CheapRuler.ky()
    )
  end

  @type indicator :: %{
          lat: float(),
          lon: float(),
          bearing: float(),
          time_offset_ms: non_neg_integer()
        }

  @spec start_from(Video.Rendered.t(), Geo.Point.like() | integer() | nil) :: indicator()
  @doc """
  Find the closest point for the video that roughly corresponds to the given
  point or timestamp. If the point is not valid, it returns the start of the
  video.

  ## Examples

      iex> Video.Rendered.start_from(Video.RenderedTest.Example, %{lat: 53.5085, lon: 10.041})
      %{bearing: 310.0161346069299, lat: 53.5085, lon: 10.041000000000002, time_offset_ms: 150}

      iex> {_start, last} = Video.Rendered.start_end_coords(Video.RenderedTest.Example)
      iex> Video.Rendered.start_from(Video.RenderedTest.Example, last)
      %{bearing: 310.0161346071303, lat: last.lat, lon: last.lon, time_offset_ms: last.time_offset_ms}

      iex> Video.Rendered.start_from(Video.RenderedTest.Example, 124)
      %{bearing: 310.0161346069299, lat: 53.50824, lon: 10.04152, time_offset_ms: 124}
  """
  def start_from(rendered, point_or_time)

  def start_from(rendered, nil) do
    {start, _end} = start_end_coords(rendered)
    start
  end

  def start_from(rendered, time) when is_integer(time) do
    Geo.Nif.nif_timed_coord_at_time(
      rendered.timed_polyline(),
      @timed_precision,
      time,
      rendered.length_ms(),
      Geo.CheapRuler.kx(),
      Geo.CheapRuler.ky()
    )
  end

  @search_radius_meters 10
  def start_from(rendered, point) do
    result = closest_point(rendered, point, @search_radius_meters)
    Map.delete(result, :dist)
  end
end
