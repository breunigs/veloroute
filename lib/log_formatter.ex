defmodule LogFormatter do
  # @spec format(atom, chardata, Logger.Formatter.date_time_ms(), keyword()) :: IO.chardata()
  @fallback Logger.Formatter.compile("(FALLBACK) $time $metadata [$level] $message\n")
  @failed Logger.Formatter.compile("(FAILED LOG FORMAT) $message\n")

  @path_len 30
  @line_len 3

  def format(level, message, {date, time}, metadata) do
    try do
      {line, metadata} = Keyword.pop(metadata, :line)
      {file, metadata} = Keyword.pop(metadata, :file)

      [
        fixed_width(level, 1),
        # ?\s,
        # Logger.Formatter.format_date(date),
        ?\s,
        Logger.Formatter.format_time(time),
        ?\s,
        fixed_width(
          "#{Util.shorten_path(file || "(unknown)")}:#{line || "?"}",
          @path_len + @line_len + 1
        ),
        ?\s,
        Enum.map(metadata, fn {k, v} -> "#{k}=#{v} " end),
        message,
        ?\n
      ]
      |> List.flatten()
      |> Enum.map(fn s -> if is_binary(s), do: String.to_charlist(s), else: s end)
    rescue
      e ->
        [
          Logger.Formatter.format(@fallback, level, message, {date, time}, metadata),
          Logger.Formatter.format(@failed, :error, inspect(e), {date, time},
            msg: message,
            metadata: metadata
          )
        ]
    end
  end

  defp fixed_width(term, len) when not is_binary(term),
    do: fixed_width(to_string(term), len)

  defp fixed_width("", len), do: String.pad_trailing("", len)

  defp fixed_width(str, len) do
    str |> String.slice(0..(len - 1)) |> String.pad_trailing(len)
  end
end
