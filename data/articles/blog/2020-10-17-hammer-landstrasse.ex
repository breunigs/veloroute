defmodule Data.Article.Blog.HammerLandstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-10-17]

  def title(), do: "Hammer Landstraße (ab Diagonalstraße)"

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "article",
        direction: :backward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Hammer Landstraße (stadteinwärts)",
        videos: [
          {"2022-05-26-14im-13gg/GX014011", :start, :end},
          {"2022-05-26-14im-13gg/GX014013", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "article",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Hammer Landstraße (stadtauswärts)",
        videos: [
          {"2022-05-15-13im-14gg/GX013924", "00:00:02.536", :end},
          {"2022-05-15-13im-14gg/GX013925", :start, :end},
          {"2022-05-15-13im-14gg/GX013926", :start, :end},
          {"2022-05-15-13im-14gg/GX013927", :start, "00:00:11.612"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/14463994/d3162e0fa0e762030f648c2692a20272/data/hammer-landstrasse-horner-landstrasse-zwischen-diagonalstrasse-und-culinstrasse-abstimmungsunterlage-bericht.pdf"},
      {"Pläne des ersten Entwurfs",
       "https://lsbg.hamburg.de/contentblob/14463996/ff7ce1faeac27fdfb4fbd5211c19ef76/data/hammer-landstrasse-horner-landstrasse-zwischen-diagonalstrasse-und-culinstrasse-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Die Radwege werden neben den Fußwegen als <.ref>Hochbordradweg</.ref> geführt. Überholt werden kann nicht, denn dafür ist die Breite deutlich zu gering. Auch der Asphalt oder das Pflaster ist in die Jahre gekommen und stellenweise unangenehm zu befahren.</p>
    <h4>Planung</h4> <p>Der Radverkehr soll künftig auf rund 2,0m breiten <.ref>Radfahrstreifen</.ref> geführt werden. Eine Trennung zum vierspurigen KFZ-Verkehr ist nicht vorgesehen, wenn man von dem weißen Trennstrich absieht. KFZ-Parkplätze werden rechts des Radfahrstreifens eingerichtet, wobei hier 60cm Sicherheitsabstand vorgesehen ist, um <.ref name="dooring">Autotür-Unfällen</.ref> vorzubeugen. Wo keine Parkplätze sind, wird der Hochbordradweg beibehalten.</p>
    <p>In den KFZ-Einbahnstraßen <.v bounds="10.065873,53.553064,10.068956,53.553989" lon={10.0672432} lat={53.5534713} dir="forward" ref={@ref}>Schurzallee-Nord</.v> und dem <.v bounds="10.0633,53.553292,10.06704,53.554414" lon={10.0647776} lat={53.5539221} dir="forward" ref={@ref}>Wichernsweg</.v> wird der gegenläufige Radverkehr durch bauliche Elemente besser getrennt. Aus letzterem kann man <.ref name="direktes-und-indirektes-abbiegen">direkt Richtung Innenstadt abbiegen</.ref>. Entlang der Hammer Landstraße ist an dieser Stelle ein <.ref>Radfahrstreifen in Mittellage</.ref> vorgesehen, bei dem sich die Rad-Geradeausspur zwischen KFZ-Geradeaus und allen Rechtsabbiegern befindet.</p>
    <p>An den Bushaltestellen muss der Radverkehr entweder hinter dem Bus warten, oder sich in den KFZ-Verkehr einordnen.</p>
    <p>Die Umsetzung der Maßnahme wird momentan für 2022 geplant.</p>
    <h4>Meinung</h4> <p>Man hat sich im Vorfeld ordentlich damit befasst, ob man eine KFZ-Spur entfernen kann, um dem Rad- und Fußverkehr mehr Komfort zu ermöglichen. Leider hat man sich dagegen entschieden, weil man den Komfort für KFZ höher bewertet.</p>
    <p>Der erste Entwurf folgt im Wesentlichen dem Hamburger Standard und bietet daher eine solide Grundlage, aber auch kaum Überraschungen. Probleme dieses Modells, wie der geringe Sicherheitsabstand zu den fahrenden und parkenden KFZ bleiben erhalten, ebenso der häufig als „Angstweiche“ verspottete Radfahrstreifen in Mittellage am <.v bounds="10.0633,53.553292,10.06704,53.554414" lon={10.0647776} lat={53.5539221} dir="forward" ref={@ref}>Wichernsweg</.v>. Schade ist auch, das nicht überall links abgebogen werden kann, oder nur durch Absteigen über den Fußweg.</p>
    <p>Unterm Strich wird Radfahren hier deutlich angenehmer, bleibt aber weit hinter den Möglichkeiten zurück. Wer es lieber etwas ruhiger mag, findet mit der grob parallel verlaufenden <.m bounds="10.038495,53.546434,10.094111,53.559319">Veloroute 8</.m> möglicherweise eine Alternative.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
