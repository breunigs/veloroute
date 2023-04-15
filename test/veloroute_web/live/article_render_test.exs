defmodule VelorouteWeb.ArticleRenderTest do
  # Preferably we could just use Parallel.map() to verify all articles
  # concurrently, however LiveView helpers can only run in the same process as
  # the ExUnit test. Instead, we use code generation to create modules that run
  # in parallel (async: true). We don't do this for every article, because the
  # startup cost isn't free.
  arts = Article.List.all()
  n_proc = System.schedulers_online()
  sizes = round(length(arts) / n_proc / 2)
  buckets = arts |> Enum.chunk_every(sizes) |> Enum.with_index()

  for {arts, idx} <- buckets do
    test_mod = Module.concat(VelorouteWeb.ArticleRenderTest, to_string(idx))

    defmodule test_mod do
      use VelorouteWeb.ConnCase, async: true
      import Phoenix.LiveViewTest

      for art <- arts do
        test "article #{art} can be rendered", %{conn: conn} do
          path = Article.Decorators.path(unquote(art))
          {:ok, _view, html} = live(conn, path)

          if path =~ "/article/" && !(html =~ unquote(art).title()) do
            flunk("no title in HTML, even though it's on /article/")
          end
        end
      end
    end
  end
end
