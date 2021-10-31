defmodule Data.Article.Blog.VonEssenStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-von-essen-strasse"
  def created_at(), do: ~D[2020-06-21]

  def title(), do: "Von-Essen-Straße (Veloroute 6)"
  def icon(), do: :stau

  def type(), do: :issue

  def tags(), do: [6]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    Die Von-Essen-Straße wird im Berufsverkehr häufig von Autofahrern und -fahrerinnen als Durchgangsstraße missbraucht. Dies bremst den Radverkehr unnötig aus. Das Problem ist seit Jahren bekannt, aber die Stadt tut bislang nichts. Der ADFC hat einen <.a href="https://web.archive.org/web/20201112012320/https://hamburg.adfc.de/verkehr/themen-a-z/velorouten/veloroute-6/veloroute-6-stoerungen-an-von-essen-strasse-bleiben-vorerst/">detaillierten Artikel zu dieser Problemstelle</.a> verfasst.
    """
  end
end
