defmodule Article.Default do
  defmacro __using__(_opts) do
    quote do
      @behaviour Article.Behaviour
      use Phoenix.Component

      import Data.RoughDate, only: [sigil_d: 2]
      import TagHelpers
      import LinkHelpers

      def updated_at, do: created_at()
      def start, do: nil
      def stop, do: nil
      def construction_site_id_hh, do: []
      def summary, do: ""
      def tracks, do: []

      defoverridable Article.Behaviour
    end
  end
end
