defmodule Data.Article.Blog.JuethornstrasseUndRodigallee do
  use Article.Default

  def updated_at(), do: ~D[2024-12-12]

  def title(), do: "Jüthornstraße und Rodigallee (West)"

  def summary(),
    do:
      "2,0m breite Protected-Bike-lanes, an Bushaltestellen andere Führungen. Mehr Bäume, mehr Radabstellplätze und eine Busspur stadteinwärts."

  def type(), do: :planned
  def tags(), do: ["rodigallee", "br-wandsbek-w2"]

  def start(), do: ~d[2025-05]
  def stop(), do: ~d[2029-09]

  def tracks(), do: Data.Article.Blog.RodigalleeUndBarsbuettlerStrasse.tracks()

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf – Erläuterungsbericht", ~d[2024-12],
       "https://lsbg.hamburg.de/resource/blob/999388/a7354ccf6a0eeb48c004a282e14ae9c5/rodigallee-juethornstrasse-bovestrasse-bis-holstenhofweg-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Karte", ~d[2024-12],
       "https://lsbg.hamburg.de/resource/blob/999390/a8130323da78f7eab806ac323e7dc7fa/rodigallee-juethornstrasse-bovestrasse-bis-holstenhofweg-abgestimmte-planung-plaene-data.pdf"},
      {"Detailanpassungen der Planung", "Dezember 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017917"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/784232/8b7c814f37565b25bee45400d429e88c/juethornstrasse-rodigallee-bovestrasse-bis-jenfelder-allee-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/784234/8fea4149cf536d213d0a61aac9a7f9a3/juethornstrasse-rodigallee-bovestrasse-bis-jenfelder-allee-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Dezember 2024</h4>
    <p>Der fertige Entwurf wurde veröffentlicht. Die wichtigste Änderung ist, dass man mit <.ref>Protected-Bike-Lanes</.ref> und <.ref>Kopenhagener Radwegen</.ref> Rad- und KFZ-Verkehr besser voneinander trennt. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Stadtauswärts ist ein schmaler <.ref>Hochbordradweg</.ref> mit unterschiedlichen Belägen vorhanden. An Bäumen ist der Radweg teilweise unterbrochen. Stadteinwärts sollen sich Rad- und Fußverkehr den Weg teilen. Dem Autoverkehr stehen durchgängig vier Spuren in voller Breite zur Verfügung.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es ist vorgesehen beidseitig <.ref>Protected-Bike-Lanes</.ref> von rund 2,0m Breite zu schaffen. Richtung Innenstadt wird eine Busspur eingerichtet. Die Fußwege erhalten unterschiedliche Breiten. KFZ steht mit zwei durchgängigen Spuren auch künftig weiterhin der meiste Platz zu.</p>

    <p>Es gibt einige Ausnahmen zu den Protected-Bike-Lanes:</p>
    <ul>
      <li><.v bounds="10.086951,53.568241,10.091556,53.569297" lon={10.089011} lat={53.568759} dir="forward" ref={@ref}>Jüthornstraße Höhe Wandsbeker Gehölz</.v>: Hier sollen 2,25m bzw. 2,75m breite <.ref>Kopenhagener Radwege</.ref> gebaut werden. Stadtauswärts wird der unbeleuchtete Radweg durch den Park aufgegeben. Nahe der Einmündung der Bovestraße ist hier ein kurzer Abschnitt Hochbordradweg vorgesehen, der mit rund 1,60m schmaler ausfällt.</li>
      <li>Im <.m bounds="10.083266,53.568074,10.086315,53.56884">südwestlichen Teil</.m> der Jüthornstraße ist der Radfahrstreifen stadtauswärts ebenfalls nur 1,60m breit. In Richtung Innenstadt ist <.ref>Mischverkehr</.ref> geplant. Um die Grünflächen besser zu verbinden, wird hier eine Querungshilfe gebaut.</li>
      <li>Stadtauswärts zwischen <.v bounds="10.105589,53.57003,10.112677,53.571644" lon={10.106959} lat={53.570561} dir="forward" ref={@ref}>Schimmelmannallee</.v> und <.v bounds="10.11209,53.570536,10.116744,53.571609" lon={10.114538} lat={53.57092} dir="forward" ref={@ref}>Am Hohen Feld</.v>: Kopenhagener Radweg (2,25m)</li>
      <li>An den Bushaltestellen <.v bounds="10.086216,53.568481,10.088661,53.569178" lon={10.087593} lat={53.568956} dir="backward" ref={@ref}>Bovestraße</.v>, <.v bounds="10.090009,53.568121,10.093046,53.569188" lon={10.091259} lat={53.568567} dir="forward" ref={@ref}>AK Wandsbek</.v>, <.v bounds="10.098414,53.568916,10.101568,53.570327" lon={10.09991} lat={53.569563} dir="forward" ref={@ref}>Osterkamp</.v> und <.v bounds="10.113625,53.570524,10.117321,53.571633" lon={10.114806} lat={53.570941} dir="forward" ref={@ref}>Am Hohen Feld</.v> enden die Protected-Bike-Lanes und man muss hinter den Bussen warten, oder sich im KFZ-Verkehr einordnen.</li>
      <li>An den Bushaltestellen <.v bounds="10.103936,53.569664,10.107513,53.571143" lon={10.106082} lat={53.570415} dir="forward" ref={@ref}>Universität der Bundeswehr</.v> (beidseitig) und <.v bounds="10.122132,53.570479,10.125894,53.571562" lon={10.123797} lat={53.571066} dir="backward" ref={@ref}>Schiffbeker Weg</.v> (stadteinwärts) wird der Radweg als Hochbordradweg rechts der Busse und der Wartefläche der Fahrgäste vorbeigeführt.</li>
    </ul>

    <p>An Kreuzungen die heute schon eine Ampel haben, wird Abbiegen sowohl <.ref>direkt</.ref> als auch <.ref>indirekt</.ref> ermöglicht. Ausnahme: Das Linksabbiegen von der <.m bounds="10.085247,53.568467,10.086758,53.569183">abknickenden Jüthornstraße</.m> ist nur indirekt vorgesehen. Am <.v bounds="10.095008,53.568332,10.099102,53.570551" lon={10.096496} lat={53.568919} dir="forward" ref={@ref}>Bornkamp</.v> wird Linksabbiegen verboten.</p>

    <p>Es werden weitere Bäume gepflanzt, allerdings auch einige Alte gefällt.</p>

    <h4>Sonstiges</h4>
    <p>Die Planung schließt nahtlos an den Abschnitt <.a name="2022-03-17-rodigallee-und-barsbuettler-strasse">zwischen Jenfelder Allee und Öjendorfer Damm</.a> an. Der Umbau erfolgt gemeinsam bzw. koordiniert.</p>

    <h4>Meinung</h4>
    <p>Aus Sicht des Radverkehrs gibt es am fertigen Entwurf wenig auszusetzen. Wo möglich, wird der Radverkehr mit Bordsteinen ordentlich vom KFZ-Verkehr getrennt. Die Radwege sind breit genug damit überholt werden kann.</p>

    <p>Nicht ideal sind die fehlenden Radwege an vielen Bushaltestellen. Der gewählte Kompromiss ist aber fair, denn die Strecke ist für den ÖPNV sehr wichtig. Wegen der teils geringen Straßenbreite wären andere Führung des Radwegs auch nicht unbedingt besser.</p>

    <p>Der Umbau hat insgesamt nur Vorteile. Erstmals benutzbare Radwege, breitere Gehwege, pünktlichere Busse, mehr Bäume und für den KFZ-Verkehr gibt es auch keine Einschränkungen.</p>

    <p>Dass zwei MIV-Spuren ausreichen, konnte der LSBG sogar praktisch beobachten. Wegen anderen Bauarbeiten war teilweise eine Fahrspur gesperrt – selbst zu Spitzenzeiten machte das für den KFZ-Verkehr keine Unterschiede. Witzig: Rückstau beobachtete der LSBG nur, wenn durch illegales Linksabbiegen die Kreuzung blockiert wurde. Der größte Feind des Autoverkehrs ist und bleibt der Autoverkehr.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
