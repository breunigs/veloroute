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
      """
  end

  test "text extraction" do
    assert "text link paid Radfahrstreifen" == Article.Decorators.text(FakeArticle) |> multi_trim
  end

  test "HTML format" do
    assert String.trim("""
           <i>text</i>
           <a href="http://example.com" target="_blank">link</a>
           <a href="http://abendblatt.de" rel="nofollow" target="_blank">paid</a>
           <a class="ref" href="/lexikon/radfahrstreifen">Radfahrstreifen</a>
           """) ==
             Article.Decorators.html(FakeArticle, %{__changed__: %{}, render_target: :html})
  end

  defp multi_trim(str) do
    str
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
  end
end