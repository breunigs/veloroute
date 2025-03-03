defmodule Article.Static do
  defmacro __using__(_opts) do
    quote do
      use Article.Default
      import Components.GraphIcon

      def created_at, do: nil
      defoverridable created_at: 0
      def type, do: nil

      def microdata?(), do: false
      def microdata(_), do: []
    end
  end
end
