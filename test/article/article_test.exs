defmodule ArticleTest do
  use ExUnit.Case, async: true

  test "all articles can be rendered" do
    render_issues =
      Article.List.all()
      |> Parallel.map(fn art ->
        try do
          _content =
            Article.Decorators.html(art, %{
              __changed__: %{},
              render_target: :html,
              search_query: nil,
              search_bounds: nil
            })

          nil
        rescue
          err -> "#### #{art} ####\n\n#{Exception.format(:error, err, __STACKTRACE__)}"
        end
      end)
      |> Util.compact()

    assert [] == render_issues, Enum.join(render_issues, "\n\n\n")
  end

  test "names consist of allowed characters only" do
    bad_names =
      Article.List.all()
      |> Enum.reject(&String.match?(&1.name(), ~r{^[a-z0-9/-]*$}))
      |> Enum.map(
        &"Expected #{&1}'s name to consist only of lowercase alpha, numbers, slash and dash but got: #{&1.name()}"
      )

    assert [] == bad_names
  end
end
