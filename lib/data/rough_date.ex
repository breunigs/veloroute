defmodule Data.RoughDate do
  alias __MODULE__

  defstruct [:year, :quarter, :month]

  @months {"Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September",
           "Oktober", "November", "Dezember"}

  def parse(nil), do: %RoughDate{year: nil, quarter: nil, month: nil}

  def parse(date) when is_integer(date), do: %RoughDate{year: date, quarter: nil, month: nil}

  def parse(date) when is_binary(date) do
    date = String.trim(date)

    cond do
      String.match?(date, ~r/^20\d\dQ[1-4]$/) ->
        {quarter, ""} = date |> String.at(5) |> Integer.parse()
        %RoughDate{year: get_year(date), quarter: quarter, month: nil}

      String.match?(date, ~r/^20\d\d-[01]\d$/) ->
        {month, ""} = date |> String.slice(5..-1) |> Integer.parse()
        %RoughDate{year: get_year(date), quarter: nil, month: month - 1}

      String.match?(date, ~r/^20\d\d$/) ->
        %RoughDate{year: get_year(date), quarter: nil, month: nil}

      true ->
        %RoughDate{year: nil, quarter: nil, month: nil}
    end
  end

  def range(%RoughDate{year: nil}, %RoughDate{year: nil}), do: ""
  def range(from, %RoughDate{year: nil}), do: "ab #{to_str(from)}"
  def range(%RoughDate{year: nil}, to), do: "bis #{to_str(to)}"
  def range(d, d), do: "#{to_str(d)}"
  def range(from, to), do: "#{to_str(from)} bis #{to_str(to)}"

  def to_str(%RoughDate{year: y, quarter: q}) when is_integer(q) do
    "#{quarter_text(q)} #{y}"
  end

  def to_str(%RoughDate{year: y, month: m}) when is_integer(m) do
    "#{elem(@months, m)} #{y}"
  end

  def to_str(%RoughDate{year: y}), do: "#{y}"

  def sort(rds) when is_list(rds) do
    Enum.sort(rds, &RoughDate.compare(&1, &2))
  end

  def compare(%RoughDate{} = left, %RoughDate{} = right) do
    cond do
      unknown?(left) && unknown?(right) -> false
      unknown?(right) -> true
      unknown?(left) -> false
      left.year > right.year -> false
      left.year < right.year -> true
      guess_month(left) > guess_month(right) -> false
      guess_month(left) < guess_month(right) -> true
      true -> false
    end
  end

  defp unknown?(%RoughDate{year: nil}), do: true
  defp unknown?(_), do: false

  defp guess_month(%RoughDate{month: x}) when is_integer(x), do: x

  defp guess_month(%RoughDate{quarter: x}) when is_integer(x) do
    # 0.5 hack sorts it between two months
    (x - 1) * 3 + 0.5
  end

  defp guess_month(_), do: 0

  defp quarter_text(x) when is_integer(x) do
    case x do
      # if I say "Winter 2019" I think of "end of 2019", not the beginning. For
      # everything else the season rolls more nicely off the tongue (or brain?)
      1 -> "1. Quartal"
      2 -> "Frühjahr"
      3 -> "Sommer"
      4 -> "Herbst"
    end
  end

  defp get_year(date) do
    {year, ""} = date |> String.slice(0..3) |> Integer.parse()
    year
  end
end
