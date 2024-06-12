defmodule Data.RoughDateTest do
  use ExUnit.Case, async: true
  alias Data.RoughDate

  @unknown %RoughDate{year: nil, quarter: nil, month: nil}

  test "detects unknown text" do
    assert RoughDate.parse("not a date") == %RoughDate{
             year: nil,
             quarter: nil,
             month: nil,
             day: nil
           }
  end

  test "makes nice ranges" do
    a = %RoughDate{year: 2019, quarter: nil, month: nil}
    b = %RoughDate{year: 2020, quarter: nil, month: nil}

    assert RoughDate.range(a, b, "de") == "2019 bis 2020"
    assert RoughDate.range(a, @unknown, "de") == "ab 2019"
    assert RoughDate.range(@unknown, b, "de") == "bis 2020"
    assert RoughDate.range(a, a, "de") == "2019"

    a = %RoughDate{year: 2020, quarter: nil, month: 6}
    b = %RoughDate{year: 2020, quarter: nil, month: 8}
    assert RoughDate.range(a, b, "de") == "Juli bis September 2020"
  end

  test "compares decently" do
    a = RoughDate.parse("2019")
    b = RoughDate.parse("2019Q1")
    c = RoughDate.parse("2019-02")
    d = RoughDate.parse("2019-04")
    e = RoughDate.parse("2019-04-25")
    f = RoughDate.parse("2020")

    sorted = [a, b, c, d, e, f] |> Enum.shuffle() |> Enum.sort({:asc, RoughDate})

    assert [a, b, c, d, e, f] == sorted
  end

  test "sorts unknowns last" do
    b = RoughDate.parse("2019Q1")

    sorted = [@unknown, b] |> Enum.sort({:asc, RoughDate})
    assert [b, @unknown] == sorted
  end

  test "places quarters between months" do
    a = RoughDate.parse("2019-01")
    b = RoughDate.parse("2019Q1")
    c = RoughDate.parse("2019-02")

    sorted = [a, b, c] |> Enum.shuffle() |> Enum.sort({:asc, RoughDate})
    assert [a, b, c] == sorted
  end

  test "converts to text" do
    assert RoughDate.parse("2019") |> RoughDate.to_str("de") == "2019"
    assert RoughDate.parse("2019Q2") |> RoughDate.to_str("de") == "Frühjahr 2019"
    assert RoughDate.parse("2019-07") |> RoughDate.to_str("de") == "Juli 2019"
  end

  test "parses exact dates" do
    assert RoughDate.parse("2019-04-25") == %RoughDate{
             year: 2019,
             quarter: nil,
             month: 3,
             day: 25
           }
  end
end
