defmodule Data.Article.Blog.Krausestrasse do
  use Article.Default

  def created_at(), do: ~D[2021-10-08]
  def updated_at(), do: ~D[2022-11-10]

  def title(), do: "Krausestraße (1. Abschnitt, Freizeitroute 2)"

  def summary(),
    do:
      "Umbau Krausestraße verschiebt sich. Stattdessen 2023 vielleicht Versuchsradweg (Pop-Up Bikelane)"

  def type(), do: :planned

  def tags(), do: ["FR2"]

  def links(_assigns) do
    [
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/krausestrasse-bis-hammer-strasse"},
      {"Verzögerung Umbau", "November 2022",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1012204"},
      {"Erläuterungsbericht", "Oktober 2021",
       "https://lsbg.hamburg.de/resource/blob/597782/66697a9cdddff36117b6b226e2f642ec/krausestrasse-bramfelder-strasse-bis-osterbekkanal-abgestimmte-planung-bericht-data.pdf"},
      {"Pläne/Karten", "Oktober 2021",
       "https://lsbg.hamburg.de/resource/blob/597784/7c7411d5f1ea2f7763146b4688271710/krausestrasse-bramfelder-strasse-bis-osterbekkanal-abgestimmte-planung-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand November 2022</h4>
    <p>Der Umbau verzögert sich auf vorerst unbestimmte Zeit. Als Alternative soll 2023 ein Versuchsradweg (Pop-Up Bikelane) eingerichtet werden. Da die <.abbr>BVM</.abbr> von weiteren Abstimmungen berichtet („Verschickungsprozess“), ist von Änderungen an den hier verlinkten Plänen auszugehen.</p>

    <h4>Alter Zustand</h4>
    <p>In der Krausestraße gibt es im <.m bounds="10.050657,53.585279,10.053298,53.587277">nordwestlichen Teil</.m> bis zum Halbenkamp <.ref>Hochbordradwege</.ref>. Von <.m bounds="10.051878,53.583309,10.05495,53.585876">dort bis zum Osterbekkanal</.m> hat der Radverkehr keine eigenen Wege, sondern fährt im <.ref>Mischverkehr</.ref>. Da es keine Abstellmöglichkeiten für Fahrräder gibt, werden Baumschutzbügel zweckentfremdet.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen durchgängige, meist 1,60m breite <.ref>Radfahrstreifen</.ref> zu bauen. In Richtung <.m bounds="10.050886,53.585427,10.052752,53.587292">Bramfelder Straße</.m> werden sie rund 2,0m breit. In diesem Kreuzungsbereich ist vorgesehen die Radfurten jeweils rot zu markieren. Die Radfahrstreifen verbleiben dabei jeweils rechts der KFZ-Spuren. Die ampelfreien Rechtsabbiegestreifen entfallen. Links angebogen werden kann nur <.ref>indirekt</.ref>.</p>

    <p>An der <.v bounds="10.052607,53.584216,10.054338,53.585227" lon={10.053049} lat={53.584635} dir="forward" ref="FR2">Kreuzung mit dem Lämmersieth</.v> kann <.ref>direkt</.ref> oder <.ref>indirekt</.ref> abgebogen werden. An den Bushaltestellen vor bzw. nach der Kreuzung muss sich der Radverkehr in den KFZ-Strom einordnen oder hinter den Bussen warten. Entlang der Freizeitroute werden jeweils Aufstellflächen vor den Autos aufgemalt. </p>

    <p>Es sind zahlreiche Fahrradanlehnbügel eingeplant. Auch die Fußwege werden etwas breiter.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
