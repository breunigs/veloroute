defmodule Data.Article.Blog.SchimmelmannstrasseW22 do
  use Article.Default

  def name(), do: "#{created_at()}-7-schimmelmannstrasse-w22"
  def created_at(), do: ~D[2018-10-14]
  def updated_at(), do: ~D[2020-02-02]
  def title(), do: "Schimmelmannstraße (Veloroute 7, „Abschnitt W22“)"

  def start(), do: ~d[2019-07]
  def stop(), do: ~d[2020-03]

  def type(), do: :finished

  def tags(), do: ["7", "W22"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Februar 2020:</strong> Die Baustelle ist teilweise fertig und eine durchgängige Fahrt möglich. An den Fußwegen finden noch Baumaßnahmen statt. Neue Bilder werde ich erst vorraussichtlich im Sommer machen.</p> <p>Im wenig befahrenen Westteil der <.m bounds="10.090807,53.569778,10.226157,53.676902">Schimmelmannstraße</.m> sollen die vorhandenen und sehr unebenen Radwege zurückgebaut werden. Stattdessen wird künftig im Mischverkehr mit den KFZ gefahren, was in Anbetracht der geringen Verkehrsmengen zweckmäßig erscheint.</p> <p>Die bisher ungeordneten Parkplätze werden gefasst, sodass zu hoffen ist das künftig weniger im Kreuzungsbereich geparkt wird. Dann sollte durch die gute Einsehbarkeit auch ein zügiges Vorankommen möglich sein.</p> <p>Die Maßnahme soll irgendwann 2019 umgesetzt werden.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008618">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
