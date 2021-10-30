defmodule Article.Default do
  defmacro __using__(_opts) do
    quote do
      @behaviour Article.Behaviour

      import Data.RoughDate, only: [sigil_d: 2]
      import TagHelpers
      import LinkHelpers

      def updated_at, do: created_at()
      def start, do: Data.RoughDate.zero()
      def stop, do: Data.RoughDate.zero()
      def construction_site_id_hh, do: []
      def summary, do: ""
      def tracks, do: []
      def path, do: "/#{name()}"
      def links, do: []
      defoverridable Article.Behaviour

      # get heex with global assigns
      import Phoenix.LiveView
      import Phoenix.LiveView.Helpers, except: [sigil_H: 2]

      defmacro sigil_H({:<<>>, meta, [expr]}, []) do
        options = [
          engine: Phoenix.LiveView.HTMLEngine,
          file: __CALLER__.file,
          line: __CALLER__.line + 1,
          module: __CALLER__.module,
          indentation: meta[:indentation] || 0
        ]

        if String.contains?(expr, "<icon "), do: raise("got invalid html tag: icon")
        if String.contains?(expr, "<geolinks "), do: raise("got invalid html tag: geolinks")
        if String.contains?(expr, "<a bounds="), do: raise("got invalid html tag: <a bounds")

        expr
        |> String.replace(~r/<\.([a-z]+) /, "<.\\1 type={@type} current_page={@current_page}")
        |> EEx.compile_string(options)
      end
    end
  end
end
