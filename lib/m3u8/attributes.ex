defmodule M3U8.Attributes do
  @type resolution :: %{width: non_neg_integer(), height: non_neg_integer()}
  @type byte_range :: %{length: non_neg_integer(), offset: non_neg_integer() | nil}
  @type values :: nil | binary | non_neg_integer() | float() | resolution | byte_range()

  @doc ~S"""
  Parses an m3u8 attribute list

  ## Examples

      iex> M3U8.Attributes.parse(
      ...>   ~s|BANDWIDTH=4950000,RESOLUTION=1280x720,CODECS="av01.0.08M.08"|
      ...> )
      {:ok, %{
        "BANDWIDTH" => 4950000,
        "CODECS" => "av01.0.08M.08",
        "RESOLUTION" => %{height: 720, width: 1280}
      }}

      iex> M3U8.Attributes.parse(~s|URI="stream_0.m4s",BYTERANGE="892@0"|)
      {:ok, %{
        "URI" => "stream_0.m4s",
        "BYTERANGE" => %{length: 892, offset: 0}
      }}
  """
  @spec parse(charlist() | binary()) :: {:error, binary()} | {:ok, %{optional(binary) => values}}
  def parse(attributes \\ [])
  def parse(attributes) when is_binary(attributes), do: parse(to_charlist(attributes))

  def parse(attributes) when is_list(attributes) do
    t(attributes, %{mode: :key, wip_key: [], wip_val: [], found: %{}})
  end

  defguardp between?(val, from, to) when from <= val and val <= to

  # mode: key
  # Search for value separator `=`
  # Ignores empty attributes (no key, no value)
  defp t([?, | rest], %{mode: :key, wip_key: []} = state), do: t(rest, state)

  defp t([?= | rest], %{mode: :key, wip_key: [_ | _]} = state),
    do: t(rest, %{state | mode: :value})

  defp t([chr | rest], %{mode: :key, wip_key: key} = state)
       when between?(chr, ?A, ?Z) or between?(chr, ?0, ?0) or chr == ?- do
    t(rest, %{state | wip_key: [chr | key]})
  end

  # mode: value
  # reads value until EOL or separator `,`
  # if first char is a `"`, switch to quoted mode
  defp t([?" | rest], %{mode: :value, wip_val: []} = state), do: t(rest, %{state | mode: :quote})

  defp t([?" | rest], %{mode: :quote} = state),
    do: t(rest, %{quoted(state) | mode: :value})

  defp t([chr | rest], %{mode: :quote, wip_val: val} = state),
    do: t(rest, %{state | wip_val: [chr | val]})

  defp t([?, | rest], %{mode: :value} = state),
    do: t(rest, %{value(state, &detect_value/1) | mode: :key})

  defp t([chr | rest], %{mode: :value, wip_val: val} = state) when chr not in ~c"\", ",
    do: t(rest, %{state | wip_val: [chr | val]})

  # end of list
  defp t([], state), do: {:ok, value(state, &detect_value/1).found}

  defp t(rest, state),
    do:
      {:error,
       """
       failed parsing attribute list.
       Current state: #{inspect(state, sort_maps: true)}
       remaining: #{to_string(rest)}
       """}

  defp quoted(%{found: found, wip_key: key, wip_val: val} = state) do
    key = key |> Enum.reverse() |> to_string()
    val = val |> Enum.reverse() |> to_string()
    val = if(key == "BYTERANGE", do: try_byte_range(val)) || val
    found = Map.put(found, key, val)
    %{state | wip_key: [], wip_val: [], found: found}
  end

  defp value(%{wip_key: []} = state, _converter), do: state

  defp value(%{found: found, wip_key: key, wip_val: val} = state, converter) do
    key = key |> Enum.reverse() |> to_string()
    val = val |> Enum.reverse() |> to_string() |> converter.()
    found = Map.put(found, key, val)
    %{state | wip_key: [], wip_val: [], found: found}
  end

  defp detect_value(val) when is_binary(val) do
    try_hex(val) || try_resolution(val) || try_int(val) || try_float(val) || val
  end

  defp try_hex("0x" <> rest), do: try_int(rest, 16)
  defp try_hex("0X" <> rest), do: try_int(rest, 16)
  defp try_hex(_other), do: nil

  defp try_int(val, base \\ 10) do
    case Integer.parse(val, base) do
      {int, ""} -> int
      _other -> nil
    end
  end

  defp try_float(val) do
    case Float.parse(val) do
      {float, ""} -> float
      _other -> nil
    end
  end

  @spec try_resolution(binary()) :: resolution() | nil
  defp try_resolution(val) do
    with [width, height] <- String.split(val, "x"),
         w when is_integer(w) <- try_int(width),
         h when is_integer(h) <- try_int(height) do
      %{width: w, height: h}
    else
      _ -> nil
    end
  end

  @spec try_byte_range(binary()) :: byte_range() | nil
  def try_byte_range(data) do
    Regex.run(~r/^([0-9]+)(?:@([0-9]+))?$/, data)
    |> case do
      [_, length] ->
        %{length: String.to_integer(length), offset: nil}

      [_, length, offset] ->
        %{length: String.to_integer(length), offset: String.to_integer(offset)}

      nil ->
        nil
    end
  end
end
