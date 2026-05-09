defmodule Util.MacroDetectHeaderInText do
  def __on_definition__(env, :def, :text, _args, _guards, body) do
    {_ast, heex_sigil_args} =
      Macro.prewalk(body, nil, fn
        {:sigil_H, _meta, sigil_args} = node, nil -> {node, sigil_args}
        node, found -> {node, found}
      end)

    with [{_string_node, _meta, [template]}, _modifiers] <- heex_sigil_args,
         [header] <- Regex.run(~r/[^<]*<(h[1-6])>/, template, capture: :all_but_first) do
      Module.put_attribute(env.module, :detected_header, header)
    end
  end

  def __on_definition__(_env, _kind, _name, _args, _guards, _body), do: nil
end
