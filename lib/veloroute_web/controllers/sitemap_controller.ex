defmodule VelorouteWeb.SitemapController do
  use VelorouteWeb, :controller

  def sitemap(conn, _params) do
    conn
    |> put_resp_content_type("application/xml")
    |> text(get())
  end

  defp get() do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    #{Enum.join(urls(), "\n")}
    </urlset>
    """
  end

  defp urls() do
    Enum.flat_map(Article.List.all(), fn art ->
      date_tag =
        if art.updated_at(),
          do: "<lastmod>#{Date.to_iso8601(art.updated_at())}</lastmod>"

      Enum.map(art.languages(), fn lang ->
        "<url><loc>#{Article.Decorators.url(art, lang)}</loc>#{date_tag}</url>"
      end)
    end)
  end
end
