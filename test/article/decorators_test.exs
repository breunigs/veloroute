defmodule Article.DecoratorsTest do
  use ExUnit.Case, async: true

  defmodule FakeArticle do
    use Article.Default

    def name, do: "fake-test-article"
    def type, do: :construction
    def created_at, do: ~D[2021-11-11]
    def tags, do: []
    def title, do: "title"

    def text(assigns),
      do: ~H"""
      <i>text</i>
      <.a href="http://example.com">link</.a>
      <.a href="http://abendblatt.de">paid</.a>
      <.ref>Radfahrstreifen</.ref>
      <.m bounds="10.116543,53.606325,10.119479,53.607453">bounds-only</.m>
      """
  end

  test "text extraction" do
    assert "text link paid [€] Radfahrstreifen bounds-only" ==
             Article.Decorators.text(FakeArticle) |> multi_trim
  end

  test "HTML format" do
    assert sorted_html("""
           <i>text</i>
           <a href="http://example.com" target="_blank">link</a>
           <a href="http://abendblatt.de" rel="nofollow" target="_blank">paid</a> [€]
           <a href="/lexikon/radfahrstreifen" class="ref" data-phx-link-state="push" data-phx-link="patch" title="Radfahrstreifen sind asphaltierte Radwege direkt neben den KFZ-Spuren">Radfahrstreifen</a>
           <a phx-click="[[&quot;dispatch&quot;,{&quot;detail&quot;:{&quot;name&quot;:&quot;bounds-only&quot;},&quot;event&quot;:&quot;map:ping&quot;,&quot;to&quot;:null}],[&quot;push&quot;,{&quot;event&quot;:&quot;map-zoom-to&quot;,&quot;value&quot;:{&quot;bounds&quot;:&quot;10.116543,53.606325,10.119479,53.607453&quot;}}]]">bounds-only</a>
           """) ==
             sorted_html(Article.Decorators.html(FakeArticle))
  end

  defp multi_trim(str) do
    str
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
  end

  defp sorted_html(str) do
    str
    |>    Floki.parse_fragment!()
    |> Enum.map(fn
      {tag, args, body} -> {tag, sorted_arguments(args),body}
      other -> other
    end)
  end

  defp sorted_arguments(list) do
    list
    |> Enum.map(fn
      {"phx-click", json} -> json |> Jason.decode!() |> Enum.sort()
      other -> other
    end)
    |> Enum.sort()
  end
end
