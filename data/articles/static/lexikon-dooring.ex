defmodule Data.Article.Static.LexikonDooring do
  use Article.Static

  def name(), do: "lexikon/dooring"
  def title(), do: "Lexikon · Dooring"

  def summary(),
    do: "Dooring: Unfallgefahr die von unachtsam geöffneten Autotüren ausgeht"

  def tags(),
    do: [
      "lexikon",
      "dooring",
      "dooring-gefahr"
    ]

  def text(assigns) do
    ~H"""
    <p>Als Dooring bezeichnet man wenn Autofahrende ohne zu schauen die Autotür öffnen und den Rad- oder Fußverkehr gefährden. Leider sind in Hamburg nicht alle Radspuren mit ausreichend Sicherheitsabstand versehen, wie etwa in der <.m bounds="9.942314,53.552371,9.99476,53.56452" lon="10.038327" lat="53.572288" dir="forward" ref="13">Wagnerstraße</.m>.</p>
    <p>Die beste Lösung ist keine Parkplätze an Fahrradwegen zu bauen – in Hamburg begnügt man sich stattdessen häufig mit einem 70cm Sicherheitsabstand, der nur vorhanden ist wenn die Autos ordentlich geparkt werden.</p>
    """
  end
end
