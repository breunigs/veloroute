defmodule Data.Article.Blog.Bovestrasse do
  use Article.Default

  def name(), do: "#{created_at()}-bovestrasse"
  def created_at(), do: ~D[2020-09-20]

  def title(), do: "Bovestraße (Veloroute 7)"

  def start(), do: ~d[2021-07-01]
  def stop(), do: ~d[2022-05-31]

  def type(), do: :construction
  def construction_site_id_hh(), do: [15556]
  def tags(), do: [7]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4> <p>Es gibt keine Radverkehrsführung in der Bovestraße. Wer mit dem Fahrrad unterwegs ist hat die Wahl zwischen der <ref name="fahrbahn-und-nebenflaechen">Fahrbahn</ref> (viel und schneller motorisierter Verkehr) oder dem viel zu schmalen <ref name="fahrrad-frei">Fußweg</ref>. Keine Variante ist attraktiv.</p>
    <h4>Pläne</h4> <p>Im Zuge der Instandhaltung der Straße sollen beidseitig <ref>Schutzstreifen</ref> mit je rund 1,5m Breite eingerichtet werden. Damit diese Platz finden werden im markierten Abschnitt alle sechs Bäume auf der Westseite gefällt und auch die Längsparkplätze entfallen. Gebaut werden soll voraussichtlich für drei Monate in 2021.</p>
    <h4>Meinung</h4> <p>Für den Radverkehr wurde vergleichsweise viel herausgeholt. Weitere Verbesserungen würden eine grundlegende Überarbeitung der Straße erfordern – etwa Grundstückzukauf, Fällen aller Bäume oder die Einrichtung einer KFZ-Einbahnstraße. Die Planung wird sich daran messen müssen, ob die Fußwege künftig frei von Radfahrenden sind – wenn nicht muss nachgebessert werden.</p>
    <h4>Quelle</h4> <p>
    <.a href="https://lsbg.hamburg.de/contentblob/14322164/275fdd9a6ecd04db5d2e9e5afb881c5a/data/bovestrasse-von-gehoelzweg-bis-juethornstrasse-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a> und
    <.a href="https://lsbg.hamburg.de/contentblob/14322170/28a27688c7ace23e3a3072a6b3a41093/data/bovestrasse-von-gehoelzweg-bis-juethornstrasse-abgestimmte-planung-plan.pdf">Plan</.a> (beide LSBG)<br>
    <.a href="https://lsbg.hamburg.de/contentblob/15174878/d1f42229e11309b85638ab5be6544e1b/data/bovestrasse-07-2021-bis-11-2021.pdf">Baustelleninfo</.a> (Oktober 2021)
    </p>
    """
  end
end
