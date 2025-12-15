defmodule Data.Article.Static.LexikonGruenpfeil do
  use Article.Static

  def name(), do: "lexikon/gruenpfeil"
  def title(), do: "Lexikon · Grüner Abbiegepfeil"

  def summary(), do: "Grünpfeile verwandeln eine rote Ampel in ein Stoppschild. "

  def tags(), do: ["lexikon", "grünpfeil", "grüner pfeil"]

  def text(assigns) do
    ~H"""
    <img src="/images/gruenpfeil_fahrrad.webp" width="335" height="915" alt="Rote Ampel mit „Grünpfeil nur Fahrrad“ Schild am Mast darunter" style="max-width:200px; height: auto; float: right;margin-left: 1rem;shape-outside:url(/images/gruenpfeil_fahrrad.webp);shape-margin: 1rem;"/>

    <p>Hamburg kennt drei Arten vom „grünen Pfeil“, der das Rechtsabbiegen auch an roten Ampeln erlaubt.</p>

    <ol>
      <li>Grüner Pfeil auf schwarzem Blechschild</li>
      <li>Grüner Pfeil mit schwarzen Hintergrund auf weißem „nur Fahrrad“ Blechschild (abgebildet)</li>
      <li>eine zusätzliche Ampel, die nur manchmal leuchtet</li>
    </ol>


    <p>Die ersten beiden Varianten verwandeln eine rote Ampel in ein Stoppschild: Fuß runter, warten bis frei ist, dann weiterfahren.</p>

    <p>Die extra Ampel überstimmt die normale Ampel, und man darf ohne Anhalten durchfahren. Schauen ob frei ist muss man natürlich trotzdem.</p>

    <p>Die genaue Regelung ist in der <.a href="https://www.gesetze-im-internet.de/stvo_2013/__37.html">StVO § 37</.a> definiert.</p>

    <h4>Meinung</h4>
    <p>Grüne Pfeile sind selten eine <em>gute</em> Lösung. Nur der Autoverkehr und die Gefahren durch ihn machen die Ampel nötig. Ziel sollte es daher sein die Ampel ganz zu ersetzen.</p>

    <p>Kreisverkehre ermöglichen die flüssige Fahrt in alle Richtungen ohne künstliches Anhalten. In kleineren Straßen sorgen vorgezogene Gehwege für gute Übersicht und einfaches Rechts-vor-Links.</p>

    <p>An größeren Kreuzugen sollte genug Platz sein für eine Abbiegespur ohne Ampel. Das wäre auch ehrlich: wirklich gehalten wird weder an Stoppschildern noch den grünen Pfeilen, ganz egal ob im Auto oder auf dem Fahrrad.</p>
    """
  end
end
