defmodule Article.DecoratorsTest do
  use ExUnit.Case, async: true

  defmodule FakeArticle do
    use Article.Default

    def name, do: "fake-test-article"
    def type, do: :construction
    def created_at, do: ~D[2021-11-11]
    def tags, do: []
    def title, do: "title"
    def text(assigns), do: ~H{<i>text</i> <.a href="http://example.com">link</.a>}
  end

  test "text extraction" do
    assert "text link" == Article.Decorators.text(FakeArticle) |> multi_trim
  end

  test "HTML format" do
    assert ~s{<i>text</i> <a href="http://example.com" target="_blank">link</a>} ==
             Article.Decorators.html(FakeArticle, %{__changed__: %{}, render_target: :html})
  end

  defp multi_trim(str) do
    str
    |> String.replace(~r/\s+/, " ")
    |> String.trim()
  end
end
