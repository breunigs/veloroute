defmodule Search.Meilisearch.OSMNames do
  @behaviour Search.Meilisearch.Behaviour

  @impl true
  def id(), do: :osmnames

  @impl true
  def documents() do
    Basemap.OSMNames.ensure()

    osm_id2street =
      Basemap.OSMNames.target_tsv_house_numbers()
      |> File.stream!([read_ahead: 100_000], 1000)
      |> CSV.decode!(headers: true, separator: ?\t)
      |> Enum.into(%{}, fn %{"osm_id" => osm_id, "street" => street, "housenumber" => hn} ->
        {osm_id, String.trim("#{street} #{hn}")}
      end)

    Basemap.OSMNames.target_tsv()
    |> File.stream!([read_ahead: 100_000], 1000)
    |> CSV.decode!(headers: true, separator: ?\t)
    |> Enum.map(&single(&1, osm_id2street))
  end

  @impl true
  def params(query, lat, lon) do
    %{
      q: query,
      limit: 10,
      sort: [
        "place_rank:asc",
        "importance:desc",
        "_geoPoint(#{lat}, #{lon}):asc"
      ]
    }
  end

  @tags_to_human %{
    "bench" => ["Sitzbank", "Parkbank"],
    "bicycle_rental" => ["Fahrradverleih", "StadtRAD"],
    "boat_sharing" => ["Bootsverleih"],
    "bus_station" => ["Bushaltestelle", "Bushalt"],
    "bus_stop" => ["Bushaltestelle", "Bushalt"],
    "cinema" => ["Kino", "Lichtspiele", "Lichtspielhaus"],
    "clinic" => ["Klinik", "Krankenhaus"],
    "compressed_air" => ["Luftpumpe"],
    "courthouse" => ["Gericht"],
    "dentist" => ["Zahnarzt"],
    "doctors" => ["Ärztehaus", "Ärzte", "Arzt"],
    "fire_station" => ["Feuerwehr", "Feuerwehrhaus"],
    "flight_school" => ["Flugschule"],
    "hospital" => ["Krankenhaus", "Klinik"],
    "kindergarten" => ["KiTa", "Kindergarten"],
    "library" => ["Bücherhalle", "Bibliothek"],
    "pharmacy" => ["Apotheke"],
    "police" => ["Polizei"],
    "port" => ["Hafen"],
    "prison" => ["Gefängnis", "Justizvollzugsanstalt", "Knast"],
    "school" => ["Schule", "Grundschule", "Realschule", "Gesamtschule"],
    "theatre" => ["Theater"],
    "university" => ["Universität"],
    # abandoned
    # adult_cinema
    # aerodrome
    # amphitheatre
    # animal_boarding
    # animal_breeding
    # animal_shelter
    # animal_training
    # archive
    # art_gallery
    # art_school
    # arts_centre
    # atm
    # audiologist
    # baby_hatch
    # bank
    # bar
    # bay
    # bbq
    # beauty_salon
    # bell
    "bicycle_parking" => ["Fahrradparken"],
    "bicycle_repair_station" => ["Fahrradreparaturstation"],
    # biergarten
    # boat_rental
    # boat_storage
    # borough
    # bridleway
    # brothel
    # building_society
    # building_yard
    # bureau_de_change
    # bus_rental
    "cafe" => ["Café", "Kaffee", "Kaffeehaus"],
    # callshop
    # camp_site
    # canal
    # canteen
    # car_rental
    # car_sharing
    # car_wash
    # casino
    # charging_station
    # charity
    # childcare
    # childminder
    # city
    # city_district
    "clock" => ["Uhr"],
    # clubhouse
    "coffee" => ["Café", "Kaffee", "Kaffeehaus"],
    "college" => ["Universität", "Hochschule"],
    # community_centre
    # company
    # conference_centre
    # construction
    # cooking_school
    # corridor
    # county
    # coworking_space
    "crematorium" => ["Krematorium"],
    # cycleway
    "dancing_school" => ["Tanzschule", "Schule"],
    # designer
    # disused:restaurant
    # ditch
    # dive_centre
    # dog_parking
    # dog_training
    # dojo
    # drain
    # dressing_room
    "drinking_water" => ["Trinkbrunnen", "Trinkwasser"],
    # driver_training
    # driving_school
    # ebsuinesslotse
    # education
    # education_centre
    # educational
    # elevator
    # emergency_service
    # events_venue
    # exhibition_centre
    "farm" => ["Bauernhof", "Farm"],
    # fast_food
    # ferry_terminal
    # festival_grounds
    # financial_advice
    # first_aid_school
    # food_court
    # food_sharing
    # footway
    # foresters_house
    "fountain" => ["Springbrunnen", "Brunnen"],
    # fraternity
    # freeshop
    # fuel
    # funeral_hall
    # galabau
    # galerie
    # gambling
    # give_box
    # grave_yard
    # grit_bin
    # hamlet
    # harbourmaster
    # health_insurance
    # hill
    # hookah_lounge
    # hunting_stand
    "ice_cream" => ["Eisdiele"],
    # internet_cafe
    # island
    # islet
    # isolated_dwelling
    # laboratory
    "language_school" => ["Sprachschule"],
    "letter_box" => ["Briefkasten"],
    # library
    # library_station
    # lifeboat
    # lifeboat_station
    # living_street
    # locality
    # lounge
    # luggage_locker
    # marketplace
    # mobile_library
    # monastery
    # money_transfer
    # mortuary
    # motorcycle_parking
    # motorway
    # motorway_link
    # municipality
    # music_school
    # music_venue
    # nail_bar
    # nameplate
    # neighbourhood
    # nightclub
    # nursing_home
    # parcel_locker
    # parish_hall
    # parish_rooms
    # parking
    # parking_entrance
    # parking_space
    # path
    # payment_terminal
    # peak
    # pedestrian
    # photo_booth
    # place_of_worship
    # planetarium
    # platform
    # playstation
    # post_depot
    # post_office
    # post_partner
    # post_pickup
    # prep_school
    # primary
    # printer
    # proposed
    # pub
    # public_bath
    # public_bookcase
    # public_building
    # publisher
    # publishing_house
    # quarter
    # raceway
    # ranger_station
    # recycling
    # refugee_site
    # research_institute
    # reservoir
    # residential
    # rest_area
    # restaurant
    # Restaurant & Bar
    # reuse
    # river
    # road_maintenance
    # sailing_school
    # scout_camp
    # Seniorentreff
    # service
    # services
    # shelter
    # shower
    # smoking_area
    # social_centre
    # social_facility
    # spa
    # speech_therapist
    # sport
    # sports_club
    # square
    # stables
    # state
    # state_district
    # station
    # steps
    # stock_exchange
    # stream
    # stripclub
    # studio
    # suburb
    # swingerclub
    # taxi
    # telephone
    # tertiary
    # toilets
    "tool_rental" => ["Werkzeugverleih"],
    # town
    "townhall" => ["Rathaus"],
    # toy_library
    # track
    # traffic_park
    # trailer_rental
    # training
    # trunk
    # trunk_link
    # unclassified
    # vehicle_inspection
    # vending_machine
    "veterinary" => ["Tierarzt", "Veterinär"]
    # village
    # waste_basket
    # waste_disposal
    # waste_transfer_station
    # wastewater_pump
    # water
    # water_point
    # watering_place
    # weighbridge
    # yes
  }

  @impl true
  def format(result) do
    f = fn arg -> Map.get(result, arg, nil) end

    human_type = Map.get(@tags_to_human, result["type"], []) |> List.first()
    bbox = Geo.BoundingBox.parse(f.("bbox"))

    %Search.Result{
      bounds: bbox,
      center: Geo.CheapRuler.center(bbox),
      name: result["name"],
      relevance: f.("_rankingScore"),
      # todo: determine streets?
      type: if(f.("class") in ["place"], do: "poi", else: ""),
      subtext:
        [
          human_type,
          f.("street"),
          f.("city"),
          f.("county"),
          f.("state")
        ]
        |> Enum.uniq()
        |> Util.compact()
        |> List.delete(result["name"])
        |> Enum.join(", ")
    }
  end

  @impl true
  def config() do
    # i.e. invert the map
    synonyms =
      Enum.reduce(@tags_to_human, %{}, fn {tag, humans}, acc ->
        Enum.reduce(humans, acc, fn human, acc ->
          Map.update(acc, human, [tag], &[tag | &1])
        end)
      end)

    %{
      # result will be rendered directly from the article
      displayedAttributes: ~w(name street city county state class type bbox _geo),
      # order is from most important to least important
      searchableAttributes: ~w(name street city county state alternative_names type),
      sortableAttributes: ~w(importance place_rank _geo),
      synonyms: synonyms
    }
  end

  @spec single(map(), %{required(integer()) => binary()}) :: map()
  defp single(line, osm_id2street) do
    geo = %{lat: Map.fetch!(line, "lat"), lng: Map.fetch!(line, "lon")}
    f = fn arg -> Map.fetch!(line, arg) end

    bbox =
      [
        f.("west"),
        f.("south"),
        f.("east"),
        f.("north")
      ]
      |> Enum.join(",")

    street = f.("street")
    street = if blank?(street), do: osm_id2street[f.("osm_id")], else: street

    %{
      _geo: geo,
      bbox: bbox,
      id: "#{f.("osm_type")}#{f.("osm_id")}",
      importance: if(f.("importance") == "0", do: 0, else: String.to_float(f.("importance"))),
      place_rank: String.to_integer(f.("place_rank")),
      class: f.("class"),
      type: f.("type"),
      name: f.("name"),
      state: f.("state"),
      city: f.("city"),
      county: f.("county"),
      street: street,
      alternative_names: f.("alternative_names") |> String.split(",")
    }
    |> compact()
  end

  defp compact(map) do
    Map.reject(map, fn {_k, v} -> blank?(v) end)
  end

  @compile {:inline, blank?: 1}
  defp blank?(str), do: str in ["", nil]
end
