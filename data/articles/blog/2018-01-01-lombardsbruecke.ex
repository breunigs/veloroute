defmodule Data.Article.Blog.Lombardsbruecke do
  use Article.Default

  def created_at(), do: ~D[2018-01-01]

  def title(), do: "Lombardsbrücke (1. Grüner Ring und Freizeitroute 1)"

  def start(), do: ~d[2019-11-02]
  def stop(), do: ~d[2022-09-30]
  def construction_site_id_hh(), do: [12465]

  def type(), do: :finished

  def tags(), do: ["1GR", "FR1"]

  def links(_assigns) do
    [
      {"Infoseite der Stadt",
       "https://web.archive.org/web/20220929043504/https://lsbg.hamburg.de/konstruktive-ingenieurbauwerke/4460568/instandsetzung-lombardsbruecke/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Die Lombardsbrücke wird saniert. Deswegen ist der Unterführung unter der Brücke vollgesperrt, die <.a name="FR1">Freizeitroute 1</.a> entsprechend unterbrochen. Entlang des <.a name="erster-gruener-ring">1. Grünen Rings</.a> ist eine Fahrt möglich, die Breite aber stark eingeengt.</p>

    <h4>Weiterführende Informationen</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
