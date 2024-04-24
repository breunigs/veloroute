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
          | t()

  defstruct @params

  @typep numberlist :: [float() | integer(), ...]
  @spec parse(binary | numberlist | [numberlist, ...] | map | nil) :: nil | Geo.BoundingBox.t()
  def parse(%{"maxlat" => maxLat, "maxlon" => maxLon, "minlat" => minLat, "minlon" => minLon}) do
    %__MODULE__{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
  end

  def parse(%{"ymax" => maxLat, "xmax" => maxLon, "ymin" => minLat, "xmin" => minLon}) do
    %__MODULE__{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}
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
    with [minLon, minLat, maxLon, maxLat] <- String.split(bounds, ~r/[-,]/),
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

  def parse(nil), do: nil

  def to_string_bounds(bounds, delimiter \\ "-")

  def to_string_bounds(bounds, delimiter) when is_binary(bounds) and bounds != "" do
    if String.contains?(bounds, delimiter) do
      bounds
    else
      bounds |> parse() |> to_string_bounds(delimiter)
    end
  end

  def to_string_bounds([[minLon, minLat], [maxLon, maxLat]], delimiter),
    do: "#{r(minLon)}#{delimiter}#{r(minLat)}#{delimiter}#{r(maxLon)}#{delimiter}#{r(maxLat)}"

  def to_string_bounds([minLon, minLat, maxLon, maxLat], delimiter),
    do: "#{r(minLon)}#{delimiter}#{r(minLat)}#{delimiter}#{r(maxLon)}#{delimiter}#{r(maxLat)}"

  def to_string_bounds(
        %{minLat: minLat, minLon: minLon, maxLat: maxLat, maxLon: maxLon},
        delimiter
      ),
      do: "#{r(minLon)}#{delimiter}#{r(minLat)}#{delimiter}#{r(maxLon)}#{delimiter}#{r(maxLat)}"

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end

defimpl String.Chars, for: Geo.BoundingBox do
  def to_string(%{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}) do
    "#{r(minLon)}-#{r(minLat)}-#{r(maxLon)}-#{r(maxLat)}"
  end

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end

defimpl Jason.Encoder, for: Geo.BoundingBox do
  def encode(%{minLon: minLon, minLat: minLat, maxLon: maxLon, maxLat: maxLat}, opts) do
    Jason.Encode.list([r(minLon), r(minLat), r(maxLon), r(maxLat)], opts)
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
