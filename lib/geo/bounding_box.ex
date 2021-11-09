defmodule Geo.BoundingBox do
  @params [:minLon, :minLat, :maxLon, :maxLat]
  @enforce_keys @params

  @type t() :: %__MODULE__{
          minLon: number(),
          maxLon: number(),
          minLat: number(),
          maxLat: number()
        }
  @type like() ::
          %{
            minLon: number(),
            maxLon: number(),
            minLat: number(),
            maxLat: number()
          }

  defstruct @params

  def parse(%{
        "maxlat" => maxLat,
        "maxlon" => maxLon,
        "minlat" => minLat,
        "minlon" => minLon
      }) do
    %__MODULE__{
      minLon: minLon,
      minLat: minLat,
      maxLon: maxLon,
      maxLat: maxLat
    }
  end

  def parse(%{maxLat: maxLat, maxLon: maxLon, minLat: minLat, minLon: minLon}) do
    %__MODULE__{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse([[minLon, minLat], [maxLon, maxLat]]) do
    %__MODULE__{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse([minLon, minLat, maxLon, maxLat]) do
    %__MODULE__{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse(bounds) when is_binary(bounds) do
    with [minLon, minLat, maxLon, maxLat] <- String.split(bounds, ","),
         {minLon, ""} <- Float.parse(minLon),
         {minLat, ""} <- Float.parse(minLat),
         {maxLon, ""} <- Float.parse(maxLon),
         {maxLat, ""} <- Float.parse(maxLat) do
      %__MODULE__{
        minLon: minLon,
        minLat: minLat,
        maxLon: maxLon,
        maxLat: maxLat
      }
    else
      _ -> nil
    end
  end
end

defimpl String.Chars, for: Geo.BoundingBox do
  def to_string(%{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}) do
    "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"
  end

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end
