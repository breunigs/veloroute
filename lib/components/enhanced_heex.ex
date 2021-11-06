defmodule Components.EnhancedHeex do
  defmacro __using__(_opts) do
    quote do
      import Phoenix.LiveView
      import Phoenix.LiveView.Helpers, except: [sigil_H: 2]

      defmacro sigil_H({:<<>>, meta, [expr]}, []) do
        options = [
          engine: Components.ValidatingDefaultSettingEngine,
          file: __CALLER__.file,
          line: __CALLER__.line + 1,
          module: __CALLER__.module,
          indentation: meta[:indentation] || 0
        ]

        EEx.compile_string(expr, options)
      end
    end
  end
end
