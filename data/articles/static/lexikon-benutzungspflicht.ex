defmodule Data.Article.Static.LexikonBenutzungspflicht do
  use Article.Static

  def name(), do: "lexikon/benutzungspflicht"
  def title(), do: "Lexikon · Benutzungspflicht"

  def summary(),
    do:
      "Ist ein Radweg benutzungspflichtig, muss dieser benutzt werden – es gibt aber zahlreiche Ausnahmen, etwa zum Abbiegen."

  def tags(), do: ["lexikon", "benutzungspflicht", "benutzungspflichtiger"]

  def tracks(), do: Data.Article.Static.Alltagsroute5.tracks() |> Enum.filter(&(&1.group == "5N"))
  def point_of_interest(), do: %{lon: 10.031722, lat: 53.594882, zoom: 16}

  def text(assigns) do
    ~H"""
    <p>Es gibt zwei Szenarien in denen der Radverkehr die KFZ-Spuren nicht benutzen darf:</p>
    <ul style="list-style-type: none; padding-left: 0">
      <li><img src="/images/nobike.svg"/> (VZ 254), wie etwa <.m bounds="9.987198,53.557,9.993563,53.559039">an der Esplanade</.m> wo die linken beiden Fahrspuren dem KFZ-Verkehr vorbehalten werden.</li>
      <li><img src="/images/bnp.svg"/> (VZ 237). Dies ist die klassische Benutzungspflicht, die aber nur angeordnet werden darf, wenn die Fahrt auf den KFZ-Spuren für den Radverkehr besonders gefährlich wäre. Hier ein <.v bounds="10.082451,53.632066,10.098984,53.637355" lon={10.0923} lat={53.6361} dir="backward" ref="5">Beispiel an der Bramfelder Chaussee</.v>. Das Schild muss an jeder Kreuzung wiederholt werden und es gelten zahlreiche Ausnahmen: zum <.ref>direkten Abbiegen</.ref>, ein verstellter (Falschparker, Mülltonnen) oder anderweiter unbenutzbarer Radweg (Scherben), oder wenn das Lastenrad breiter als der Radweg ist. <.a href="http://bernd.sluka.de/Radfahren/rechtlich.html">Genauere Erklärung</.a>.</li>
    </ul>
    """
  end
end
