defmodule Data.RoughDate do
  defstruct [:year, :quarter, :month, :day]

  @type t :: %__MODULE__{}

  @months {"Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September",
           "Oktober", "November", "Dezember"}

  @spec sigil_d(binary(), []) :: Data.RoughDate.t()
  def sigil_d(str, []), do: Data.RoughDate.parse(str)

  def zero(), do: parse(nil)

  def parse(nil), do: %__MODULE__{year: nil, quarter: nil, month: nil, day: nil}

  def parse(date) when is_integer(date),
    do: %__MODULE__{year: date, quarter: nil, month: nil, day: nil}

  def parse(%Date{year: y, month: m, day: d}),
    do: %__MODULE__{year: y, quarter: nil, month: m - 1, day: d}

  def parse(date) when is_binary(date) do
    date = String.trim(date)

    cond do
      String.match?(date, ~r/^20\d\dQ[1-4]$/) ->
        {quarter, ""} = date |> String.at(5) |> Integer.parse()
        %__MODULE__{year: get_year(date), quarter: quarter, month: nil, day: nil}

      String.match?(date, ~r/^20\d\d-[01]\d$/) ->
        {month, ""} = date |> String.slice(5..-1) |> Integer.parse()
        %__MODULE__{year: get_year(date), quarter: nil, month: month - 1, day: nil}

      String.match?(date, ~r/^20\d\d$/) ->
        %__MODULE__{year: get_year(date), quarter: nil, month: nil, day: nil}

      String.match?(date, ~r/^20\d\d-\d{1,2}-\d{1,2}$/) ->
        s = String.split(date, "-")
        {year, ""} = s |> Enum.at(0) |> Integer.parse()
        {month, ""} = s |> Enum.at(1) |> Integer.parse()
        {day, ""} = s |> Enum.at(2) |> Integer.parse()
        %__MODULE__{year: year, quarter: nil, month: month - 1, day: day}

      true ->
        %__MODULE__{year: nil, quarter: nil, month: nil}
    end
  end

  def as_full_date(%__MODULE__{year: y, month: m, day: d})
      when is_integer(y) and is_integer(m) and is_integer(d),
      do: Date.new!(y, m + 1, d)

  def as_full_date(_rough_date), do: nil

  def range(%__MODULE__{year: nil}, %__MODULE__{year: nil}), do: ""
  def range(from, %__MODULE__{year: nil}), do: "ab #{to_str(from)}"
  def range(%__MODULE__{year: nil}, to), do: "bis #{to_str(to)}"
  def range(d, d), do: "#{to_str(d)}"

  def range(%{year: y} = from, %{year: y} = to),
    do: "#{to_str(from) |> String.slice(0..-6)} bis #{to_str(to)}"

  def range(from, to), do: "#{to_str(from)} bis #{to_str(to)}"

  def to_str(%__MODULE__{year: y, month: m, day: d}) when not is_nil(d) do
    "#{d}. #{elem(@months, m)} #{y}"
  end

  def to_str(%__MODULE__{year: y, quarter: q}) when is_integer(q) do
    "#{quarter_text(q)} #{y}"
  end

  def to_str(%__MODULE__{year: y, month: m}) when is_integer(m) do
    "#{elem(@months, m)} #{y}"
  end

  def to_str(%__MODULE__{year: y}) when is_integer(y), do: "#{y}"

  def to_str(%__MODULE__{}), do: "Unbekannt"

  def without_day(%__MODULE__{} = t), do: to_str(%{t | day: nil})

  def compare(%__MODULE__{} = left, %__MODULE__{} = right) do
    left = {left.year, guess_month(left), !is_nil(left.day), left.day}
    right = {right.year, guess_month(right), !is_nil(right.day), right.day}

    cond do
      left > right -> :gt
      left < right -> :lt
      true -> :eq
    end
  end

  defp guess_month(%__MODULE__{month: x}) when is_integer(x), do: x

  defp guess_month(%__MODULE__{quarter: x}) when is_integer(x) do
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
