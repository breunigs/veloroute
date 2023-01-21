defmodule Data.Article.Blog.Veloroute7Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-12]

  def title(), do: "Verbesserungen Veloroute 7 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a name="alltagsroute-7">Veloroute 7</.a> hat sich vom Sommer 2018 bis Sommer 2019 nicht so viel getan – dafür gab es zum Aufnahmezeitpunkt im Juli 2019 etliche Baustellen, die die Veloroute verbessern.</p>
    <p>Fertiggestellt wurde die Erneuerung des <.m bounds="10.085348,53.568143,10.09631,53.574671">Straßenbelags in der Rauchstraße</.m>. Im Vergleich zur alten, holprigen Oberfläche gleitet man hier jetzt fast dahin.</p>
    <p>Auf dem Abzweig <.m bounds="10.114819,53.571542,10.125781,53.57807">Jenfelder Straße</.m> wurden manche der Verkehrsberuhigungen angepasst. Zuvor wurde dem Radverkehr nahegelegt zwischen Verkehrsinsel und Randstein entlang zu fahren. Das ist aber wegen Hindernissen (Laub, Stöcke) oder mit Lastenrädern nicht immer möglich und für den nachfolgenden Verkehr auch nicht abschätzbar. Ich finde die Führung links der Inseln daher besser. Es ist etwas seltsam, das manche Inseln nicht angepasst wurden, obwohl sie sich nicht groß unterscheiden.</p>
    <p>Als die Fotos gemacht wurden befanden sich die <.m bounds="10.095598,53.568702,10.10656,53.57523">Schimmelmannstraße</.m> (<.a name="2018-10-14-7-schimmelmannstrasse-w22">Details</.a>) und die <.m bounds="10.144495,53.59279,10.155457,53.599318">Rahlsteder Straße</.m> (<.a name="2018-08-30-7-rahlstedter-strasse">Details</.a>) im Umbau. Beide Maßnahmen verbessern die Situation für den Radverkehr und könnten mittlerweile abgeschlossen sein.</p>
    <p>Auf dem <.m bounds="10.01416,53.554096,10.019642,53.55736">Steindamm</.m> (<.a name="2018-08-30-7-steindamm">Details</.a>) soll dagegen ab dem 14. Oktober mit dem Umbau begonnen werden. Angesichts des Kopfsteinpflasters auswärts und des konfliktträchtigen Hochbordradwegs stadteinwärts ist dies sehr willkommen.</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
