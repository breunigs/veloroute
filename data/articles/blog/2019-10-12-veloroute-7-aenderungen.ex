defmodule Data.Article.Blog.Veloroute7Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-7-aenderungen"
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
    <p>Fertiggestellt wurde die Erneuerung des <.a href="/7#16/53.571407/10.090829/R91IyC-E1eKPhkw4sGrtQQ">Straßenbelags in der Rauchstraße</.a>. Im Vergleich zur alten, holprigen Oberfläche gleitet man hier jetzt fast dahin.</p>
    <p>Auf dem Abzweig <.a href="/7#16/53.574806/10.1203/pxoQmsKWoK4tChn5LND_5A">Jenfelder Straße</.a> wurden manche der Verkehrsberuhigungen angepasst. Zuvor wurde dem Radverkehr nahegelegt zwischen Verkehrsinsel und Randstein entlang zu fahren. Das ist aber wegen Hindernissen (Laub, Stöcke) oder mit Lastenrädern nicht immer möglich und für den nachfolgenden Verkehr auch nicht abschätzbar. Ich finde die Führung links der Inseln daher besser. Es ist etwas seltsam, das manche Inseln nicht angepasst wurden, obwohl sie sich nicht groß unterscheiden.</p>
    <p>Als die Fotos gemacht wurden befanden sich die <.a href="/7#16/53.571966/10.101079/lTZTbdzDxMSYIIEPXFH1rQ">Schimmelmannstraße</.a> (<.a href="/article/2018-10-14-7-schimmelmannstrasse-w22">Details</.a>) und die <.a href="/7#16/53.596054/10.149976/uueN0MLTyXMvzYXXFI5tsA">Rahlsteder Straße</.a> (<.a href="/article/2018-08-30-7-rahlstedter-strasse">Details</.a>) im Umbau. Beide Maßnahmen verbessern die Situation für den Radverkehr und könnten mittlerweile abgeschlossen sein.</p>
    <p>Auf dem <.a href="/7#17/53.555728/10.016901/02x7CO8OfI-6s74akeouXw">Steindamm</.a> (<.a href="/article/2018-08-30-7-steindamm">Details</.a>) soll dagegen ab dem 14. Oktober mit dem Umbau begonnen werden. Angesichts des Kopfsteinpflasters auswärts und des konfliktträchtigen Hochbordradwegs stadteinwärts ist dies sehr willkommen.</p>
    <p>Wenn ich etwas übersehen habe, <mailto>schreib mir</mailto> bitte.</p>
    """
  end
end
