defmodule Data.Article.Blog.FarmsenerLandstrasse1 do
  use Article.Default

  def title(), do: "Farmsener Landstraße – zwischen Saseler Weg und Halenreie (Bezirksroute W6)"

  def summary(),
    do:
      "Zweirichtungsradweg soll das Gehwegradeln reduzieren. Die Überleitungen jeweils am Ende sind mangelhaft."

  def type(), do: :construction
  def tags(), do: ["br-wandsbek-w6"]

  def start(), do: ~d[2026-04-27]
  def stop(), do: ~d[2026-06-20]

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-04],
       "https://lsbg.hamburg.de/resource/blob/1168122/b1613c4a4f06ba5a0feaa9fa8108c57a/farmsener-landstrasse-anliegerinformation-april-2026-data.pdf"},
      {"Fertiger Entwurf – Erläuterungen", ~d[2025-02],
       "https://lsbg.hamburg.de/resource/blob/1024136/7da42b914a7249b33a815471cc4ec231/farmsener-landstrasse-zweirichtungsradweg-abgestimmte-planung-bericht-data.pdf"},
      {"Fertiger Entwurf – Karte", ~d[2025-02],
       "https://lsbg.hamburg.de/resource/blob/1024140/f77dae0a488ff6c91c0a796eaf6b719e/farmsener-landstrasse-zweirichtungsradweg-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungen und Karten, 1. Entwurf", ~d[2025-01],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1022004"}
    ]
  end

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Abschnitt ist nur ein kurzes Stück <.ref>Hochbordradweg</.ref> vorm Saseler Weg vorhanden. Ansonsten muss überall auf der <.ref>Fahrbahn</.ref> geradelt werden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Zwischen <.v bounds="10.159512,53.649549,10.162809,53.651448" lon={10.161451} lat={53.650238} dir="backward" ref={BrWandsbekW6}>Halenreie</.v> und <.v bounds="10.156182,53.64812,10.15882,53.649538" lon={10.15809} lat={53.648931} dir="backward" ref={BrWandsbekW6}>Saseler Weg</.v> soll auf der nördlichen Straßenseite ein Zweirichtungsradweg angelegt werden.</p>

    <p>Beim Kreisel ist ein Übergang auf den Gehweg mit <.ref>Fahrrad frei</.ref> vorgesehen. Am Saseler Weg soll dagegen auf die <.ref>Fahrbahn</.ref> gewechselt werden, wozu ein Stummel-<.ref>Schutzstreifen</.ref> aufgemalt wird.</p>

    <h4>Meinung</h4>
    <p>Das größte Problem ist die mangelhafte Überleitung jeweils am Ende des Zweirichtungsradwegs.</p>

    <p>Beim Kreisel setzt man auf Schilderwald statt intuitiver Führung, was zu viel illegalem Gehwegradeln führen dürfte.</p>

    <p>Beim Saseler Weg ist es noch schlimmer. Wer der Farmsener Landstraße geradeaus folgen will, muss gleichzeitig vier Verkehrsströme beachten und damit rund 270° überblicken. Auch für die Autofahrer ist diese Lösung kaum einfacher. Sichere Verkehrsführung sieht definitiv anders aus.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
