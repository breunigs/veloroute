defmodule Components.ValidatingDefaultSettingEngine do
  @moduledoc """
  A small wrapper around Phoenix.LiveView.HTMLEngine that injects default
  attributes into each function call. It also raises for undesired usage.
  """

  @allowed_attributes %{
    ".a" => ~w/href name/,
    ".m" => ~w/bounds dir lon lat ref/,
    ".ref" => ~w/name/
  }

  @allowed_tags ~w/
    h3 h4 h5
    ol ul li
    img
    table tr td
    br p
    span em strong b i s abbr
    label input form
  /

  @behaviour EEx.Engine

  @impl true
  defdelegate init(opts), to: Phoenix.LiveView.HTMLEngine

  @impl true
  def handle_body(%{tokens: tokens, file: file} = state) do
    validate!(tokens, file)

    tokens =
      Enum.map(tokens, fn
        {:tag_open, "." <> func, attr, pos} ->
          {:tag_open, ".#{func}", add_default_attr(attr, pos), pos}

        token ->
          token
      end)

    Phoenix.LiveView.HTMLEngine.handle_body(%{state | tokens: tokens})
  end

  @impl true
  defdelegate handle_begin(state), to: Phoenix.LiveView.HTMLEngine

  @impl true
  defdelegate handle_end(state), to: Phoenix.LiveView.HTMLEngine

  @impl true
  defdelegate handle_text(state, meta, text), to: Phoenix.LiveView.HTMLEngine

  @impl true
  defdelegate handle_expr(state, marker, expr), to: Phoenix.LiveView.HTMLEngine

  defp validate!(tokens, file) do
    Enum.each(tokens, fn
      {:tag_open, tag, attrs, pos} ->
        if !tag_allowed?(tag),
          do: error("<#{tag}> is not allowed. OK are: #{inspect(@allowed_tags)}", pos, file)

        validate_individual_attrs!(attrs, pos, file)
        validate_attr_key_set!(tag, attrs, pos, file)

      _ ->
        true
    end)
  end

  defp tag_allowed?(tag)
  defp tag_allowed?("." <> _rest), do: true
  defp tag_allowed?(tag), do: Enum.member?(@allowed_tags, tag)

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

      {"href", {:string, "mailto:" <> _rest, _extra}} ->
        true

      {"href", {:string, url, _extra}} ->
        error("non-absolute href='#{url}' – should start with / or http", pos, file)

      _other ->
        true
    end)
  end

  defp add_default_attr(attrs, pos) do
    pos = Map.take(pos, [:line, :column])

    [
      {"render_target", {:expr, "@render_target", pos}},
      {"current_page", {:expr, "@current_page", pos}}
    ] ++ attrs
  end

  @required_position_args ["lon", "lat", "dir"]
  defp validate_attr_key_set!(tag, attrs, pos, file) do
    keys = Enum.map(attrs, &elem(&1, 0))

    has_all = Enum.all?(@required_position_args, &Enum.member?(keys, &1))
    has_some = has_all || Enum.any?(@required_position_args, &Enum.member?(keys, &1))

    if has_some && !has_all do
      error(
        "Missing position attributes, expect #{inspect(@required_position_args)} to be present, but got: #{inspect(attrs)}",
        pos,
        file
      )
    end

    with allowed when is_list(allowed) <- @allowed_attributes[tag],
         unknown when unknown != [] <-
           Enum.reject(keys, &Enum.member?(@allowed_attributes[tag], &1)) do
      error(
        "<#{tag}> contains unknown attributes: #{inspect(unknown)}",
        pos,
        file
      )
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

  # Returns true if a given string can be *fully* parsed into a float
  defp float?(str) when is_binary(str) do
    case Float.parse(str) do
      {_f, ""} -> true
      _other -> false
    end
  end
end
