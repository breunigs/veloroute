defmodule Article.Static do
  defmacro __using__(_opts) do
    quote do
      use Article.Default

      def created_at, do: nil
      def type, do: :static
    end
  end
end
