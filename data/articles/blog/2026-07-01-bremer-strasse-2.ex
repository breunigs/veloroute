defmodule Data.Article.Blog.BremerStrasse2 do
  use Article.Default

  def title(), do: "Bremer Straße (außerorts / ab Sunderweg)"

  def summary(),
    do:
      "Im Stadtbereich meist 1,62m breite Hochbordradwege. Außerorts entfallen die ungesicherten KFZ-Rechtsabbieger an den sanierten Kreuzungen. Erneuert wird der Radweg außerorts nicht."

  def type(), do: :planned

  def tags(), do: []

  def tracks(), do: Data.Article.Blog.BremerStrasse1.tracks()

  def map_image do
    {name(),
     [
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
       {"Die Autobahn NL Nord", "https://www.autobahn.de/ueber-uns/niederlassungen/nord"}
     ]}
  end

  def links(_assigns) do
    [
      {"Karten und Erläuterungen", ~d[2026-07],
       "https://fragdenstaat.de/anfrage/grundinstandsetzung-der-bremer-strasse-b-75-in-hamburg/#nachricht-1129740"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Bis Kreuzung <.v bounds="9.932195,53.435383,9.93716,53.437655" lon={9.934934} lat={53.436704} dir="forward" ref={@ref}>Vahrendorfer Stadtweg/Appelbütteler Weg</.v> sind beidseitig Wege vorhanden. Da diese teilweise falsch oder gar nicht beschildert sind, lässt sich die von der Stadt gedachte Führung nicht sicher feststellen.</p>

    <p>Außerorts werden Rad- und Fußverkehr auf einem geteilten Weg für alle Richtungen geführt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Innerorts bis zur Kreuzung <.v bounds="9.932195,53.435383,9.93716,53.437655" lon={9.934934} lat={53.436704} dir="forward" ref={@ref}>Vahrendorfer Stadtweg/Appelbütteler Weg</.v> sollen 1,62m breite <.ref>Hochbordradwege</.ref> neben Gehwegen mit 1,5m bis 2,0m Breite entstehen. Ausnahme: Stadteinwärts ist ab dem <.v bounds="9.932195,53.435383,9.93716,53.437655" lon={9.935102} lat={53.436672} dir="backward" ref={@ref}>Appelbütteler Weg</.v> für etwa 100m ein 3,1m breiter geteilter Rad- und Fußweg vorgesehen.</p>

    <p>Außerorts werden nur die Kreuzungen angepasst. Es entfallen jeweils die ungesicherten Rechtsabbieger mit Zebrastreifen. Stattdessen regelt eine Ampel den Verkehr. Die Geometrie an der <.v bounds="9.930121,53.430176,9.934743,53.431986" lon={9.932625} lat={53.431317} dir="forward" ref={@ref}>Maldfeldstraße</.v> bleibt im Wesentlichen wie heute. An der <.v bounds="9.931428,53.432918,9.935739,53.435372" lon={9.933578} lat={53.434288} dir="forward" ref={@ref}>Autobahnzufahrt</.v> erhält der Radweg eine S-förmige Führung.</p>

    <h4>Meinung</h4>
    <p>Die ungesicherten Rechtsabbieger zu entfernen war überfällig. Fehlender Schulterblick ist eine häufige Unfallursache, den die Polizei Hamburg ignoriert oder gar wegredet („Übersehen“). Es ist gut, dass das Planungsbüro hier zeitgemäß handelt.</p>

    <p>Mit dem Umbau sind dann auch erstmals durchgängige Radwege vorhanden, die man auf Anhieb erkennen kann.</p>

    <p>Trotzdem bleibt Luft nach oben: die Radweg-Schikane an der Autobahnauffahrt muss nicht sein. Vor der Engstelle am Appelbütteler Weg fehlt auch eine ordentliche Überleitung auf die Fahrbahn, für alle die hier auf die <.ref>Fahrbahn</.ref> wechseln möchten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
