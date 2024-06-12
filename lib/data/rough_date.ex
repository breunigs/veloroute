defmodule Data.RoughDate do
  defstruct [:year, :quarter, :month, :day]

  @type t :: %__MODULE__{}

  @months %{
    {:short, "de"} => ~w(Jan Feb Mär Apr Mai Jun Jul Aug Sep Okt Nov Dez),
    {:short, "en"} => ~w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec),
    {:long, "de"} =>
      ~w(Januar Februar März April Mai Juni Juli August September Oktober November Dezember),
    {:long, "en"} =>
      ~w(January February March April May June July August September October November December)
  }

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
        {month, ""} = date |> String.slice(5..-1//1) |> Integer.parse()
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

  def from_full_date(%Date{day: day, month: month, year: year}) do
    %__MODULE__{year: year, quarter: nil, month: month - 1, day: day}
  end

  # def range(from, to, lang \\ Settings.default_language())
  def range(from, to, lang)

  def range(%__MODULE__{year: nil}, %__MODULE__{year: nil}, _lang), do: ""
  def range(from, %__MODULE__{year: nil}, lang), do: "#{from(lang)} #{to_str(from, lang)}"
  def range(%__MODULE__{year: nil}, to, lang), do: "#{till(lang)} #{to_str(to, lang)}"
  def range(d, d, lang), do: "#{to_str(d, lang)}"

  def range(%{year: y} = from, %{year: y} = to, lang),
    do: "#{to_str(from, lang) |> String.slice(0..-6//1)} #{till(lang)} #{to_str(to, lang)}"

  def range(from, to, lang), do: "#{to_str(from, lang)} #{till(lang)} #{to_str(to, lang)}"

  def to_str(%__MODULE__{year: y, month: m, day: d}, lang) when not is_nil(d) do
    "#{day(d, lang)} #{Enum.at(@months[{:long, lang}], m)} #{y}"
  end

  def to_str(%__MODULE__{year: y, quarter: q}, lang) when is_integer(q) do
    "#{quarter_text(q, lang)} #{y}"
  end

  def to_str(%__MODULE__{year: y, month: m}, lang) when is_integer(m) do
    "#{Enum.at(@months[{:long, lang}], m)} #{y}"
  end

  def to_str(%__MODULE__{year: y}, _lang) when is_integer(y), do: "#{y}"

  def to_str(%__MODULE__{}, "en"), do: "Unknown"
  def to_str(%__MODULE__{}, "de"), do: "Unbekannt"

  def short(%__MODULE__{month: m, day: d}, lang),
    do: "#{day(d, lang)} #{Enum.at(@months[{:short, lang}], m)}"

  def short(other, lang), do: to_str(other, lang)

  def without_day(%__MODULE__{} = t, lang), do: to_str(%{t | day: nil}, lang)

  def compare(%__MODULE__{} = left, %__MODULE__{} = right) do
    left = {left.year, guess_month(left), !is_nil(left.day), left.day}
    right = {right.year, guess_month(right), !is_nil(right.day), right.day}

    cond do
      left > right -> :gt
      left < right -> :lt
      true -> :eq
    end
  end

  defp day(d, "de"), do: "#{d}."
  defp day(d, "en"), do: "#{d}"

  defp from("de"), do: "ab"
  defp from("en"), do: "from"
  defp till("de"), do: "bis"
  defp till("en"), do: "till"

  defp guess_month(%__MODULE__{month: x}) when is_integer(x), do: x

  defp guess_month(%__MODULE__{quarter: x}) when is_integer(x) do
    # 0.5 hack sorts it between two months
    (x - 1) * 3 + 0.5
  end

  defp guess_month(_), do: 0

  defp quarter_text(x, "de") when is_integer(x) do
    case x do
      # if I say "Winter 2019" I think of "end of 2019", not the beginning. For
      # everything else the season rolls more nicely off the tongue (or brain?)
      1 -> "1. Quartal"
      2 -> "Frühjahr"
      3 -> "Sommer"
      4 -> "Herbst"
    end
  end

  defp quarter_text(x, "en") when is_integer(x) do
    case x do
      1 -> "1. quarter"
      2 -> "spring"
      3 -> "summer"
      4 -> "autumn"
    end
  end

  defp get_year(date) do
    {year, ""} = date |> String.slice(0..3) |> Integer.parse()
    year
  end
end

defimpl String.Chars, for: Data.RoughDate do
  def to_string(date), do: Data.RoughDate.to_str(date, Settings.default_language())
end

defimpl Phoenix.HTML.Safe, for: Data.RoughDate do
  def to_iodata(date) do
    date
    |> Data.RoughDate.to_str(Settings.default_language())
    |> Phoenix.HTML.Engine.html_escape()
  end
end
