defmodule Data.Article.Blog.Gerichtsstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-11-25]
  def updated_at(), do: ~D[2021-11-27]
  def title(), do: "Gerichtsstraße"

  def start(), do: ~d[2022-06]
  def stop(), do: ~d[2022-11]

  def type(), do: :planned

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht (November 2021)",
       "https://lsbg.hamburg.de/contentblob/15627666/0b66c62e5e9c3e67cfc4c9d646cd2793/data/veloroute-13-gerichtstrasse-abgestimmte-planung-bericht.pdf"},
      {"Lagepläne (November 2021)",
       "https://lsbg.hamburg.de/contentblob/15627664/2d274b1d6f9927747c076a159fe6a0dc/data/veloroute-13-gerichtstrasse-abgestimmte-planung-plan.pdf"},
      {"Präsentation zum Vorentwurf (September 2020)",
       "https://sitzungsdienst-altona.hamburg.de/bi//to020.asp?TOLFDNR=1031355"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand November 2021:</h4> <p>Der LSBG hat den fertigen Entwurf mit Plänen und Erläuterungen veröffentlicht. Der Artikel wurde entsprechend angepasst.</p>
    <h4>Alter Zustand</h4> <p>Der Abschnitt ist durch sehr unebenes Kopfsteinpflaster geprägt. Illegal abgestellte Fahrzeuge erschweren die Übersicht. In Richtung Max-Brauer-Allee muss man den Weg erraten, da das „gemeinsamer Fuß- und Radweg“ Schild überklebt ist.</p>
    <h4>Planung</h4> <p>Es ist vorgesehen auf beiden Seiten meist Längsparkplätze für KFZ einzurichten um die Parksituation zu ordnen. Die Fahrbahn wird nur im mittleren, rund 4,0m breiten Teil asphaltiert. An beiden Seiten schließen sich jeweils nochmal 0,75m Kopfsteinpflaster an, das man aus historischen Gründen behält. Diese Streifen mit Kopfsteinpflaster liegen im <.ref>Dooring</.ref>-Bereich der Parkplätze.</p>
    <p>Die Gerichtsstraße hat künftig Vorfahrt vor anderen Nebenstraßen. Lediglich an der <.m bounds="9.93837,53.557578,9.941748,53.558351" lon="9.9401279" lat="53.5579567" dir="forward">Einmündung in die Haubachstraße</.m> muss Vorfahrt gewährt werden. Die Straße wird zu einer Fahrradstraße mit „Anlieger frei“ für KFZ. Die <.m bounds="9.937867,53.555017,9.944141,53.556453" lon="9.9422194" lat="53.5555027" dir="forward">Durchfahrt an der Max-Brauer-Allee</.m> wird für KFZ gesperrt – allerdings ist dies Teil des <.a name="2018-12-17-1-13-max-brauer-allee">Umbaus der Max-Brauer-Allee</.a>.</p>
    <p>Geplant sind 123 Radanlehnbügel für normale Fahrräder, und 6 weitere für Lastenräder. Sie werden meist zwischen den Bäumen und damit hinter den KFZ-Parkplätzen installiert.</p>
    <h4>Meinung</h4> <p>Dieser Abschnitt ist so weit von einer komfortablen Veloroute entfernt, das jede Umplanung einen Gewinn darstellt. Der fertige Entwurf ist gut und ermöglicht komfortables Befahren der Veloroute. Entgegen der ersten Entwürfe ist die Fahrbahn jetzt breit genug um problemlos überholen zu können.</p>
    <p>Das man die Radanlehnbügel nur umständlich über Gehweg oder enge Parklücken erreicht ist verschmerzlich. Warum man dies jedoch auch für die Hälfte der Lastenradparkplätze vorsieht ist unverständlich. Immerhin: bei der anderen Hälfte ermöglicht ein ebenerdiger Bordstein bequemes Parken.</p>
    <p>Etwas kurz gedacht wirkt die <.m bounds="9.93837,53.557578,9.941748,53.558351" lon="9.9401279" lat="53.5579567" dir="forward">Einmündung in die Haubachstraße</.m>. In beiden Straßen ist der Radverkehr bereits heute höher als der KFZ-Verkehr, es wäre also denkbar die Haubachstraße ebenfalls zu einer Fahrradstraße zu machen. Dann könnte man der Veloroute ohne Bodenschwellen in diesem Bereich folgen.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
