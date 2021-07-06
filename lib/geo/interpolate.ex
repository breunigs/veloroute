defprotocol Geo.Interpolate do
  @doc """
  Interpolates a point between a and b, where t specifies the ratio from 0 (=a)
  to 1 (=b) how far along the line the point should be.
  """
  def point(a, b, t)
end

defimpl Geo.Interpolate, for: Map do
  def point(%{lon: lon1, lat: lat1}, %{lon: lon2, lat: lat2}, t) do
    dx = lon2 - lon1
    dy = lat2 - lat1
    %{lon: lon1 + dx * t, lat: lat1 + dy * t}
  end
end
