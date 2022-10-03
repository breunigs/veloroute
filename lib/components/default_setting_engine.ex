defmodule Components.DefaultSettingEngine do
  @moduledoc """
  A small wrapper around Phoenix.LiveView.HTMLEngine that injects default
  attributes into each function call.
  """

  @behaviour EEx.Engine

  @impl true
  defdelegate init(opts), to: Phoenix.LiveView.HTMLEngine

  @impl true
  def handle_body(%{tokens: tokens} = state) do
    tokens =
      Enum.map(tokens, fn
        {:tag_open, "." <> func, attr, pos} ->
          known = known_attrs(func, state)
          {:tag_open, ".#{func}", add_default_attr(attr, pos, known), pos}

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

  @default_attr ~w[render_target current_page]a
  defp add_default_attr(attrs, pos, known) do
    pos = Map.take(pos, [:line, :column])

    Enum.reduce(@default_attr, attrs, fn default, attrs ->
      if default in known do
        [{"#{default}", {:expr, "@#{default}", pos}, pos} | attrs]
      else
        attrs
      end
    end)
  end

  defp known_attrs(func, state) do
    func = String.to_existing_atom(func)

    with [function: mod] <- Macro.Env.lookup_import(state.caller, {func, 1}),
         meta when is_map(meta) <- mod.__components__()[func] do
      Enum.map(meta.attrs, & &1.name)
    else
      _ -> []
    end
  end
end
