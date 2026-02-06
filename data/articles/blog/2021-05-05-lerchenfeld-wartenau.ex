defmodule Data.Article.Blog.LerchenfeldWartenau do
  use Article.Default

  def title(), do: "Lerchenfeld und Wartenau (Radroute 6)"

  def start(), do: ~d[2025-03-17]
  def stop(), do: ~d[2027-03-31]
  def construction_site_id_hh(), do: [1_617_362]

  def type(), do: :construction

  def tags(), do: ["radroute-6", "6"]

  def map_image do
    {name(),
     [
       {"melchior + wittpohl", "https://mplusw.de/kontakt-anfrage/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-01],
       "https://lsbg.hamburg.de/resource/blob/1138838/60e7d22b3f49ca5ab1319ba66af1ce9f/lerchenfeld-anliegerinformation-januar-2026-data.pdf"},
      {"Bauvergabe", ~d[2025-10],
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/supplier/external/deeplink/subproject/d2b91f43-3c05-4e0a-8392-cede362832fe"},
      {"Erläuterungsbericht", ~d[2025-08],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/to020.asp?TOLFDNR=1036654"},
      {"Baustelleninfo: Wartenaubrücke", ~d[2025-07],
       "https://lsbg.hamburg.de/resource/blob/1041004/11a83b1bffb8f2fe870b40d49c9d979b/wartenaubruecke-anliegerinformation-mai-2025-data.pdf"},
      {"überarbeitete Lagepläne und Präsentation", ~d[2025-05],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/to010.asp?SILFDNR=1003276"},
      {"Präsentation zur möglichen Planüberarbeitung", ~d[2025-05],
       "https://fragdenstaat.de/anfrage/ems-hh-strassenzug-lerchenfeld-wartenau/#nachricht-996958"},
      {"Baustelleninfo Wartenaubrücke", ~d[2025-03],
       "https://lsbg.hamburg.de/resource/blob/1041004/7be96b05d0dd6681049076543a149afb/wartenaubruecke-anliegerinformation-maerz-2025-data.pdf"},
      {"Erläuterungsbericht", ~d[2020],
       "https://lsbg.hamburg.de/resource/blob/784248/d08b0319d36fb6e5ce7b598d738e5c85/lerchenfeld-wartenau-hamburger-strasse-bis-wandsbeker-chaussee-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan (veraltet)", ~d[2020],
       "https://lsbg.hamburg.de/resource/blob/784250/0e11e2a88b8543bc9d4dca356f9c48b8/lerchenfeld-wartenau-hamburger-strasse-bis-wandsbeker-chaussee-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die gesamte Strecke zeichnet sich durch schmale, in die Jahre gekommene <.ref>Hochbordradwege</.ref> aus. Da die Parkplätze zu schmal sind für die heutigen Autobreiten, besteht kein Sicherheitsabstand gegen <.ref>Dooring</.ref>.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Planung sieht vor die bestehende Platzaufteilung bis auf wenige Ausnahmen beizubehalten. Dies bedeutet das die Radwege mit meist 1,5m unter den heutigen Mindestmaßen bleiben. An der engsten Stelle sind  1,25m vorgesehen. Die KFZ-Parkplätze werden vollständig durch Fahrrad-Anlehnbügel ersetzt um die Sicherheit zu verbessern.</p>

    <p>Die Einbahnstraßen <.m bounds="10.031086,53.565115,10.033893,53.566144">Uhlandstraße und Blaumenau</.m> werden für den Radverkehr in beide Richtungen freigegeben.</p>

    <h4>Meinung</h4>
    <p>Es gibt einige gute Ideen, wie ebenerdigen Fuß- und Radwege an Einmündungen ohne Ampeln. Die vielen neuen Anschließmöglichkeiten sind ebenfalls gut.</p>

    <p>Neben der mangelhaften Breite ist Linksabbiegen an Einmündungen nur für den KFZ-Verkehr vorgesehen. Wie man der Radroute 6 stadteinwärts an Markttagen folgen soll, bleibt ebenso offen.</p>

    <p>Man kann dem LSBG nicht vorwerfen, sie hätten es nicht versucht: es wurden auch Varianten erarbeitet, die dem Rad- und Fußverkehr akzeptable, dem Gesetz entsprechende Wege angeboten hätten. Dazu müsste man aber entweder viele Bäume fällen, oder den KFZ je eine Spur wegnehmen. Letzteres lehnten die „Behörde für Wirtschaft und Innovation“ und die „Behörde Inneres und Sport“ 2019 ab – der Durchsatz für KFZ und Busse war wichtiger. Was will man da noch sagen?</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
