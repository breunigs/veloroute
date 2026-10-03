defmodule Data.Article.Blog.HartwicusstrasseSchuerbekerStrasse do
  use Article.Default

  def title(), do: "Hartwicusstraße und Schürbeker Straße (Radrouten 6 und 12)"

  def summary(),
    do: "Statt durch den Park führt die Radroute 6 über eine neue Ampel."

  def type(), do: :planned
  def start(), do: ~d[2027Q3]
  def stop(), do: ~d[2027Q3]

  def tags(), do: ["radroute-6", "6", "N16", "radroute-12"]

  def map_image do
    {name(), [{"Ingenieurpartnerschaft Diercks Schröder", "https://www.ids-hh.de/kontakt/"}]}
  end

  def links(_assigns) do
    [
      {"1. Entwurf, Karte und Erläuterung", ~d[2026-10],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1017140"},
      {"Mögliche andere Führungsverläufe (Stellungnahme BVM)", ~d[2025-07],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi//vo020.asp?VOLFDNR=1015301"},
      {"NDR: Führung der Route soll nochmals geprüft werden", ~d[2024-10],
       "https://www.ndr.de/nachrichten/hamburg/Bezirk-Hamburg-Nord-Geplante-Veloroute-6-auf-Pruefstand,veloroute128.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird bzw. wurde zwischen der <.v bounds="10.020132,53.565604,10.024992,53.566952" lon={10.0220022} lat={53.5660667} dir="forward" ref={@ref}>Hartwicusstraße</.v> und dem <.v bounds="10.025646,53.566341,10.030505,53.567689" lon={10.0274425} lat={53.5670232} dir="forward" ref={@ref}>Immenhof</.v> durch einen Park geleitet.</p>

    <p>In <.v bounds="10.022086,53.565058,10.027133,53.567978" lon={10.026084} lat={53.566927} dir="backward" ref={Radroute6}>Richtung Innenstadt</.v> kann man auch auf der Straße bleiben. Stadtauswärts ist dies nur durch lange Umwege möglich.</p>

    <h4>Vorige Planung</h4>
    <p>Anfangs war angedacht, die Führung durch den Park zu verbessern. Dies scheiterte aus verschiedenen Gründen. Für Details siehe <.a ref={Kuhmuehlenteichpark}>Artikel Kuhmühlenteichpark</.a>.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Einmündung erhält eine neue Ampel damit der Radverkehr aus der <.v bounds="10.022086,53.565058,10.027133,53.567978" lon={10.022916} lat={53.566051} dir="forward" ref={Radroute6}>Hartwicusstraße</.v> direkt links in die Schürbeker Straße abbiegen kann. In <.v bounds="10.022086,53.565058,10.027133,53.567978" lon={10.026084} lat={53.566927} dir="backward" ref={Radroute6}>Fahrtrichtung Innenstadt</.v> bleibt es grob wie heute.</p>

    <h4>Meinung</h4>
    <p>Dass die Ampel unattraktiv ist, merkt das Planungsbüro selbst an. Die Stadt sollte wenigstens prüfen ob eine Grüne Welle entlang der Radroute möglich ist, damit man nicht an jeder Ampel Zeit verliert.</p>

    <p>Besser sollte das gesamte Verkehrskonzept angepasst werden. Momentan orientieren sich <em>alle</em> Nord-Süd-Straßen im Umfeld an den Wünschen des Autoverkehrs. Mit <.v bounds="10.017903,53.563493,10.024529,53.568089" lon={10.019918} lat={53.565444} dir="forward" ref={Radroute6}>Mundsburger Damm</.v>, <.v bounds="10.022527,53.564664,10.027086,53.567176" lon={10.02465} lat={53.565539} dir="backward" ref={Radroute12}>Schürbeker Straße</.v> und <.v bounds="10.029092,53.565525,10.033997,53.568485" lon={10.03021} lat={53.567553} dir="forward" ref={LerchenfeldWartenau}>Lerchenfeld</.v> stehen zwölf exklusive KFZ-Fahrspuren zur Verfügung.</p>

    <p>Wenn man zwei KFZ-Spuren durch einen grünen Mittelstreifen ersetzt, könnte Queren auch ohne Ampel möglich sein. So wie heute an der <.v bounds="10.048312,53.572706,10.05177,53.574856" lon={10.049396} lat={53.573647} dir="forward" ref={Radroute6}>Friedrichsberger Straße</.v>, nur großzügiger.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
