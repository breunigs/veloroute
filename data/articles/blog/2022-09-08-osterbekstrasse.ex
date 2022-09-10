defmodule Data.Article.Blog.Osterbekstrasse do
  use Article.Default
  def created_at(), do: ~D[2022-09-08]
  def title(), do: "Osterbekstrassse (Freizeitroute 2)"

  def summary(),
    do:
      "Osterbekstrasse soll Fahrradstraße werden. In der Parkanlage vermutlich 4,0m breiter Radweg neben 3,0m breitem Gehweg."

  def type(), do: :planned
  def tags(), do: ["FR2"]

  def start(), do: ~d[2023]
  def stop(), do: ~d[2023]

  def links(_assigns) do
    [
      {"Unterlagen 1. Entwurf", "September 2022",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1012098"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Freizeitroute führt über Kopfsteinpflaster. Gerade <.m bounds="10.018999,53.58067,10.02588,53.583537" lon="10.02042" lat="53.581521" dir="forward" ref="FR2">im Westteil</.m> ist durch die Falschparker die Situation unübersichtlich.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen die Osterbekstraße dort zu einer asphaltierten Fahrradstraße zu machen, wo auch heute Autos erlaubt sind. Sie ist nur für Anlieger zugelassen. An Einmündungen und den Wendehammern soll die Fahrradstraße jeweils bevorrechtigt werden. Im <.m bounds="10.029367,53.583451,10.034209,53.585013" lon="10.030473" lat="53.583997" dir="forward" ref="FR2">östlichen Teil</.m> ist das Abstellen von KFZ nur noch in Parkbuchten erlaubt. Im  <.m bounds="10.018999,53.58067,10.02588,53.583537" lon="10.02042" lat="53.581521" dir="forward" ref="FR2">westlichen Teil</.m> sind auf der Häuserseite auch Parkbuchten vorgesehen, auf der Wasserseite dagegen Parken am Straßenrand mittels Markierungen. </p>

    <p>Der für Autos nicht zugängliche <.m bounds="10.023108,53.581925,10.030726,53.584378" lon="10.025687" lat="53.583315" dir="forward" ref="FR2">Abschnitt im Park</.m> wird in einer anderen Planung überarbeitet. Es ist aber angedeutet, dass dort ein 4,0m breiter Radweg neben einem 3,0m breiten Gehweg verlaufen könnte.</p>

    <p>Die Kreuzungen mit der <.m bounds="10.01895,53.580441,10.0227,53.582683" lon="10.019697" lat="53.581449" dir="forward" ref="FR2">Bachstraße</.m> bzw. <.m bounds="10.032445,53.583153,10.035777,53.585438" lon="10.033327" lat="53.584478" dir="forward" ref="FR2">Schleidenstraße</.m> sind nicht Teil dieser Planung.</p>

    <h4>Meinung</h4>
    <p>Die Planung wirkt gut. Es ist kurios wie viel Wert in der Planung darauf gelegt wird, möglichst viele KFZ-Parkplätze zu erhalten. Dabei hat das nahe Einkaufszentrum riesige Tiefgaragen, die oberirdische Parkplätze bis auf Ausnahmen überflüssig machen. Auf diese geht der Erläuterungsbericht nicht ein.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
