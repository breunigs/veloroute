defmodule Data.Article.Blog.Rantzaustrasse do
  use Article.Default

  def created_at(), do: ~D[2021-12-02]
  def title(), do: "Rantzaustraße (Veloroute 7)"

  def type(), do: :finished
  def tags(), do: ["7"]

  def start(), do: ~d[2021-12-06]
  def stop(), do: ~d[2022-02-25]
  def construction_site_id_hh(), do: [21979]

  def links(_assigns) do
    [
      {"Auftragsvergabe zum Bau mit Lageplan",
       "https://suche.transparenz.hamburg.de/dataset/veloroute-7-w11-pappelallee-strassenbauarbeiten"}
    ]
  end

  def summary(),
    do: "Umbau der Einmündungen in die Rantzaustraße, sodass diese künftig Vorfahrt hat."

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Rantzaustraße wird im <.ref>Mischverkehr</.ref> gefahren. An den zahlreichen Einmündungen gilt jeweils rechts-vor-links. Häufig ist durch Stop-Schilder ein vollständiger Abstieg erforderlich.</p>

    <h4>Planung</h4>
    <p>Die Einmündungen bzw. Kreuzungen mit der <.m bounds="10.064981,53.567797,10.067518,53.569207" lon={10.066139} lat={53.568576} dir="forward" ref="7">Freesenstraße</.m>, <.m bounds="10.06722,53.56826,10.0696,53.569643" lon={10.068002} lat={53.568734} dir="forward" ref="7">Claudiusstraße</.m> und dem <.m bounds="10.0694,53.568675,10.071547,53.570276" lon={10.070066} lat={53.569367} dir="forward" ref="7">Schloßgarten</.m> werden zu Gehwegüberfahrten umgebaut. Entlang der Rantzaustraße besteht dann künftig Vorfahrt.</p>

    <p><.m bounds="10.071397,53.569119,10.072878,53.570453" lon={10.071846} lat={53.56988} dir="forward" ref="7">Am Alten Posthaus</.m> wird die Kreuzung so angepasst, das man ohne Schlenker geradeaus fahren kann. Das Stop-Schild in Fahrtrichtung stadtauswärts bleibt aber erhalten.</p>

    <p>Zudem wird der markierte Abschnitt einmal neu asphaltiert und als Fahrradstraße ausgeschildert.</p>

    <h4>Meinung</h4>
    <p>Man macht hier nur das Nötigste. Statt der Veloroute am alten Posthaus Vorfahrt zu gewähren, behält man sogar das Stop-Schild. Im restlichen Abschnitt bleibt es beim Slalom um die KFZ-Parkplätze. Auch reicht der Platz nicht aus um bei KFZ-Verkehr angenehm aneinander vorbeizukommen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
