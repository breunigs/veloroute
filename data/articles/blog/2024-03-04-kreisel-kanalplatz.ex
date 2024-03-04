defmodule Data.Article.Blog.KreiselKanalplatz do
  use Article.Default

  def title(), do: "Kreisel Kanalplatz / Harburger Schloßstraße (Radroute 10, Freizeitroute 6)"

  def summary(),
    do:
      "Ein Kreisverkehr soll das Abbiegen von bzw. in die Schloßstraße einfacher machen. Die alten Hochbordradwege werden dazu teilweise entfernt."

  def type(), do: :planned

  def tags(), do: ["10", "FR6"]

  def links(_assigns) do
    [
      {"fertiger Entwurf", "Januar 2022",
       "https://fragdenstaat.de/anfrage/lageplan-und-erlaeuterungsbericht-kreisverkehr-harburger-schlossstrasse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Zweirichtungsradweg auf der Wasserseite <.v bounds="9.98178,53.465579,9.988075,53.467298" lon={9.984257} lat={53.466576} dir="forward" ref="10" highlight="Kanalplatz,Veritaskai">entlang des Kanalplatzes / Veritaskais</.v> ist provisorisch mit Betonblöcken abgetrennt. Das Abbiegen <.v bounds="9.983329,53.465761,9.985526,53.467028" lon={9.984012} lat={53.466679} dir="forward" ref="10">in die Harburger Schloßstraße</.v> erfolgt zwischen ihnen hindurch auf einen <.ref>Hochbordradweg</.ref>. Auch die <.v bounds="9.983367,53.465801,9.984901,53.466977" lon={9.984027} lat={53.466406} dir="backward" ref="10">Gegenrichtung</.v> funktioniert so.</p>

    <h4>Planung</h4>
    <p>Es soll ein kleiner Kreisverkehr gebaut werden. Dabei werden alle Straßen und der Zweirichtungsradweg gleichberechtigt eingebunden. Die Einmündungen sind so gestaltet, dass die Fahrt in alle Richtungen ohne enge Kurven möglich ist.</p>

    <p>Langfristig soll in der <.v bounds="9.982002,53.464187,9.984832,53.467173" lon={9.983843} lat={53.466055} dir="backward" ref="10">Harburger Schloßstraße</.v> der Radverkehr im <.ref>Mischverkehr</.ref> fahren. Vom Kreisel weg wird daher keine Aufleitung auf den vorhandenen Hochbordradweg gebaut. In der Gegenrichtung ist eine Ableitung vorm Kreisel geplant.</p>

    <h4>Meinung</h4>
    <p>An der Planung ist wenig auszusetzen. Allerdings sollte der alte Hochbordradweg in Richtung Unterführung zeitnah komplett entfernt werden, damit keine Missverständnisse auftreten, wo geradelt werden soll.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>

    """
  end
end
