defmodule Article.HTMLEngine do
  @moduledoc """
  A small wrapper around Phoenix.LiveView.HTMLEngine that injects default
  attributes into each function call. It also raises for undesired usage.
  """
  @default_attr [
    {"render_target", {:expr, "@render_target", %{column: -1, line: -1}}},
    {"current_page", {:expr, "@current_page", %{column: -1, line: -1}}}
  ]

  @allowed_attributes %{
    ".a" => MapSet.new(["href"]),
    ".m" => MapSet.new(["bounds", "dir", "lon", "lat", "ref"]),
    ".ref" => MapSet.new(["name"])
  }

  @allowed_tags MapSet.new(~w/
    .a .m .ref .icon .mailto
    .structured_links .list_articles
    h3 h4 h5
    ol ul li
    img
    table tr td
    br p
    span em strong b i s abbr
    label input
  /)

  @behaviour EEx.Engine

  @impl true
  defdelegate init(opts), to: Phoenix.LiveView.HTMLEngine

  @impl true
  defdelegate handle_body(state), to: Phoenix.LiveView.HTMLEngine

  @impl true
  defdelegate handle_begin(state), to: Phoenix.LiveView.HTMLEngine

  @impl true
  defdelegate handle_end(state), to: Phoenix.LiveView.HTMLEngine

  @impl true
  def handle_text(%{file: file, indentation: indentation} = state, meta, text) do
    tokenized = Phoenix.LiveView.HTMLTokenizer.tokenize(text, file, indentation, meta)
    validate!(tokenized, state.file)
    text = Enum.reduce(tokenized, "", &write_token(&1, &2, state.file))
    Phoenix.LiveView.HTMLEngine.handle_text(state, meta, text)
  end

  @impl true
  defdelegate handle_expr(state, marker, expr), to: Phoenix.LiveView.HTMLEngine

  defp write_token({:tag_open, tag, _attrs, %{column: column, line: line}}, _acc, file)
       when tag in ["a", "m", "icon"] do
    raise(Phoenix.LiveView.HTMLTokenizer.ParseError,
      line: line,
      column: column,
      file: file,
      description: "Use <.#{tag}> tags over standard <#{tag}>"
    )
  end

  defp write_token({:tag_open, "." <> _r = tag, attrs, %{self_close: true}}, acc, _file),
    do: acc <> "<#{tag}#{write_attrs_with_defaults(attrs)} />"

  defp write_token({:tag_open, "." <> _r = tag, attrs, _pos}, acc, _file),
    do: acc <> "<#{tag}#{write_attrs_with_defaults(attrs)}>"

  defp write_token({:tag_open, tag, attrs, %{self_close: true}}, acc, _file),
    do: acc <> "<#{tag}#{write_attrs(attrs)} />"

  defp write_token({:tag_open, tag, attrs, _pos}, acc, _file),
    do: acc <> "<#{tag}#{write_attrs(attrs)}>"

  defp write_token({:tag_close, tag, _pos}, acc, _file), do: acc <> "</#{tag}>"
  defp write_token({:text, text}, acc, _file), do: acc <> text

  defp write_attrs_with_defaults(attrs),
    do: Enum.reduce(@default_attr ++ attrs, "", &write_attr(&1, &2))

  defp write_attrs([]), do: ""
  defp write_attrs(attrs), do: Enum.reduce(attrs, "", &write_attr(&1, &2))

  defp write_attr({key, {:expr, val, _pos}}, acc), do: acc <> " #{key}={#{val}}"

  defp write_attr({key, {:string, val, %{delimiter: d}}}, acc),
    do: acc <> " #{key}=#{<<d::utf8>>}#{val}#{<<d::utf8>>}"

  defp validate!(tokens, file) do
    Enum.each(tokens, fn
      {:tag_open, tag, attrs, pos} ->
        if !MapSet.member?(@allowed_tags, tag),
          do:
            error("<#{tag}> is not allowed. OK are: #{inspect_mapset(@allowed_tags)}", pos, file)

        validate_individual_attrs!(attrs, pos, file)
        validate_attr_key_set!(tag, attrs, pos, file)

      _ ->
        true
    end)
  end

  @required_position_args MapSet.new(["lon", "lat", "dir"])

  defp validate_individual_attrs!(attrs, pos, file) do
    Enum.each(attrs, fn
      {key, {:string, val, _extra}} when key in ["lat", "lon"] ->
        if !float?(val), do: error("failed to parse #{key}='#{val}' as Float", pos, file)

      {"dir", {:string, val, _extra}} when val not in ["forward", "backward"] ->
        error("dir='#{val}' is unknown, should be 'forward' or 'backward'", pos, file)

      {"bounds", {:string, val, _extra}} ->
        if is_nil(Geo.BoundingBox.parse(val)),
          do: error("failed to parse bounds='#{val}' as bounding box", pos, file)

      {"href", {:string, "/" <> _rest, _extra}} ->
        true

      {"href", {:string, "http" <> _rest, _extra}} ->
        true

      {"href", {:string, url, _extra}} ->
        error("non-absolute href='#{url}' – should start with / or http", pos, file)

      _other ->
        true
    end)
  end

  defp validate_attr_key_set!(tag, attrs, pos, file) do
    keys = Enum.map(attrs, &elem(&1, 0)) |> MapSet.new()

    int = MapSet.intersection(keys, @required_position_args)

    if MapSet.size(int) != 0 && !MapSet.equal?(int, @required_position_args) do
      error(
        "Missing position attributes, expect #{inspect_mapset(@required_position_args)} to be present, but got: #{inspect(attrs)}",
        pos,
        file
      )
    end

    allowed = @allowed_attributes[tag]

    if allowed && !MapSet.subset?(keys, allowed) do
      error(
        "<#{tag}> contains unknown attributes: #{inspect_mapset(MapSet.difference(keys, allowed))}",
        pos,
        file
      )
    end
  end

  defp float?(str) when is_binary(str) do
    case Float.parse(str) do
      {_f, ""} -> true
      _other -> false
    end
  end

  defp error(msg, %{column: column, line: line}, file) do
    raise(Phoenix.LiveView.HTMLTokenizer.ParseError,
      line: line,
      column: column,
      file: file,
      description: msg
    )
  end

  defp inspect_mapset(ms), do: inspect(MapSet.to_list(ms))
end
