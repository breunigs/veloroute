defmodule Data.Article.Blog.BarrierearmerAlsterradweg do
  use Article.Default

  def created_at(), do: ~D[2022-03-16]

  def title(), do: "Barrierearmer Alsterrradweg"

  def summary(),
    do:
      "Bis 2025 sollen vom Lattenkamp bis Ohlsdorf Treppen und steile Anstiege ersetzt werden oder Alternativen bekommen"

  def type(), do: :intent
  def tags(), do: ["FR1"]

  def links(_assigns) do
    [
      {"Baufortschritt", "November 2022",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1012274"},
      {"Pressemitteilung des Bezirks Nord",
       "https://www.hamburg.de/hamburg-nord/stadtgruen/14867266/steckbrief-alsterwanderweg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf dem Alsterradweg zwischen <.v bounds="9.989571,53.597215,9.99717,53.601655" lon={9.99176} lat={53.599118} dir="forward" ref="FR1">Lattenkamp</.v> und <.v bounds="10.027771,53.618369,10.035399,53.622232" lon={10.030533} lat={53.620744} dir="forward" ref="FR1">Ohlsdorf</.v> finden sich zahlreiche Hindernisse; für den Radverkehr meist in Form von Treppen. Hinzu kommen <.v bounds="9.995081,53.605631,9.996207,53.606489" lon={9.995725} lat={53.60591} dir="forward" ref="FR1">enge Umlaufsperren</.v>, die für Lastenräder schwer zu umfahren sind und teils steile Anstiege.</p>

    <h4>Vorhaben</h4>
    <p>In zahlreichen Einzelmaßnahmen soll der Abschnitt barrierearm werden. Wo möglich werden die Steigungen auf eine längere Strecke verteilt. Bei den denkmalgeschützten Treppen sollen neue Wege im direkten Umfeld eine Alternative schaffen.</p>

    <p>Hinzu kommen Sitzbänke in regelmäßigen Abständen. An der <.v bounds="9.994641,53.604648,9.996619,53.606663" lon={9.995744} lat={53.605707} dir="forward" ref="FR1">Wilhelm-Metzger-Straße</.v> soll eine neue Unterführung entstehen. Es sind weitere Zugänge geplant. An allen abschüssigen Zugängen sind Umlaufsperren vorgesehen, damit der Radverkehr die Erholungsfunktion der Grünfläche nicht stört. Die Umlaufsperren sollen auch mit Rollstühlen problemlos passierbar sein.</p>

    <p>Gebaut werden soll in mehreren Abschnitten bis 2025.</p>

    <h4>Meinung</h4>
    <p>Eine gute Sache. Von diesem Abschnitt war wegen der vielen Hindernisse eher abzuraten. Nach dem Umbau sollte er viel besser nutzbar sein. Bei den Umlaufsperren hängt es von ihrer genauen Umsetzung ab. Da die Strecke hauptsächlich für den Fußverkehr gedacht ist und ortsnah die <.icon name="alltagsroute-4">Alltagsroute</.icon> zur Alternative steht, sind sie grundsätzlich in Ordnung – sofern man durchkommt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
