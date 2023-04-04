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
              search_query: nil,
              search_bounds: nil,
              limit_to_map_bounds: false
            })

          nil
        rescue
          err -> "#### #{art} ####\n\n#{Exception.format(:error, err, __STACKTRACE__)}"
        end
      end)
      |> Util.compact()

    assert [] == render_issues, Enum.join(render_issues, "\n\n\n")
  end

  test "articles do not have duplicated links" do
    duplicated_links =
      Article.List.all()
      |> Enum.filter(fn art ->
        hrefs =
          art.links(%{})
          |> Enum.map(fn
            {_name, _extra, href} -> href
            {_name, href} -> href
            _other -> nil
          end)
          |> Util.compact()

        hrefs != Enum.uniq(hrefs)
      end)

    assert [] == duplicated_links
  end

  test "articles specify color in lower case hex" do
    invalid_colors =
      Article.List.all()
      |> Enum.reject(fn art ->
        art.color() == nil || String.match?(art.color(), ~r/^#([a-f0-9]{3}|[a-f0-9]{6})$/)
      end)

    assert [] == invalid_colors
  end

  test "articles with structured links use the tag" do
    render = fn art, gpx ->
      %{ref: art, gpx: gpx}
      |> Components.TagHelpers.structured_links()
      |> Util.render_heex()
    end

    missing_tag =
      Article.List.all()
      |> Enum.filter(fn art -> length(art.links(%{})) > 0 end)
      |> Enum.reject(fn art ->
        # don't know how to get the raw, so check the render instead
        html = Article.Decorators.html(art)

        String.contains?(html, render.(art, false)) || String.contains?(html, render.(art, true))
      end)

    assert [] == missing_tag
  end

  test "no duplicated tracks" do
    duplicated_tracks =
      Article.List.all()
      |> Enum.reject(fn art ->
        idents = Enum.map(art.tracks(), &{&1.group, &1.direction})
        idents == Enum.uniq(idents)
      end)

    assert [] == duplicated_tracks
  end

  test "newer articles have a summary" do
    missing_sumnmary =
      Article.List.all()
      |> Enum.reject(fn art -> art.updated_at() == nil end)
      |> Enum.filter(fn art -> Date.compare(art.updated_at(), ~D[2022-01-01]) == :gt end)
      |> Enum.filter(fn art -> art.summary() == "" end)

    assert [] == missing_sumnmary
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
