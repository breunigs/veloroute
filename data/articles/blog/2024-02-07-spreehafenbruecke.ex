defmodule Data.Article.Blog.Spreehafenbruecke do
  use Article.Default

  def title(), do: "Spreehafenbrücke (Radroute 11)"

  def summary(),
    do:
      "2,5m Radfahrstreifen nach Wilhelmsburg; 2,0m Hochbordradweg zum Elbtunnel. Genaue Anbindung der Wege an die Straße außerhalb der Brücke in zusätzlicher Planung."

  def updated_at(), do: ~D[2024-02-21]

  def type(), do: :construction

  def start(), do: ~d[2024-02-19]
  def stop(), do: ~d[2024-12-19]
  def construction_site_id_hh(), do: [663_513]

  def tags(), do: ["11"]

  def links(_assigns) do
    [
      {"Pläne und Erläuterungen", "Februar 2024",
       "https://fragdenstaat.de/anfrage/lageplaene-und-erlaeuterungsbericht-spreehafenbruecke/"},
      {"Verkehrsmeldungen Brücken und Schleusen Hafengebiet",
       "https://www.hamburg-port-authority.de/de/strasse/bruecken-und-schleusen"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Konkretisierung</h4>
    <p>Durch die Veröffentlichung der Pläne konnte der Artikel präzisiert werden.</p>

    <h4>Alter Zustand</h4>
    <p>Auf der Brücke gibt es keine eigenen Radwege. Die Gehwege dürfen in Schrittgeschwindigkeit mitbenutzt werden (<.ref>Fahrrad frei</.ref>), ansonsten muss im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Planung</h4>
    <p>In <.v bounds="9.981947,53.523103,9.984731,53.524589" lon={9.983046} lat={53.524082} dir="forward" ref="11">Richtung Wilhelmsburg</.v> soll ein 2,25m breiter <.ref>Radfahrstreifen</.ref> entstehen. Um ihn zu erreichen soll in einer weiteren Baumaßnahme die Abfahrt vom geteilten Fuß- und Radweg verbessert werden. Der neue Radfahrstreifen verläuft neben zwei KFZ-Spuren mit je 2,75m Breite. Der Gehweg auf dieser Seite bleibt 2,5m breit.</p>

    <p>In <.v bounds="9.981947,53.523103,9.984731,53.524589" lon={9.982821} lat={53.523397} dir="backward" ref="11">Richtung Elbtunnel</.v> ist ein 2,0m breiter <.ref>Hochbordradweg</.ref> geplant, der neben dem noch 1,5m breiten Gehweg verläuft. Dazu wird die Brücke auf der Ostseite verbreitert.</p>

    <p>Die Brücke soll während des Umbaus für Rad- und Fußverkehr weiterhin passierbar bleiben.</p>

    <h4>Meinung</h4>
    <p>Die Wege auf der Brücke an sich sind deutlich besser als vorher, auch wenn der östliche Gehweg schmal ausfällt. Die Anschlüsse der Radwege sind in der Planung skizziert, sollen aber separat umgesetzt werden. Eine Bewertung ist daher erst mit der genaueren/konkreteren Planung möglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
