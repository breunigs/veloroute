defmodule Data.Article.Blog.ElbchausseeBisLiebermannstrasse do
  use Article.Default

  def title(), do: "Elbchaussee (Parkstraße bis Liebermannstraße)"

  def summary(),
    do:
      "Kopenhagener Radwege oder Radfahrstreifen, die fast durchgängig sind. Ausnahme bleiben wie in Hamburg üblich die Bushaltestellen."

  def type(), do: :intent

  def tags(), do: ["radroute-concept-a"]
  def start(), do: ~d[2026-06]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Fertiger Entwurf, Karte und Erläuterungen", ~d[2026-05],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1018264"},
      {"Präsentation Umbau", ~d[2026-02],
       "https://fragdenstaat.de/anfrage/elbchaussee-parkstrasse-liebermannstrasse/#nachricht-1090730"},
      {"Infoseite der Stadt", "https://lsbg.hamburg.de/elbchaussee"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"Inros Lackner SE", "https://www.inros-lackner.de/de"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt keine Radwege. Es muss auf überbreiten Fahrspuren im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Beidseitig sollen eigene Radwege entstehen. Teils als <.ref>Kopenhagener Radwege</.ref> (Hellrosa im Plan) teils als <.ref>Radfahrstreifen</.ref> (gleiches Pink wie der Rest der Fahrbahn).</p>

    <p>An Bushaltestellen wird der Radweg unterbrochen. Wer nicht hinter dem Bus warten möchte, muss sich dann in den KFZ-Verkehr einordnen. Ausnahme: an der <.v bounds="9.885845,53.546041,9.889217,53.546956" lon={9.887183} lat={53.546437} dir="forward" ref={RadrouteConceptA}>Haltestelle Halbmondsweg in Richtung Altona</.v> wird ein Bypass gebaut, ähnlich wie <.v bounds="9.990756,53.581768,9.997772,53.585309" lon={9.995251} lat={53.583666} dir="backward" ref={BrEimsbuettelIsebek}>an der Streekbrücke</.v>.</p>

    <p>An den größeren Einmündungen ist <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Bei kleineren Nebenstraßen soll <.ref>direkt abgebogen</.ref> werden. Wer sich das nicht zutraut, kann meist eine Fußgängerampel als <.ref>Querungshilfe</.ref> nutzen.</p>

    <h4>Meinung</h4>
    <p>Der (fast) durchgängige und vom KFZ-Verkehr getrennte Radweg klingt gut. Die Unterbrechung an den Bushaltestellen ist zwar ärgerlich, aber besser als den Radverkehr durch den Einstiegsbereich der Fahrgäste zu führen.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
