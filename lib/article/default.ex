defmodule Article.Default do
  defmacro __using__(_opts) do
    quote location: :keep do
      @behaviour Article

      import Data.RoughDate, only: [sigil_d: 2]

      def name(), do: unquote(Article.auto_generate_name(__CALLER__.module))
      def updated_at, do: created_at()
      def start, do: Data.RoughDate.zero()
      def stop, do: Data.RoughDate.zero()
      def construction_site_id_hh, do: []
      def summary, do: ""
      def tracks, do: []
      def point_of_interest, do: nil
      def links(_assigns), do: []
      def id, do: nil
      def display_id, do: id()
      def color, do: nil
      def route_group, do: nil
      def icon, do: type()

      defoverridable Article
      use Components.EnhancedHeex
    end
  end
end
