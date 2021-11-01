defmodule Data.Article.Blog.KurtKoerberChaussee do
  use Article.Default

  def name(), do: "#{created_at()}-9-kurt-koerber-chaussee"
  def created_at(), do: ~D[2019-10-27]

  def title(), do: "Kurt-A.-Körber Chaussee (Veloroute 9)"

  def start(), do: ~d[2019-12-02]
  def stop(), do: ~d[2020-11-29]

  def type(), do: :finished

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>
    Stand Februar 2020: Der Umbau hat begonnen.
    <.a href="https://www.hamburg.de/planen-bauen-wohnen/13341442/umbau-kurt-a-koerber-chaussee/">Infoseite der Stadt</.a>
    </p>
    <p>Die Radwege sind hier als Hochbordradweg ausgeführt, die meist rechts der Baumreihe bzw. KFZ-Stellplätzen verläuft. Nur an wenigen Stellen wird der Radweg links an den Bäumen vorbeigeführt. Da man die Bäume erhalten möchte, fällt die Option für Radfahrstreifen auf der Straße weg – der Platz hätte lediglich für einen einseitigen Schutzstreifen gereicht, sofern man nicht entweder eine KFZ-Spur oder eine Baumreihe aufgegeben hätte. Stattdessen hat man sich dafür entschieden die aktuelle Führungsform beizubehalten und lediglich die problematischen Stellen auszubessern. Die Verbesserungen sind bereits für 2019 angesetzt.</p> <p>Leider sind mir keine Details bekannt welche Änderungen genau gemacht werden sollen. Taktile Pflastersteine zur besseren Abgrenzung zum Fußweg wären wünschenswert, ebenso Sicherheitsabstand zu parkenden Autos um vor unachtsam geöffneten Türen geschützt zu sein. Dafür wäre aber eine Erneuerung auf gesamter Länge notwendig und die Beschreibung klingt nicht so, als wäre das angedacht.</p>
    <p><.a href="https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1004268">Quelle: Sitzungsdienst Bergedorf</.a></p>
    """
  end
end
