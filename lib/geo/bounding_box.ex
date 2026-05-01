defmodule Geo.BoundingBox do
  @params [:min_lon, :min_lat, :max_lon, :max_lat]
  @enforce_keys @params

  @type t() :: %__MODULE__{
          min_lon: number(),
          max_lon: number(),
          min_lat: number(),
          max_lat: number()
        }
  @type like() ::
          %{
            min_lon: number(),
            max_lon: number(),
            min_lat: number(),
            max_lat: number()
          }
          | t()

  defstruct @params

  @typep numberlist :: [float() | integer(), ...]
  @spec parse(binary | numberlist | [numberlist, ...] | map | nil) :: nil | Geo.BoundingBox.t()
  def parse(%{"maxlat" => max_lat, "maxlon" => max_lon, "minlat" => min_lat, "minlon" => min_lon}) do
    %__MODULE__{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}
  end

  def parse(%{"ymax" => max_lat, "xmax" => max_lon, "ymin" => min_lat, "xmin" => min_lon}) do
    %__MODULE__{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}
  end

  def parse(%{max_lat: max_lat, max_lon: max_lon, min_lat: min_lat, min_lon: min_lon}) do
    %__MODULE__{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}
  end

  def parse([[min_lon, min_lat], [max_lon, max_lat]]) do
    %__MODULE__{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}
  end

  def parse([min_lon, min_lat, max_lon, max_lat]) do
    %__MODULE__{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}
  end

  def parse(bounds) when is_binary(bounds) do
    with [min_lon, min_lat, max_lon, max_lat] <- String.split(bounds, ~r/[-,]/),
         {min_lon, ""} <- Float.parse(min_lon),
         {min_lat, ""} <- Float.parse(min_lat),
         {max_lon, ""} <- Float.parse(max_lon),
         {max_lat, ""} <- Float.parse(max_lat) do
      %__MODULE__{
        min_lon: min_lon,
        min_lat: min_lat,
        max_lon: max_lon,
        max_lat: max_lat
      }
    else
      _ -> nil
    end
  end

  def parse(nil), do: nil

  @doc """
  Calculates approximate area of the bounding box
  """
  @spec area(t()) :: number()
  def area(%__MODULE__{min_lon: min_lon, max_lon: max_lon, min_lat: min_lat, max_lat: max_lat}) do
    (max_lon - min_lon) * (max_lat - min_lat)
  end

  def to_string_bounds(bounds, delimiter \\ "-")

  def to_string_bounds(bounds, delimiter) when is_binary(bounds) and bounds != "" do
    if String.contains?(bounds, delimiter) do
      bounds
    else
      bounds |> parse() |> to_string_bounds(delimiter)
    end
  end

  def to_string_bounds([[min_lon, min_lat], [max_lon, max_lat]], delimiter),
    do: "#{r(min_lon)}#{delimiter}#{r(min_lat)}#{delimiter}#{r(max_lon)}#{delimiter}#{r(max_lat)}"

  def to_string_bounds([min_lon, min_lat, max_lon, max_lat], delimiter),
    do: "#{r(min_lon)}#{delimiter}#{r(min_lat)}#{delimiter}#{r(max_lon)}#{delimiter}#{r(max_lat)}"

  def to_string_bounds(
        %{min_lat: min_lat, min_lon: min_lon, max_lat: max_lat, max_lon: max_lon},
        delimiter
      ),
      do:
        "#{r(min_lon)}#{delimiter}#{r(min_lat)}#{delimiter}#{r(max_lon)}#{delimiter}#{r(max_lat)}"

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end

defimpl String.Chars, for: Geo.BoundingBox do
  def to_string(%{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}) do
    "#{r(min_lon)}-#{r(min_lat)}-#{r(max_lon)}-#{r(max_lat)}"
  end

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end

defimpl JSON.Encoder, for: Geo.BoundingBox do
  def encode(%{min_lon: min_lon, min_lat: min_lat, max_lon: max_lon, max_lat: max_lat}, encoder) do
    encoder.([r(min_lon), r(min_lat), r(max_lon), r(max_lat)], encoder)
  end

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end

defimpl Phoenix.HTML.Safe, for: Geo.BoundingBox do
  def to_iodata(bounds) do
    bounds
    |> Geo.BoundingBox.to_string_bounds()
    |> Plug.HTML.html_escape_to_iodata()
  end
end
