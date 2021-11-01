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
      def links(_assigns), do: []
      def id, do: nil
      def color, do: nil
      def route_group, do: nil
      def icon, do: nil

      def path(query \\ nil)
      def path(nil), do: "/#{name()}"
      def path(query) when is_map(query), do: "/#{name()}?#{URI.encode_query(query)}"

      defoverridable Article.Behaviour

      # get heex with global assigns
      import Phoenix.LiveView
      import Phoenix.LiveView.Helpers, except: [sigil_H: 2]

      defmacro sigil_H({:<<>>, meta, [expr]}, []) do
        options = [
          engine: Phoenix.LiveView.HTMLEngine,
          file: __CALLER__.file,
          line: __CALLER__.line,
          module: __CALLER__.module,
          indentation: meta[:indentation] || 0
        ]

        if String.contains?(expr, "</a>"), do: raise("got invalid html tag: </a>")

        expr
        |> String.replace(
          ~r{<\.([a-z_]+)([ />])},
          "<.\\1 type={@type} current_page={@current_page}\\2"
        )
        |> EEx.compile_string(options)
      end
    end
  end
end
