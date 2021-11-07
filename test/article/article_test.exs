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

  test "names are unique" do
    names = Article.List.all() |> Enum.map(& &1.name())
    duplicated = names -- Enum.uniq(names)
    assert [] == duplicated
  end

  test "all tags are strings only" do
    bad_tags =
      Article.List.all()
      |> Enum.filter(fn art ->
        Enum.any?(art.tags(), fn
          "" <> _tag -> false
          _not_a_binary -> true
        end)
      end)
      |> Enum.map(&{&1, &1.tags()})

    assert [] == bad_tags
  end

  test "auto-generated names are sensible" do
    broken =
      %{
        "2020-06-21-von-essen-strasse" => Data.Article.Blog.VonEssenStrasse,
        "2019-10-09-veloroute-6-aenderungen" => Data.Article.Blog.Veloroute6Aenderungen,
        "alltagsroute-11" => Data.Article.Static.Alltagsroute11,
        "rsw-stade" => Data.Article.Static.RSWStade,
        "changes" => Data.Article.Static.Changes
      }
      |> Enum.map(fn {expected, mod} ->
        quoted = Article.auto_generate_name(mod)
        {actual, _binding} = Code.eval_quoted(quoted)
        if actual != expected, do: %{expected: expected, actual: actual, mod: mod}
      end)
      |> Util.compact()

    assert [] == broken
  end
end
