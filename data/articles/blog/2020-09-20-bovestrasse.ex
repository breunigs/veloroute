defmodule Data.Article.Blog.Bovestrasse do
  use Article.Default

  def created_at(), do: ~D[2020-09-20]

  def title(), do: "Bovestraße (Veloroute 7)"

  def start(), do: ~d[2021-07-01]
  def stop(), do: ~d[2022-05-31]

  def type(), do: :finished
  def construction_site_id_hh(), do: [15556]
  def tags(), do: ["7"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/14322164/275fdd9a6ecd04db5d2e9e5afb881c5a/data/bovestrasse-von-gehoelzweg-bis-juethornstrasse-abgestimmte-planung-bericht.pdf"},
      {"Plan",
       "https://lsbg.hamburg.de/contentblob/14322170/28a27688c7ace23e3a3072a6b3a41093/data/bovestrasse-von-gehoelzweg-bis-juethornstrasse-abgestimmte-planung-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Es gibt keine Radverkehrsführung in der Bovestraße. Wer mit dem Fahrrad unterwegs ist hat die Wahl zwischen der <.ref name="fahrbahn-und-nebenflaechen">Fahrbahn</.ref> (viel und schneller motorisierter Verkehr) oder dem viel zu schmalen <.ref name="fahrrad-frei">Fußweg</.ref>. Keine Variante ist attraktiv.</p>
    <h4>Pläne</h4> <p>Im Zuge der Instandhaltung der Straße sollen beidseitig <.ref>Schutzstreifen</.ref> mit je rund 1,5m Breite eingerichtet werden. Damit diese Platz finden werden im markierten Abschnitt alle sechs Bäume auf der Westseite gefällt und auch die Längsparkplätze entfallen. Gebaut werden soll ursprünglich für drei Monate in 2021 – als man alte Straßenbahnschienen fand erhöhte man die vermutete Bauzeit auf ein knappes Jahr.</p>
    <h4>Meinung</h4> <p>Für den Radverkehr wurde vergleichsweise viel herausgeholt. Weitere Verbesserungen würden eine grundlegende Überarbeitung der Straße erfordern – etwa Grundstückzukauf, Fällen aller Bäume oder die Einrichtung einer KFZ-Einbahnstraße. Die Planung wird sich daran messen müssen, ob die Fußwege künftig frei von Radfahrenden sind – wenn nicht muss nachgebessert werden.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
