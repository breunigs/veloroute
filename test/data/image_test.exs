defmodule Data.ImageTest do
  use ExUnit.Case, async: true
  alias Data.Image
  alias Data.ImageCache

  test ".find_by_img handles if route is nil and image unknown" do
    all = ImageCache.images()
    assert {:not_found, []} = Image.find_by_img(all, "aaaaaaaaaaaaaaaaaaaaaa", route: nil)
  end

  test ".find_by_img handles if route is nil and image known" do
    all = ImageCache.images()
    {route, [%{img: img} | _rest]} = all |> Map.to_list() |> List.first()
    assert {^route, [_at_least_one | _rest]} = Image.find_by_img(all, img, route: nil)
  end
end
