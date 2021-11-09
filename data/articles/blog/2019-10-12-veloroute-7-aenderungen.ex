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
    <p>Auf der <.a href="/7">Veloroute 7</.a> hat sich vom Sommer 2018 bis Sommer 2019 nicht so viel getan – dafür gab es zum Aufnahmezeitpunkt im Juli 2019 etliche Baustellen, die die Veloroute verbessern.</p>
    <p>Fertiggestellt wurde die Erneuerung des <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.571407, lon: 10.090829, zoom: 16})} ref="7">Straßenbelags in der Rauchstraße</.m>. Im Vergleich zur alten, holprigen Oberfläche gleitet man hier jetzt fast dahin.</p>
    <p>Auf dem Abzweig <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.574806, lon: 10.1203, zoom: 16})} ref="7">Jenfelder Straße</.m> wurden manche der Verkehrsberuhigungen angepasst. Zuvor wurde dem Radverkehr nahegelegt zwischen Verkehrsinsel und Randstein entlang zu fahren. Das ist aber wegen Hindernissen (Laub, Stöcke) oder mit Lastenrädern nicht immer möglich und für den nachfolgenden Verkehr auch nicht abschätzbar. Ich finde die Führung links der Inseln daher besser. Es ist etwas seltsam, das manche Inseln nicht angepasst wurden, obwohl sie sich nicht groß unterscheiden.</p>
    <p>Als die Fotos gemacht wurden befanden sich die <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.571966, lon: 10.101079, zoom: 16})} ref="7">Schimmelmannstraße</.m> (<.a href="/article/2018-10-14-7-schimmelmannstrasse-w22">Details</.a>) und die <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.596054, lon: 10.149976, zoom: 16})} ref="7">Rahlsteder Straße</.m> (<.a href="/article/2018-08-30-7-rahlstedter-strasse">Details</.a>) im Umbau. Beide Maßnahmen verbessern die Situation für den Radverkehr und könnten mittlerweile abgeschlossen sein.</p>
    <p>Auf dem <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.555728, lon: 10.016901, zoom: 17})} ref="7">Steindamm</.m> (<.a href="/article/2018-08-30-7-steindamm">Details</.a>) soll dagegen ab dem 14. Oktober mit dem Umbau begonnen werden. Angesichts des Kopfsteinpflasters auswärts und des konfliktträchtigen Hochbordradwegs stadteinwärts ist dies sehr willkommen.</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
