defmodule Basemap.DasharrayExpander do
  @moduledoc """
  Expands data-driven `line-dasharray` expressions into individual layers with
  static dasharrays (and statically resolved co-varying layout/paint properties).

  MapLibre GL (web) supports property-based dasharray expressions and
  data-driven layout properties like `line-cap`, but MapLibre Native (the
  server-side renderer) does not. This module is applied when generating the
  `.local` style variant so mbgl-render only sees static values.

  The expander works by recursively enumerating all "leaf paths" through the
  dasharray expression — each leaf is a set of feature-property conditions
  leading to a constant dasharray. Each leaf path becomes one expanded layer.

  After determining the conditions for a leaf, all other data-driven expressions
  in the layer (layout and paint) are also evaluated against those conditions.
  If they can be fully resolved to a constant they are replaced; otherwise they
  are left as-is.

  Supported dasharray primitives (can be arbitrarily nested):
  - `["literal", value]`
  - `["match", ["get", prop], val1, expr1, ..., default_expr]`
  - `["case", cond1, expr1, ..., default_expr]`

  Any other expression that references a feature property raises at expansion
  time (fail-fast to catch unhandled patterns early).
  """

  @doc "Expand all data-driven dasharray layers in the style."
  def expand(%{"layers" => layers} = style) do
    %{style | "layers" => Enum.flat_map(layers, &expand_layer/1)}
  end

  def expand(style), do: style

  # No dasharray → pass through unchanged.
  defp expand_layer(%{"paint" => paint} = layer) when not is_map_key(paint, "line-dasharray") do
    [layer]
  end

  # Static dasharray (no feature-property references) → pass through unchanged.
  defp expand_layer(%{"paint" => %{"line-dasharray" => dasharray}} = layer)
       when is_list(dasharray) do
    if get_properties(dasharray) == [] do
      [layer]
    else
      leaves = enumerate_leaves(dasharray)

      Enum.map(leaves, fn {conditions, static_dasharray} ->
        known = conditions_to_known_values(conditions)

        layer
        |> append_all_filters(conditions)
        |> set_dasharray(static_dasharray)
        |> resolve_dynamic_layout(known)
        |> simplify_layer_filter(known)
        |> suffix_id(conditions_to_suffix(conditions))
      end)
    end
  end

  defp expand_layer(layer), do: [layer]

  # ---------------------------------------------------------------------------
  # Leaf enumeration
  # ---------------------------------------------------------------------------

  defp enumerate_leaves(["literal", v]) do
    [{[], v}]
  end

  defp enumerate_leaves(["match", ["get", prop] | rest]) do
    {pairs, default_expr} = parse_match_pairs(rest, [])
    explicit_values = Enum.map(pairs, fn {v, _} -> v end)

    explicit_leaves =
      Enum.flat_map(pairs, fn {value, branch_expr} ->
        Enum.map(enumerate_leaves(branch_expr), fn {conds, v} ->
          {[["==", ["get", prop], value] | conds], v}
        end)
      end)

    default_leaves =
      Enum.map(enumerate_leaves(default_expr), fn {conds, v} ->
        {[["match", ["get", prop], explicit_values, false, true] | conds], v}
      end)

    explicit_leaves ++ default_leaves
  end

  defp enumerate_leaves(["case" | pairs]) do
    collect_case_leaves(pairs, [])
  end

  defp enumerate_leaves(expr) do
    if get_properties(expr) != [] do
      raise "Unsupported line-dasharray expression referencing #{inspect(get_properties(expr))}: #{inspect(expr)}"
    end

    [{[], expr}]
  end

  defp collect_case_leaves([default_expr], neg_conditions) do
    Enum.map(enumerate_leaves(default_expr), fn {conds, v} ->
      {neg_conditions ++ conds, v}
    end)
  end

  defp collect_case_leaves([cond_expr, then_expr | rest], neg_conditions) do
    true_leaves =
      Enum.map(enumerate_leaves(then_expr), fn {conds, v} ->
        {neg_conditions ++ [cond_expr | conds], v}
      end)

    false_leaves = collect_case_leaves(rest, neg_conditions ++ [negate_condition(cond_expr)])

    true_leaves ++ false_leaves
  end

  defp negate_condition(["==", a, b]), do: ["!=", a, b]
  defp negate_condition(["!=", a, b]), do: ["==", a, b]
  defp negate_condition(expr), do: ["!", expr]

  # ---------------------------------------------------------------------------
  # Simplify filter expressions using known property values
  # ---------------------------------------------------------------------------

  # Simplify the layer's filter using known property values from the leaf.
  # Removes conditions that are trivially true; if the whole filter is true, drops it.
  defp simplify_layer_filter(%{"filter" => filter} = layer, known) do
    case simplify_expr(filter, known) do
      true -> Map.delete(layer, "filter")
      false -> Map.put(layer, "filter", false)
      simplified -> %{layer | "filter" => simplified}
    end
  end

  defp simplify_layer_filter(layer, _known), do: layer

  defp simplify_expr(true, _known), do: true
  defp simplify_expr(false, _known), do: false

  defp simplify_expr(["all" | conds], known) do
    simplified =
      Enum.reduce_while(conds, [], fn c, acc ->
        case simplify_expr(c, known) do
          true -> {:cont, acc}
          false -> {:halt, :short_circuit_false}
          other -> {:cont, [other | acc]}
        end
      end)

    case simplified do
      :short_circuit_false -> false
      [] -> true
      [single] -> single
      many -> ["all" | Enum.reverse(many)]
    end
  end

  defp simplify_expr(["case" | rest], known), do: simplify_case(rest, known)

  defp simplify_expr(expr, known) do
    case eval_condition(expr, known) do
      :unknown -> expr
      result -> result
    end
  end

  defp simplify_case([default], known), do: simplify_expr(default, known)

  defp simplify_case([cond_expr, then_expr | rest], known) do
    case eval_condition(cond_expr, known) do
      true -> simplify_expr(then_expr, known)
      false -> simplify_case(rest, known)
      # Can't determine — leave the entire case expression as-is
      :unknown -> ["case", cond_expr, then_expr | rest]
    end
  end

  # ---------------------------------------------------------------------------
  # Resolve co-varying data-driven layout properties
  # ---------------------------------------------------------------------------

  # For each layout property that still contains feature-property references,
  # try to evaluate it using the known values derived from this leaf's conditions.
  # If evaluation succeeds replace the expression with the static value.
  defp resolve_dynamic_layout(%{"layout" => layout} = layer, known) do
    resolved =
      Map.new(layout, fn {k, v} ->
        if get_properties(v) != [] do
          case evaluate_known(v, known) do
            {:ok, static} -> {k, static}
            :unknown -> {k, v}
          end
        else
          {k, v}
        end
      end)

    %{layer | "layout" => resolved}
  end

  defp resolve_dynamic_layout(layer, _known), do: layer

  # Evaluate an expression to a constant given known property values.
  defp evaluate_known(["literal", v], _), do: {:ok, v}
  defp evaluate_known(v, _) when not is_list(v), do: {:ok, v}

  defp evaluate_known(["match", ["get", prop] | rest], known) do
    {pairs, default_expr} = parse_match_pairs(rest, [])

    case Map.fetch(known, prop) do
      {:ok, {:exact, val}} ->
        case Enum.find(pairs, fn {v, _} -> v == val end) do
          {_, branch} -> evaluate_known(branch, known)
          nil -> evaluate_known(default_expr, known)
        end

      _ ->
        :unknown
    end
  end

  defp evaluate_known(["case" | pairs], known) do
    evaluate_case_known(pairs, known)
  end

  defp evaluate_known(_, _), do: :unknown

  defp evaluate_case_known([default], known), do: evaluate_known(default, known)

  defp evaluate_case_known([cond_expr, val_expr | rest], known) do
    case eval_condition(cond_expr, known) do
      true -> evaluate_known(val_expr, known)
      false -> evaluate_case_known(rest, known)
      :unknown -> :unknown
    end
  end

  defp eval_condition(["==", ["get", prop], val], known) do
    case Map.fetch(known, prop) do
      {:ok, {:exact, kval}} -> if kval == val, do: true, else: false
      {:ok, {:not_exact, other}} -> if val == other, do: false, else: :unknown
      {:ok, {:not_in, others}} -> if val in others, do: false, else: :unknown
      _ -> :unknown
    end
  end

  defp eval_condition(["!=", ["get", prop], val], known) do
    case eval_condition(["==", ["get", prop], val], known) do
      true -> false
      false -> true
      :unknown -> :unknown
    end
  end

  defp eval_condition(_, _), do: :unknown

  # Build a map of known property values from leaf filter conditions.
  defp conditions_to_known_values(conditions) do
    Enum.reduce(conditions, %{}, fn
      ["==", ["get", prop], val], acc -> Map.put(acc, prop, {:exact, val})
      ["!=", ["get", prop], val], acc -> Map.put(acc, prop, {:not_exact, val})
      ["match", ["get", prop], vals, false, true], acc -> Map.put(acc, prop, {:not_in, vals})
      _, acc -> acc
    end)
  end

  # ---------------------------------------------------------------------------
  # Helpers
  # ---------------------------------------------------------------------------

  defp get_properties(["get", prop]), do: [prop]

  defp get_properties(list) when is_list(list),
    do: list |> Enum.flat_map(&get_properties/1) |> Enum.uniq()

  defp get_properties(_), do: []

  defp parse_match_pairs([default_expr], acc), do: {Enum.reverse(acc), default_expr}

  defp parse_match_pairs([value, branch_expr | rest], acc) do
    parse_match_pairs(rest, [{value, branch_expr} | acc])
  end

  defp append_all_filters(layer, conditions) do
    Enum.reduce(conditions, layer, &append_filter(&2, &1))
  end

  defp append_filter(%{"filter" => ["all" | rest]} = layer, cond) do
    %{layer | "filter" => ["all" | rest ++ [cond]]}
  end

  defp append_filter(%{"filter" => existing} = layer, cond) do
    %{layer | "filter" => ["all", existing, cond]}
  end

  defp append_filter(layer, cond) do
    Map.put(layer, "filter", cond)
  end

  defp set_dasharray(layer, [1, 0]) do
    update_in(layer, ["paint"], &Map.delete(&1, "line-dasharray"))
  end

  defp set_dasharray(layer, dasharray) do
    put_in(layer, ["paint", "line-dasharray"], dasharray)
  end

  defp suffix_id(%{"id" => id} = layer, suffix) do
    %{layer | "id" => id <> suffix}
  end

  defp conditions_to_suffix(conditions) do
    Enum.map_join(conditions, "", &condition_to_part/1)
  end

  defp condition_to_part(["==", ["get", prop], value]), do: "--#{prop}-#{value}"
  defp condition_to_part(["!=", ["get", prop], value]), do: "--#{prop}-not-#{value}"
  defp condition_to_part(["match", ["get", prop], _values, false, true]), do: "--#{prop}-default"
  defp condition_to_part(cond), do: "--cond-#{:erlang.phash2(cond)}"
end
