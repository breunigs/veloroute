defmodule Data.Article.Blog.WeidenstiegTornquiststrasse do
  use Article.Default

  def name(), do: "#{created_at()}-2-weidenstieg-tornquiststrasse"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Weidenstieg und Tornquiststraße (Veloroute 2)"

  def start(), do: ~d[2019Q2]

  def type(), do: :finished

  def tags(), do: ["2"]

  def links(_assigns) do
    [
      {"Übersichts-PDF mit allen Änderungen",
       "https://www.hamburg.de/contentblob/11395594/152cc297f049103dff89583effeaf122/data/fokus-biweto2018-03.pdf"},
      {"Infoseite der Stadt zum Weidenstieg und Tornquiststraße",
       "https://www.hamburg.de/eimsbuettel/bismarckstrasse/"},
      {"Weidenstieg bis Doormannsweg", "stadtauswärts",
       "https://www.hamburg.de/contentblob/10844928/f547c768ea5df0438b2e41df42720ae1/data/schlussverschickung-weidenstieg.pdf"},
      {"Plan Tornquiststraße ab Doormannsweg", "stadtauswärts",
       "https://www.hamburg.de/contentblob/10844926/47dd4e57afa9515d170c1afde21fc3c6/data/schlussverschickung-blatt3-tornquiststr-heussweg-doormannsweg.pdf"},
      {"Plan Kreuzung Emilienstraße", "stadtauswärts",
       "https://www.hamburg.de/contentblob/10844924/fc6778cea27ce38fcdf74751fe2c0580/data/schlussverschickung-blatt2-tornquiststr-heussweg-doormannsweg.pdf"},
      {"Plan Kreisel Heußweg", "stadtauswärts",
       "https://www.hamburg.de/contentblob/10844916/486a1fbba9351d310b8773fc21d2301e/data/schlussverschickung-blatt1-tornquiststr-heussweg-doormannsweg.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Umbaupläne für den <.m bounds="9.875258,53.56962,10.208407,53.697995">Weidenstieg</.m> und die <.m bounds="9.950246,53.57212,9.958901,53.574425">Tornquiststraße</.m> kann man als durchwachsen bezeichnen. Defintiv verbessert wird die Führung im direkten Anschluss an die Kreuzung <.m bounds="9.799128,53.45509,9.981598,53.678817">Christuskirche</.m> und der Radverkehr erhält erstmals eine sinnvolle Führung. Bei der Kreuzung <.m bounds="9.793677,53.571068,9.975679,53.666213">Bismarckstraße</.m>/<.m bounds="9.959892,53.57054,9.96083,53.571068">Eschenstieg</.m> hat es aber nicht für eine durchgehende Vorfahrt gereicht – immerhin ist der Einsichtsbereich groß genug, sodass man nicht zu stark wegen Rechts-vor-Links abbremsen muss. Im Anschluss wird das unkomfortable Kopfsteinpflaster durch geringfügig weniger unkomfortables „gesägtes Kopfsteinplaster“ ersetzt, welches etwas flacher ist. Durch die weiterhin vorhandenen großen Fugen bleibt diese Lösung für den Radverkehr unattraktiv. Wer sich selbst ein Bild machen möchte, kann solches Pflaster z.B. auf der <.m bounds="9.992951,53.5557,10.000595,53.557791">Lombardsbrücke</.m> an der Binnenalster bereits heute ausprobieren.</p> <p>Die Kreuzung des Eppendorfer Weg bleibt im Wesentlichen unverändert. Auch wurde die Schikane vom <.m bounds="9.958715,53.572078,9.95981,53.572936">Henriettenweg</.m> in die <.m bounds="9.950246,53.57212,9.958901,53.574425">Tornquiststraße</.m> nur geringfügig entschärft. Immerhin wird es am <.m bounds="9.951884,53.566862,9.957833,53.572487">Doormannsweg</.m> eine ordentliche Ampel geben, die das Queren ohne Schlenker erlaubt. Auf den Plänen ist stadtauswärts weiterhin ein Taster an der Radwegfurt eingezeichnet, was bedeuten könnte das die Bettelampel weiterhin bleibt. In der <.m bounds="9.950246,53.57212,9.958901,53.574425">Tornquiststraße</.m> bleibt das Kleinpflaster, wird aber wenigstens neu verlegt um etwas ebener zu sein. Die Straße wird als Fahrradstraße ausgeführt und erhält an der Kreuzung zur <.m bounds="9.952542,53.571254,9.956475,53.576918">Emilienstraße</.m> Vorfahrt.</p> <p>Der Wendekreis und Übergang zum Fahrradweg auf Höhe der <.m bounds="9.951384,53.573446,9.954056,53.574533">Grundschule Tornquiststraße</.m> erhalten nur geringfügige Anpassungen, wobei der Fahrradweg deutlich breiter wird: statt aktuell 2,5m stehen in Zukunft 4,0m zur Verfügung. Die Kreuzung mit dem <.m bounds="9.94888,53.573517,10.031707,53.685735">Heußweg</.m> wird zu einem Kreisel umgebaut, was eine Querung im Vergleich zu jetzt erheblich erleichtern sollte.</p> <p>Der Baubeginn ist aktuell für Frühjahr 2019 angesetzt, da sich für die Umsetzung im Herbst 2018 leider keine Baufirma fand.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
