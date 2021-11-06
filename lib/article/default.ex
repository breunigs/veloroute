defmodule Article.Default do
  defmacro __using__(_opts) do
    quote do
      @behaviour Article

      import Data.RoughDate, only: [sigil_d: 2]
      import Components.TagHelpers
      import Components.RelatedArticlesHelper

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
      def icon, do: :issue

      defoverridable Article

      use Components.EnhancedHeex
    end
  end
end
