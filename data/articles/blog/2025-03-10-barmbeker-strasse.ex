defmodule Data.Article.Blog.BarmbekerStrasse do
  use Article.Default

  def title(), do: "Barmbeker Straße (Bau U5, Bezirksrouten Nord N1 und N6)"

  def summary(),
    do:
      "Offene Bauweise der U5 macht Neubau der Straße notwendig. Hochbahn gibt Ideen für mögliche Aufteilung."

  def type(), do: :intent

  def tags(), do: ["br-nord-n1", "br-nord-n6"]

  def map_image do
    {name(), [{"Hochbahn", "https://www.hochbahn.de/de/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Planfeststellungsverfahren",
       "https://www.hamburg.de/politik-und-verwaltung/behoerden/bwai/themen/planfeststellungsverfahren/u5m1000-1023488"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig <.ref>Hochbordradwege</.ref> unterschiedlicher Breiten vorhanden. Legal nebeneinander fahren ist meist nicht möglich.</p>

    <p>Die Gehwege sind nur teilweise gut sichtbar von den Radwegen abgegrenzt. An einigen Stellen sind die Gehwege auch zu schmal, um den Fußverkehr abzuwickeln.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}>Skizze</.h4_planning>
    <p>Vorweg: diese Planung ist hauptsächlich für die U-Bahn. Die Straße wurde nur grob skizziert um sicherzustellen, dass Treppen, Aufzüge und Notausgänge gut untergebracht werden können. Die Hochbahn gibt damit vor allem Anreize wie es aussehen <strong>könnte</strong>. Die detaillierte Planung folgt erst später – vermutlich während für die U5 schon gebaut wird.</p>

    <p>Vorgeschlagen wird die Straße komplett neu aufzuteilen.</p>

    <p>Geh- und Radwege werden breiter und sind klarer als heute voneinander getrennt. Zum KFZ-Verkehr ist eine echte Trennung möglich, z.B. als <.ref>Protected-Bike-Lane</.ref> oder als <.ref>Kopenhagener Radweg</.ref>.</p>

    <p>An Bushaltestellen verlaufen die Radwege immer rechts des Einstiegsbereiches für Fahrgäste.</p>

    <p>Es sind weitere Querungsmöglichkeiten vorgesehen. Am <.m bounds="10.014498,53.587269,10.018269,53.589287">Grünzug westlich des Goldbekkanals</.m> und direkt nördlich der <.m bounds="10.017888,53.582114,10.021217,53.584009">Gertigstraße</.m>.</p>

    <h4>Meinung</h4>
    <p>Bis die Straße in neuem Glanz erstrahlt, vergehen noch Jahre – Mitte der 30er Jahre, wenn alles gut geht. Man sollte der Skizze deswegen nicht zu viel Bedeutung beimessen. Die grobe Richtung „Aufenthaltsqualität statt Autobahn“ stimmt aber und ist für das Wohngebiet längst überfällig.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
