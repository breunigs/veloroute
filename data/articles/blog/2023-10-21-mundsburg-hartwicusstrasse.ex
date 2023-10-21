defmodule Data.Article.Blog.MundsburgHartwicusstrasse do
  use Article.Default

  def title(), do: "Mundsburg / Hartwicusstraße (Alltagsroute 5 und 6)"

  def summary(), do: "Radweg wird im Zuge eines Hausbaus auf einem kurzen Stück breiter."

  def type(), do: :planned

  def tags(), do: ["5", "6"]

  def start(), do: ~d[2026Q1]
  def stop(), do: ~d[2026Q1]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/692610/c435c98fabcc3803d73ff2c02c2fdb14/mundsburger-damm-24-abgestimmte-planung-bericht-data.pdf"},
      {"Lagepläne", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/692612/5801481e34f18cba6d2791191d4577f6/mundsburger-damm-24-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der <.ref>benutzungspflichtige</.ref> <.ref>Hochbordradweg</.ref> im <.v bounds="10.019968,53.565585,10.022406,53.567002" lon={10.021025} lat={53.566328} dir="forward" ref="5">Mundsburger Damm</.v> ist 1,5m breit.</p>

    <h4>Planung</h4>
    <p>Vor dem neuen Gebäude wird der Hochbordradweg 2,5m breit. Links neben dem Radweg werden Ladezonen gebaut. Die (KFZ-) Zufahrt zur <.v bounds="10.019968,53.565585,10.022406,53.567002" lon={10.021171} lat={53.566045} dir="backward" ref="6">Hartwicusstraße</.v> wird etwas schmäler. Die Gehwege werden in beiden Straßen breiter. Hinzu kommen neue Bäume und  Fahrradbügel.</p>

    <h4>Meinung</h4>
    <p>Es ist schade, dass nur die 60m vorm Neubau angepasst werden. Immerhin entsteht so eine mögliche Überholmöglichkeit, was im Mundsburger Damm sonst kaum möglich ist.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
