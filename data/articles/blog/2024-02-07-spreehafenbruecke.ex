defmodule Data.Article.Blog.Spreehafenbruecke do
  use Article.Default

  def title(), do: "Spreehafenbrücke (Radroute 11)"

  def summary(),
    do: "Östlicher Fußweg soll bei Instandsetzung verbreitert werden."

  def type(), do: :planned

  def start(), do: ~d[2024-02-19]
  def stop(), do: ~d[2024-12-19]
  def construction_site_id_hh(), do: [663_513]

  def tags(), do: ["11"]

  def links(_assigns) do
    [
      # https://fragdenstaat.de/anfrage/lageplaene-und-erlaeuterungsbericht-spreehafenbruecke/
      {"Verkehrsmeldungen Brücken und Schleusen Hafengebiet",
       "https://www.hamburg-port-authority.de/de/strasse/bruecken-und-schleusen"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der Brücke gibt es keine eigenen Radwege. Die Gehwege dürfen in Schrittgeschwindigkeit mitbenutzt werden (<.ref>Fahrrad frei</.ref>), ansonsten muss im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Planung</h4>
    <p>Der <.v bounds="9.982113,53.523118,9.983675,53.524325" lon={9.982815} lat={53.52335} dir="backward" ref="11">östliche Fußweg</.v> soll verbreitert werden.</p>

    <p>Die Brücke soll während des Umbaus für Rad- und Fußverkehr weiterhin passierbar bleiben.</p>

    <h4>Meinung</h4>
    <p>Ohne Pläne schwer zu beurteilen. Die Beschreibung spricht nur vom „östlichen Geh- und Radweg“ – was nicht so klingt, als gäbe es künftig durchgängige Radwege.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
