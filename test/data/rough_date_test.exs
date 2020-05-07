defmodule Data.RoughDateTest do
  use ExUnit.Case
  alias Data.RoughDate

  @unknown %RoughDate{year: nil, quarter: nil, month: nil}

  test "detects unknown text" do
    assert RoughDate.parse("not a date") == %RoughDate{year: nil, quarter: nil, month: nil}
  end

  test "makes nice ranges" do
    a = %RoughDate{year: 2019, quarter: nil, month: nil}
    b = %RoughDate{year: 2020, quarter: nil, month: nil}

    assert RoughDate.range(a, b) == "2019 bis 2020"
    assert RoughDate.range(a, @unknown) == "ab 2019"
    assert RoughDate.range(@unknown, b) == "bis 2020"
    assert RoughDate.range(a, a) == "2019"
  end

  test "compares decently" do
    a = RoughDate.parse("2019")
    b = RoughDate.parse("2019Q1")
    c = RoughDate.parse("2019-02")
    d = RoughDate.parse("2019-04")
    e = RoughDate.parse("2020")

    sorted = [a, b, c, d, e] |> Enum.shuffle() |> RoughDate.sort()
    assert [a, b, c, d, e] == sorted
  end

  test "sorts unknowns last" do
    b = RoughDate.parse("2019Q1")

    sorted = [@unknown, b] |> RoughDate.sort()
    assert [b, @unknown] == sorted
  end

  test "places quarters between months" do
    a = RoughDate.parse("2019-01")
    b = RoughDate.parse("2019Q1")
    c = RoughDate.parse("2019-02")

    sorted = [a, b, c] |> Enum.shuffle() |> RoughDate.sort()
    assert [a, b, c] == sorted
  end

  test "converts to text" do
    assert RoughDate.parse("2019") |> RoughDate.to_str() == "2019"
    assert RoughDate.parse("2019Q2") |> RoughDate.to_str() == "Frühjahr 2019"
    assert RoughDate.parse("2019-07") |> RoughDate.to_str() == "Juli 2019"
  end
end
