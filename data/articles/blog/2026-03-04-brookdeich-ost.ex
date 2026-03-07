defmodule Data.Article.Blog.BrookdeichOst do
  use Article.Default

  def title(), do: "Brookdeich (Radroute Plus Geesthacht – ab Curslacker Heerweg)"

  def summary(),
    do:
      "Brookdeich sollte zur Fahrradstraße werden. Bis die Anschlussstellen mitgeplant sind, liegt der Umbau vorerst auf Eis."

  def type(), do: :planned

  def tags(), do: ["rsw-geesthacht"]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Erläuterungen und Pläne", ~d[2026-03],
       "https://fragdenstaat.de/anfrage/radroute-plus-brookdeich-curslacker-heerweg-kehre/#nachricht-1094801"},
      {"Umbaustopp durch Bezirksversammlung", ~d[2026-02],
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1009449"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Bergedorf, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bergedorf/bezirksamt/dezernat-wirtschaft-bauen-umwelt-56028"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird im <.ref>Mischverkehr</.ref> bei Tempo 30 geführt. Stellenweise fehlt ein Gehweg. Die Straße ist offiziell – auch für den Radverkehr – eine Sackgasse.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Straße soll zu einer Fahrradstraße umgebaut werden. Wo Gehwege fehlen, sollen sie ergänzt werden.</p>

    <p>Die Anschlussstellen sind nicht Teil dieser Planung. Gerade die Weiterführung in Richtung Osten ist offiziell nicht für den Radverkehr zugelassen. Daher hat die Bezirksversammlung Bergedorf den Umbau zunächst gestoppt. Wenn Ampel am <.v bounds="10.239428,53.476467,10.242436,53.477828" lon={10.240418} lat={53.477298} dir="forward" ref={RSWGeesthacht}>Curslacker Heersweg</.v> und eine <.v bounds="10.251835,53.471583,10.255559,53.473885" lon={10.253016} lat={53.472853} dir="forward" ref={RSWGeesthacht}>neue Brücke</.v> mit Schleswig-Holstein abgestimmt sind, soll es weitergehen.</p>

    <h4>Meinung</h4>
    <p>Im Abschnitt sind in der Tat die Anschlussstellen das Problem. Da sich die Straße auch schon heute brauchbar befahren lässt, ist eine Verschiebung daher verschmerzlich.</p>

    <p>Die „Dagegen“-Parteien hätten ihre Zeit sinnvoller nutzen können. Etwa indem sie mit der Nachbargemeinde reden und das Projekt dort vorantreiben.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
