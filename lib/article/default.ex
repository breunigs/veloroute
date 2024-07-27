defmodule Article.Default do
  defmacro __using__(_opts) do
    quote location: :keep do
      @behaviour Article

      import Data.RoughDate, only: [sigil_d: 2]

      def name(), do: unquote(Article.auto_generate_name(__CALLER__.module))
      def created_at, do: unquote(Macro.escape(Article.auto_generate_created_at(__CALLER__.file)))
      def updated_at, do: created_at()
      def start, do: Data.RoughDate.zero()
      def stop, do: Data.RoughDate.zero()
      def construction_site_id_hh, do: []
      def tracks, do: []
      def point_of_interest, do: nil
      def links(_assigns), do: []
      def id, do: nil
      def display_id, do: id()
      def color, do: nil
      def color_faded, do: nil
      def route_group, do: nil
      def icon, do: type()

      def map_image(), do: nil
      def languages(), do: [Settings.default_language()]

      def compiled_at(), do: unquote(Macro.escape(DateTime.utc_now()))

      defoverridable Article

      use Phoenix.Component
      import Components.TagHelpers
      import Components.RelatedArticlesHelper

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    s0 = Module.defines?(__CALLER__.module, {:summary, 0})
    s1 = Module.defines?(__CALLER__.module, {:summary, 1})

    cond do
      s0 && s1 ->
        raise("#{__CALLER__.module} should only specify either summary/0 or summary/1")

      s0 && !s1 ->
        quote do
          def summary(_lang), do: summary()
        end

      !s0 && s1 ->
        quote do
          def summary(), do: summary(Settings.default_language())
        end

      !s0 && !s1 ->
        quote do
          def summary(), do: ""
          def summary(_lang), do: ""
        end
    end
  end
end
