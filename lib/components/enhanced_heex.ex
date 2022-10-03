defmodule Components.EnhancedHeex do
  defmacro __using__(opts \\ []) do
    quote bind_quoted: [opts: opts] do
      import Kernel, except: [def: 2, defp: 2]
      import Phoenix.Component, except: [sigil_H: 2]
      import Phoenix.Component.Declarative
      import Phoenix.LiveView.Helpers
      import Components.TagHelpers
      import Components.RelatedArticlesHelper
      import Components.EnhancedHeex

      for {prefix_match, value} <- Phoenix.Component.Declarative.__setup__(__MODULE__, opts) do
        def __global__?(unquote(prefix_match)), do: unquote(value)
      end
    end
  end

  defmacro sigil_H({:<<>>, meta, [expr]}, []) do
    unless Macro.Env.has_var?(__CALLER__, {:assigns, nil}) do
      raise "~H requires a variable named \"assigns\" to exist and be set to a map"
    end

    options = [
      engine: Components.DefaultSettingEngine,
      file: __CALLER__.file,
      line: __CALLER__.line + 1,
      caller: __CALLER__,
      indentation: meta[:indentation] || 0
    ]

    EEx.compile_string(expr, options)
  end
end
