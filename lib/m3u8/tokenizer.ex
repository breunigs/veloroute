defmodule M3U8.Tokenizer do
  @type playlist_type :: :event | :vod
  @type extinf_type :: %{duration: float(), title: binary()}
  @type value_type ::
          pos_integer() | playlist_type() | M3U8.Attributes.values() | extinf_type() | nil
  @typep token_type :: atom()
  @type valid_token :: {token_type(), value_type()}
  @typep maybe_token :: {:ok, token_type(), value_type()} | {:error, token_type(), binary()}

  @spec read_file(binary()) :: {:ok, [valid_token()]} | {:error, binary()}
  def read_file(file) do
    with {:ok, data} <- File.read(file) do
      {:ok, read(data)}
    else
      {:error, reason} -> {:error, "failed streaming #{file}: #{reason}"}
    end
  end

  @spec read(binary()) :: {:ok, [valid_token()]} | {:error, binary()}
  def read(data) do
    tokenize(data)
    |> Enum.with_index()
    |> Enum.reduce_while([], fn
      {{:ok, type, value}, _line}, acc ->
        {:cont, [{type, value} | acc]}

      {{:error, type, error}, line}, _acc ->
        {:halt, {:error, "line=#{line + 1} type=#{type}: #{error}"}}
    end)
    |> case do
      {:error, error} -> {:error, error}
      tokens -> {:ok, Enum.reverse(tokens)}
    end
  end

  @spec tokenize(binary()) :: [maybe_token()]
  defp tokenize(data) do
    data
    |> String.split(~r/\n|\r\n/)
    |> Enum.map(fn
      "#EXTM3U" -> {:ok, :preamble, nil}
      "#EXT-X-VERSION:" <> rest -> parse_int(:version, rest)
      "#EXT-X-TARGETDURATION:" <> rest -> parse_int(:target_duration, rest)
      "#EXT-X-MEDIA-SEQUENCE:" <> rest -> parse_int(:media_sequence, rest)
      "#EXT-X-PLAYLIST-TYPE:EVENT" -> {:ok, :playlist_type, :event}
      "#EXT-X-PLAYLIST-TYPE:VOD" -> {:ok, :playlist_type, :vod}
      "#EXT-X-PLAYLIST-TYPE:" <> rest -> {:error, :playlist_type, "unknown playlist type #{rest}"}
      "#EXT-X-STREAM-INF:" <> rest -> parse_attrs(:stream, rest)
      "#EXT-X-MAP:" <> rest -> parse_attrs(:map, rest)
      "#EXTINF:" <> rest -> parse_extinf(rest)
      "#EXT-X-BYTERANGE:" <> rest -> parse_byte_range(rest)
      "#EXT-X-INDEPENDENT-SEGMENTS" -> {:ok, :independent_segments, nil}
      "#EXT-X-ENDLIST" -> {:ok, :endlist, nil}
      "#EXT" <> _r = all -> {:error, "Unknown tag: #{all}"}
      "#" <> rest -> {:ok, :comment, rest}
      "" -> {:ok, :blank, ""}
      url -> {:ok, :url, url}
    end)
  end

  @spec parse_int(atom(), binary(), non_neg_integer()) :: maybe_token()
  defp parse_int(name, value, base \\ 10) do
    case Integer.parse(value, base) do
      {int, ""} -> {:ok, name, int}
      _other -> {:error, name, "failed to read integer. Expected only digits, but got: #{value}"}
    end
  end

  @spec parse_extinf(binary()) :: maybe_token()
  defp parse_extinf(data) do
    with [dur_str, title] <- String.split(data, ",", parts: 2),
         {dur, ""} <- Float.parse(dur_str) do
      {:ok, :extinf, %{duration: dur, title: title}}
    else
      _other -> {:error, :extinf, "unexpected format: #{data}"}
    end
  end

  @spec parse_byte_range(binary()) :: maybe_token()
  defp parse_byte_range(data) do
    val = M3U8.Attributes.try_byte_range(data)
    if val, do: {:ok, :byte_range, val}, else: {:error, "invalid byte range definition: #{data}"}
  end

  @spec parse_attrs(atom(), binary()) :: maybe_token()
  defp parse_attrs(name, str) do
    {status, result} = M3U8.Attributes.parse(str)
    {status, name, result}
  end
end
