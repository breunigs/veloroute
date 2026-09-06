defmodule Video.RendererTest do
  use ExUnit.Case, async: true

  test "variants returns expected structure" do
    variants = Video.Renderer.variants()
    assert variants != []
    assert Enum.all?(variants, &Map.has_key?(&1, :width))
    assert Enum.all?(variants, &Map.has_key?(&1, :height))
    assert Enum.all?(variants, &Map.has_key?(&1, :index))
  end
end
