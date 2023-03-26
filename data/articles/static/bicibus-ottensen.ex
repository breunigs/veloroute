defmodule Data.Article.Static.BicibusOttensen do
  use Article.Static

  def id(), do: "bicibus-ottensen"
  def display_id(), do: "Bicibus"
  def route_group(), do: :bezirk
  def title(), do: "Bicibus Ottensen"

  def color(), do: "#049EAB"

  def summary(),
    do:
      "Der Bicibus – eine Fahrradtour mit Fahrplan – fährt jeden Freitag die Schulen im Stadtteil an."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "bicibus-ottensen",
        direction: :forward,
        from: "Max-Brauer-Schule",
        via: [
          "Gymnasium Altona",
          "Rudolf-Steiner Schule",
          "Schule Rothestraße",
          "Schule Bahrenfelder Straße"
        ],
        to: "Max-Brauer-Schule",
        parent_ref: __MODULE__,
        text: "Bicibus Ottensen",
        videos: [
          {"2023-03-26-bicibus-elbchausee/GX015277", "00:00:02.502", :end},
          {"2023-03-26-bicibus-elbchausee/GX015278", :start, :end},
          {"2023-03-26-bicibus-elbchausee/GX015279", :start, "00:00:27.861"},
          {"2023-03-26-bicibus-elbchausee/GX015273", "00:00:51.552", :end},
          {"2023-03-26-bicibus-elbchausee/GX015274", :start, "00:00:30.731"},
          {"2023-03-26-bicibus-elbchausee/GX015269", "00:00:36.436", "00:01:15.727"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Infoseite zum Bicibus VCD Nord", "https://nord.vcd.org/themen/bicibus"},
      {"Flugblatt Bicibus",
       "https://nord.vcd.org/fileadmin/user_upload/Nord/Nord/BICIBUS/flyer_bicibus_page7.jpg"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Der Bicibus ist eine geführte Fahrradtour mit festem Fahrplan, der jeden (Schul-) Freitag fährt. So lernen die Kleinen wie man mit dem Fahrrad zur Schule kommt und die Großen hoffentlich, dass sich die Verkehrsplanung ändern muss, damit die Kinder auch ohne Polizeibegleitung sicher durch die Stadt kommen.</p>

    <p>Der Bicibus wird vom <.a href="https://nord.vcd.org/themen/bicibus">VCD Nord</.a> organisiert. Mithilfe ist gern gesehen – für Kontaktdetails siehe bitte beim VCD.</p>

    <h4>Fahrplan</h4>
    <p>Jeden Schul-Freitag:</p>
    <ul>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.921731} lat={53.561262} dir="forward" ref="bicibus-ottensen">7:30 Uhr Max-Brauer-Schule</.v></li>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.917598} lat={53.552316} dir="forward" ref="bicibus-ottensen">7:39 Uhr Gymnasium Altona</.v></li>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.921269} lat={53.550836} dir="forward" ref="bicibus-ottensen">7:41 Uhr Rudolf-Steiner Schule</.v></li>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.928535} lat={53.548529} dir="forward" ref="bicibus-ottensen">7:43 Uhr Schule Rothestraße (Ankunft)</.v></li>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.928598} lat={53.548592} dir="forward" ref="bicibus-ottensen">7:44 Uhr Schule Rothestraße (Abfahrt)</.v></li>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.928239} lat={53.558301} dir="forward" ref="bicibus-ottensen">7:53 Uhr Schule Bahrenfelder Straße</.v></li>
      <li><.v bounds="9.917444,53.548191317365266,9.929041748502994,53.562109" lon={9.921731} lat={53.561262} dir="forward" ref="bicibus-ottensen">7:56 Uhr Max-Brauer-Schule</.v></li>
    </ul>



    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
