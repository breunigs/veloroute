defmodule Data.Article.Blog.Krausestrasse do
  use Article.Default

  def name(), do: "#{created_at()}-krausestrasse"
  def created_at(), do: ~D[2021-10-08]

  def title(), do: "Krausestraße (1. Abschnitt, Freizeitroute 2)"

  def summary(),
    do: "Krausestraße bekommt 1,60m breite Radfahrstreifen. Bisher gab es keine eigenen Radwege."

  def start(), do: ~d[2022]
  def stop(), do: ~d[2023]

  def type(), do: :planned

  def tags(), do: ["FR2"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>In der Krausestraße gibt es im <.m bounds="10.050657,53.585279,10.053298,53.587277">nordwestlichen Teil</.m> bis zum Halbenkamp <ref>Hochbordradwege</ref>. Von <.m bounds="10.051878,53.583309,10.05495,53.585876">dort bis zum Osterbekkanal</.m> hat der Radverkehr keine eigenen Wege, sondern fährt im <ref>Mischverkehr</ref>. Da es keine Abstellmöglichkeiten für Fahrräder gibt, werden Baumschutzbügel zweckentfremdet.</p>
    <h4>Planung</h4> <p>Es ist vorgesehen durchgängige, meist 1,60m breite <ref>Radfahrstreifen</ref> zu bauen. In Richtung <.m bounds="10.050886,53.585427,10.052752,53.587292">Bramfelder Straße</.m> werden sie rund 2,0m breit. In diesem Kreuzungsbereich ist vorgesehen die Radfurten jeweils rot zu markieren. Die Radfahrstreifen verbleiben dabei jeweils rechts der KFZ-Spuren. Die ampelfreien Rechtsabbiegestreifen entfallen. Links angebogen werden kann nur <ref>indirekt</ref>.</p>
    <p>An der <.m bounds="10.052607,53.584216,10.054338,53.585227" lon="10.053049" lat="53.584635" dir="forward" ref="FR2">Kreuzung mit dem Lämmersieth</.m> kann <ref>direkt</ref> oder <ref>indirekt</ref> abgebogen werden. An den Bushaltestellen vor bzw. nach der Kreuzung muss sich der Radverkehr in den KFZ-Strom einordnen oder hinter den Bussen warten. Entlang der Freizeitroute werden jeweils Aufstellflächen vor den Autos aufgemalt. </p>
    <p>Es sind zahlreiche Fahrradanlehnbügel eingeplant. Auch die Fußwege werden etwas breiter.</p>
    <h4>Quelle</h4> <ul>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15456350/8c3b5b46a6a645e33b28ea821f0b0ce4/data/krausestrasse-zwischen-bramfelder-strasse-und-osterbekkanal-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15456348/d2c6db9c38da707e1f95a20f7d6fd469/data/krausestrasse-zwischen-bramfelder-strasse-und-osterbekkanal-abgestimmte-planung-plaene.pdf">Pläne</.a></li>
    </ul>
    """
  end
end
