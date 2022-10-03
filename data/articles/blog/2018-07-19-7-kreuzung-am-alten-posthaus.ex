defmodule Data.Article.Blog.KreuzungAmAltenPosthaus do
  use Article.Default

  def name(), do: "#{created_at()}-7-kreuzung-am-alten-posthaus"
  def created_at(), do: ~D[2018-07-19]
  def updated_at(), do: ~D[2020-06-26]
  def title(), do: "Kreuzung Am alten Posthaus (Veloroute 7)"

  def start(), do: ~d[2021Q3]
  def stop(), do: ~d[2021Q3]

  def type(), do: :finished

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Juli 2021:</strong> Die Polizei Hamburg hat mittlerweile ein „Fahrrad frei“ Schild anbringen lassen. Man darf der Veloroute damit legal folgen, auch schon bevor umgebaut wird.</p> <p>In der vorliegenden Planung werden die Parkplätze rechts entfernt um eine Kreuzung ohne Verschwenkung herstellen zu können. An dieser ist dann Abbiegen in alle Richtungen erlaubt. Unverständlicherweise belässt man es bei den Stop-Schildern, statt die Stelle ordentlich zu sichern ohne den Radverkehr auszubremsen. Immerhin wird die gesamte Rantzaustraße als Fahrradstraße (KFZ frei) ausgeschildert und erhält an der <.m bounds="10.068867,53.569044,10.071885,53.570445" lat={53.56951} lon={10.07064} dir="backward">Kreuzung Schloßgarten</.m> auch Vorfahrt. Warum man an der Kreuzung am alten Posthaus auf diese Gehwegüberfahrt verzichet ist unklar. Überall sonst in Hamburg wird dies als wichtiges Mittel verstanden um klarzumachen, das sich um eine Fahrradstraße handelt.</p> <p>Umgebaut werden soll ab Herbst 2021.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1012155">Erläuterungsbereicht und Pläne</.a></p>
    """
  end
end
