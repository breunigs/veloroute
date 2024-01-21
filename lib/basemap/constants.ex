defmodule Basemap.Constants do
  # keep in sync with map.js
  def min_zoom, do: 9

  @max_zoom 19
  def max_zoom, do: @max_zoom

  @bounds_fitting_max_zoom 17
  def bounds_fitting_max_zoom, do: @bounds_fitting_max_zoom

  if @bounds_fitting_max_zoom > @max_zoom, do: raise("invalid config")
end
