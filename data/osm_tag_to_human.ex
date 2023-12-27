defmodule Data.OsmTagToHuman do
  @spec map() :: %{binary() => [binary()]}
  def map(),
    do: %{
      "access_point" => ~w[Rettungspunkt],
      "adult_gaming_centre" => ~w[Spielcasino Spielothek Spielhalle],
      "advertising_agency" => ~w[Werbeagentur],
      "aerodrome" => ~w[Flugplatz Flugfeld Landeplatz Flughafen],
      "allotment_house" => ~w[Gartenhäuschen],
      "allotments" => ~w[Kleingärten Schrebergärten],
      "ambulance_station" => ~w[Rettungswache],
      "antiques" => ~w[Antikgeschäft],
      "apartment" => ~w[Wohngebäude Wohnhaus],
      "apartments" => ~w[Wohngebäude Wohnhaus],
      "apron" => ~w[Vorfeld],
      "archaeological_site" => ~w[Archäologische Stätte],
      "architect" => ~w[Architekturbüro Architekt],
      "arts_centre" => ~w[Kunstzentrum],
      "artwork" => ~w[Kunstwerk],
      "association" => ~w[Interessengemeinschaft Verein],
      "atm" => ~w[Geldautomat],
      "attraction" => ~w[Sehenswürdigkeit Attraktion],
      "bakery" => ~w[Bäckerei Bäcker],
      "bank" => ~w[Bank-Filiale Bank],
      "bar" => ~w[Bar],
      "barn" => ~w[Scheune],
      "basin" => ~w[Becken],
      "beach" => ~w[Strand],
      "beauty" => ~w[Kosmetik Kosmetiksalon Parfümerie],
      "beekeeper" => ~w[Imkerei Imker],
      "bench" => ~w[Sitzbank Parkbank],
      "beverages" => ~w[Getränkemarkt],
      "bicycle_parking" => ~w[Fahrradparken],
      "bicycle_rental" => ~w[Fahrradverleih StadtRAD],
      "bicycle_repair_station" => ~w[Fahrradreparaturstation],
      "biergarten" => ~w[Biergarten],
      "blacksmith" => ~w[Schmiede Schmied],
      "boat_rental" => ~w[Bootsverleih],
      "boatyard" => ~w[Werft],
      "bookmaker" => ~w[Buchmacher],
      "books" => ~w[Buchladen],
      "boundary_stone" => ~w[Grenzstein],
      "bowling_alley" => ~w[Kegelbahn],
      "brewery" => ~w[Brauerei],
      "bridge" => ~w[Brücke],
      "bridleway" => ~w[Reitweg],
      "brothel" => ~w[Bordell],
      "brownfield" => ~w[Brachfläche],
      "building" => ~w[Gebäude],
      "bunker" => ~w[Bunker],
      "bus_station" => ~w[Bushaltestelle Bushalt Busbahnhof],
      "bus_stop" => ~w[Bushaltestelle Bushalt],
      "butcher" => ~w[Fleischerei Metzgerei],
      "cafe" => ~w[Café Kaffee Kaffeehaus],
      "camp_pitch" => ~w[Campingplatz Zeltplatz],
      "camp_site" => ~w[Campingplatz],
      "canal" => ~w[Kanal],
      "canteen" => ~w[Kantine],
      "cape" => ~w[Kap],
      "car_parts" => ~w[Autoersatzteilverkauf],
      "car_rental" => ~w[Autovermietung],
      "car_repair" => ~w[Autowerkstatt Autoreparatur],
      "car_sharing" => ~w[Car Sharing],
      "car_wash" => ~w[Autowaschanlage],
      "caravan_site" => ~w[Campingplatz],
      "carpenter" => ~w[Zimmerei Zimmerer],
      "carpet" => ~w[Teppichfachgeschäft],
      "casino" => ~w[Casino],
      "castle" => ~w[Burg],
      "caterer" => ~w[Caterer],
      "cathedral" => ~w[Kathedrale],
      "cemetery" => ~w[Friedhof],
      "chapel" => ~w[Kapelle],
      "charging_station" => ~w[Ladestation],
      "charity" => ~w[Wohltätigkeitsverein],
      "chemist" => ~w[Apotheke],
      "childcare" => ~w[Kindergarten KiTa],
      "church" => ~w[Kirche],
      "cinema" => ~w[Kino Lichtspiele Lichtspielhaus],
      "clinic" => ~w[Klinik Krankenhaus],
      "clock" => ~w[Uhr],
      "clockmaker" => ~w[Uhrmacher],
      "clothes" => ~w[Bekleidungsgeschäft Kleiderladen Klamottenladen],
      "coffee" => ~w[Café Kaffee Kaffeehaus],
      "college" => ~w[Universität Hochschule],
      "commercial" => ~w[Gewerbegebiet],
      "community_centre" =>
        ~w[Gemeinschaftszentrum Kulturhaus Gemeindezentrum Jugendfreizeiteinrichtung Jugendzentrum],
      "company" => ~w[Firma Unternehmen],
      "compressed_air" => ~w[Luftpumpe],
      "computer" => ~w[Computerfachgeschäft],
      "confectionery" => ~w[Süßwarengeschäft],
      "construction" => ~w[Baustelle],
      "convenience" => ~w[Tante-Emma-Laden Spätkauf Kiosk],
      "copyshop" => ~w[Copyshop],
      "cosmetics" => ~w[Kosmetikgeschäft],
      "courthouse" => ~w[Gericht],
      "coworking" => ~w[Coworking],
      "crane" => ~w[Kran],
      "crematorium" => ~w[Krematorium],
      "cycleway" => ~w[Radweg Fahrradweg],
      "dance" => ~w[Tanzsaal],
      "dancing_school" => ~w[Tanzschule Schule],
      "defibrillator" => ~w[Defibrillator],
      "deli" => ~w[Feinkostladen],
      "dentist" => ~w[Zahnarzt],
      "department_store" => ~w[Kaufhaus Warenhaus],
      "diplomatic" => ~w[Konsulatsbüro],
      "ditch" => ~w[Graben Wassergraben],
      "doctor" => ~w[Ärztehaus Ärzte Arzt],
      "doctors" => ~w[Ärztehaus Ärzte Arzt],
      "dog_park" => ~w[Hundepark],
      "doityourself" => ~w[Baumarkt],
      "dormitory" => ~w[Wohnheim],
      "drain" => ~w[Kanal Abwasserkanal],
      "drinking_water" => ~w[Trinkbrunnen Trinkwasser],
      "driving_school" => ~w[Fahrschule],
      "dry_cleaning" => ~w[Chemische Reinigung],
      "dyke" => ~w[Deich],
      "electrician" => ~w[Elektriker],
      "electronics" => ~w[Elektrofachgeschäft],
      "elevator" => ~w[Fahrstuhl Aufzug],
      "embankment" => ~w[Böschung],
      "emergency_access_point" => ~w[Rettungspunkt],
      "employment_agency" => ~w[Arbeitsvermittlung Arbeitsamt],
      "estate_agent" => ~w[Immobilienhändler Immobilienmakler Makler],
      "events_venue" => ~w[Veranstaltungsort],
      "farm" => ~w[Bauernhof Farm],
      "farmland" => ~w[Acker Ackerfläche],
      "farmyard" => ~w[Hofgelände Bauernhof],
      "fast_food" => ~w[Imbiss Schnellimbiss Fast Food],
      "ferry_terminal" => ~w[Schiffsanleger],
      "fire_station" => ~w[Feuerwehr Feuerwehrhaus],
      "fire_water_pond" => ~w[Löschwasserteich],
      "fitness_centre" => ~w[Fitnessstudio],
      "fitness_station" => ~w[Fitnessstation],
      "flight_school" => ~w[Flugschule],
      "florist" => ~w[Blumenladen Blumenhändler Florist],
      "footway" => ~w[Fußweg],
      "forest" => ~w[Wald Forst],
      "fountain" => ~w[Springbrunnen Brunnen],
      "fuel" => ~w[Tankstelle],
      "funeral_directors" => ~w[Bestattungsunternehmen Bestatter],
      "funeral_hall" => ~w[Trauerhalle],
      "furniture" => ~w[Möbelgeschäft Möbelladen Möbel],
      "gallery" => ~w[Galerie],
      "gambling" => ~w[Casino],
      "garden_centre" => ~w[Gartencenter Gärtnerei],
      "garden" => ~w[Garten Grünfläche],
      "gardener" => ~w[Gärtnerei],
      "gate" => ~w[Tor Pforte],
      "gift" => ~w[Geschenkladen],
      "glaziery" => ~w[Glaserei],
      "golf_course" => ~w[Golfplatz],
      "government" => ~w[Behörde Amt],
      "grass" => ~w[Wiese],
      "grassland" => ~w[Wiese],
      "grave_yard" => ~w[Friedhof],
      "greenfield" => ~w[Wiese],
      "greengrocer" => ~w[Obst- und Gemüsehandel],
      "greenhouse" => ~w[Gewächshaus],
      "guest_house" => ~w[Pension],
      "hairdresser" => ~w[Friseur],
      "halt" => ~w[Haltestelle],
      "hamlet" => ~w[Siedlung Weiler],
      "hangar" => ~w[Hanger],
      "hardware" => ~w[Eisenwarenhandlung],
      "hearing_aids" => ~w[Geschäft für Hörgeräte],
      "heath" => ~w[Heideland],
      "helipad" => ~w[Helikopterlandeplatz Helipad],
      "horse_riding" => ~w[Reitplatz],
      "hospital" => ~w[Krankenhaus Klinik],
      "hostel" => ~w[Jugendherberge],
      "hotel" => ~w[Hotel],
      "house" => ~w[Gebäude Haus],
      "houseware" => ~w[Haushaltswarenladen],
      "hunting_stand" => ~w[Hochsitz],
      "hut" => ~w[Hütte],
      "hvac" => ~w[Heizungsbauer],
      "ice_cream" => ~w[Eisdiele],
      "industrial" => ~w[Industriegebiet],
      "information" => ~w[Information Infotafel],
      "insurance" => ~w[Versicherungsmakler],
      "interior_decoration" => ~w[Geschäft für Inneneinrichtung],
      "island" => ~w[Insel],
      "isolated_dwelling" => ~w[Einzelsiedlung],
      "jeweller" => ~w[Juwelier Juweliergeschäft Schmuckwarenladen],
      "jewelry" => ~w[Juweliergeschäft Schmuckwarenladen Juwelier],
      "junction" => ~w[Straßenkreuzung],
      "kindergarten" => ~w[KiTa Kindergarten],
      "kiosk" => ~w[Kiosk],
      "kitchen" => ~w[Küchenstudio],
      "landfill" => ~w[Mülldeponie Müllhalde],
      "language_school" => ~w[Sprachschule],
      "laundry" => ~w[Waschsalon Wäscherei],
      "lawyer" => ~w[Anwaltsbüro],
      "letter_box" => ~w[Briefkasten],
      "library" => ~w[Bücherhalle Bibliothek],
      "life_ring" => ~w[Rettungsring],
      "lifeguard" => ~w[Rettungsschwimmer Strandwächter],
      "light_rail" => ~w[Stadtbahn],
      "lighthouse" => ~w[Leuchtturm],
      "locksmith" => ~w[Schlüsseldienst Schlüsselladen Schlosser],
      "mall" => ~w[Einkaufszentrum],
      "manhole" => ~w[Einstiegsluke Kanaldeckel Gully],
      "manor" => ~w[Landgut Rittergut Schloss Herrenhaus],
      "marina" => ~w[Jachthafen],
      "marketplace" => ~w[Marktplatz],
      "massage" => ~w[Massagesalon],
      "meadow" => ~w[Wiese Grünfläche],
      "medical_supply" => ~w[Sanitätshaus],
      "memorial" => ~w[Denkmal],
      "metal_construction" => ~w[Metallverarbeitung],
      "midwife" => ~w[Geburtshelfer Hebamme],
      "milestone" => ~w[Kilometerstein Stationszeichen],
      "miniature_golf" => ~w[Minigolf],
      "mobile_phone" => ~w[Handy-Shop Handyladen Mobiltelefonladen],
      "monastery" => ~w[Kloster],
      "monitoring_station" => ~w[Messstation],
      "monument" => ~w[Denkmal Monument],
      "mosque" => ~w[Moschee],
      "motel" => ~w[Motel Hotel],
      "motorcycle_parking" => ~w[Motorradparkplatz],
      "motorcycle_repair" => ~w[Motorradwerkstatt Motorradreparatur],
      "motorcycle" => ~w[Motorradladen],
      "museum" => ~w[Museum],
      "music_school" => ~w[Musikschule],
      "music" => ~w[Musikgeschäft],
      "nature_reserve" => ~w[Naturschutzgebiet],
      "newsagent" => ~w[Zeitungshändler],
      "newspaper" => ~w[Zeitungshändler],
      "nightclub" => ~w[Nachtclub],
      "notary" => ~w[Notariat],
      "nursing_home" => ~w[Pflegeheim Altenheim],
      "office" => ~w[Bürogebäude],
      "optician" => ~w[Optiker Brillenladen],
      "optometrist" => ~w[Augenoptiker],
      "orchard" => ~w[Obstplantage],
      "painter" => ~w[Maler],
      "parcel_locker" => ~w[Packstation Paketstation],
      "parish_hall" => ~w[Gemeindehaus],
      "park" => ~w[Park Grünanlage],
      "parking_entrance" => ~w[Garageneinfahrt Einfahrt Parkhaus Einfahrt Tiefgarage],
      "parking_space" => ~w[Parkplatz],
      "parking" => ~w[Parkplatz],
      "passing_place" => ~w[Ausweichstelle],
      "pawnbroker" => ~w[Pfandleihe Pfandhaus],
      "peak" => ~w[Gipfel],
      "pedestrian" => ~w[Fußgängerzone],
      "perfumery" => ~w[Parfümerie],
      "pet" => ~w[Zoofachgeschäft],
      "pharmacy" => ~w[Apotheke],
      "phone" => ~w[Telefon],
      "photo_booth" => ~w[Telefonzelle],
      "photographer" => ~w[Fotograf Photograph],
      "physiotherapist" => ~w[Krankengymnastik Physiotherapeut],
      "picnic_site" => ~w[Picknickstelle],
      "picnic_table" => ~w[Picknicktisch],
      "pier" => ~w[Landungsbrücke Seebrücke],
      "pipeline" => ~w[Pipeline],
      "pitch" => ~w[Spielfeld],
      "place_of_worship" => ~w[Andachtsort Kultstätte],
      "plant_nursery" => ~w[Baumschule],
      "platform" => ~w[Bahnsteig Bussteig],
      "playground" => ~w[Spielplatz],
      "plumber" => ~w[Klempnerei],
      "podiatrist" => ~w[Fußpflege Podologe],
      "police" => ~w[Polizei],
      "political_party" => ~w[Parteibüro],
      "port" => ~w[Hafen],
      "post_box" => ~w[Briefkasten],
      "post_office" => ~w[Postamt Post],
      "pottery" => ~w[Töpferei],
      "prison" => ~w[Gefängnis Justizvollzugsanstalt Knast],
      "protected_area" => ~w[Naturschutzgebiet],
      "psychotherapist" => ~w[Psychotherapeut],
      "pub" => ~w[Kneipe Pub],
      "public_bookcase" => ~w[Bücherregal],
      "public_building" => ~w[Gebäude],
      "pumping_station" => ~w[Pumpstation],
      "quarry" => ~w[Steinbruch],
      "quay" => ~w[Kai],
      "recreation_ground" => ~w[Park],
      "recycling" => ~w[Recyclingcontainer Wertstoffhof],
      "reservoir_covered" => ~w[Wasserbehälter],
      "residential" => ~w[Wohngebiet],
      "rest_area" => ~w[Rastplatz],
      "restaurant" => ~w[Restaurant],
      "retail" => ~w[Einzelhandel],
      "river" => ~w[Fluss],
      "roofer" => ~w[Dachdecker],
      "ruins" => ~w[Ruine],
      "runway" => ~w[Rollbahn Landebahn Startbahn],
      "sauna" => ~w[Sauna],
      "scaffolder" => ~w[Gerüstbauer],
      "school" => ~w[Schule Grundschule Realschule Gesamtschule],
      "scrub" => ~w[Gestrüpp],
      "seafood" => ~w[Fischgeschäft],
      "second_hand" => ~w[Second Hand Laden],
      "shed" => ~w[Schuppen],
      "shelter" => ~w[Unterstand Wetterschutz],
      "ship" => ~w[Schiff],
      "shoemaker" => ~w[Schuhmacher],
      "shoes" => ~w[Schuhgeschäft Schuhladen],
      "signal_box" => ~w[Stellwerk],
      "silo" => ~w[Silo],
      "social_facility" => ~w[Sozialeinrichtung],
      "sport" => ~w[Sportfachgeschäft],
      "sports_centre" => ~w[Sportzentrum],
      "sports_hall" => ~w[Turnhalle Sporthalle],
      "sports" => ~w[Sportfachgeschäft],
      "square" => ~w[Platz],
      "stable" => ~w[Stall],
      "stables" => ~w[Ställe],
      "stadium" => ~w[Stadion],
      "station" => ~w[Bahnstation],
      "stationery" => ~w[Schreibwarengeschäft],
      "steps" => ~w[Treppe Stufen],
      "stone" => ~w[Stein],
      "stonemason" => ~w[Steinmetz],
      "stream" => ~w[Bach],
      "street_cabinet" => ~w[Straßenschrank Postablagekasten Schaltschrank],
      "suburb" => ~w[Stadtteil],
      "subway_entrance" => ~w[U/S-Bahn Eingang],
      "suction_point" => ~w[Ansaugstelle],
      "supermarket" => ~w[Supermarkt],
      "surveillance" => ~w[Überwachungskamera],
      "swimming_area" => ~w[Schwimmbereich],
      "synagogue" => ~w[Synagoge],
      "tailor" => ~w[Schneider],
      "tanning_salon" => ~w[Sonnenstudio],
      "tattoo" => ~w[Tattoo-Studio],
      "tax_advisor" => ~w[Steuerberatung Steuerberater],
      "taxi" => ~w[Taxistand],
      "taxiway" => ~w[Rollbahn Rollfeld],
      "tea" => ~w[Teegeschäft],
      "telephone" => ~w[Telefon],
      "telescope" => ~w[Sternwarte],
      "temple" => ~w[Tempel],
      "terrace" => ~w[Terrasse],
      "theatre" => ~w[Theater],
      "theme_park" => ~w[Freizeitpark Themenpark],
      "ticket" => ~w[Ticketautomat],
      "tobacco" => ~w[Tabakladen],
      "toilets" => ~w[Toiletten],
      "tomb" => ~w[Grab],
      "tool_rental" => ~w[Werkzeugverleih],
      "tower" => ~w[Turm],
      "town" => ~w[Stadt],
      "townhall" => ~w[Rathaus],
      "toys" => ~w[Spielwarenladen],
      "track" => ~w[Wirtschaftsweg Feldweg Waldweg],
      "trade" => ~w[Baustoffhandel],
      "train_station" => ~w[Bahnhof Bahnhofsgebäude],
      "tram_stop" => ~w[Straßenbahnhaltestelle Straßenbahnhalt],
      "travel_agency" => ~w[Reisebüro],
      "travel_agent" => ~w[Reisebüro],
      "tree" => ~w[Baum],
      "union" => ~w[Gewerkschaft],
      "university" => ~w[Universität],
      "variety_store" => ~w[1-Euro-Laden Sonderpostenmarkt],
      "vehicle_inspection" => ~w[Fahrzeugkontrolle],
      "vending_machine" => ~w[Verkaufsautomat],
      "veterinary" => ~w[Tierarzt Veterinär],
      "viewpoint" => ~w[Aussichtspunkt Aussichtsplattform],
      "village_green" => ~w[Dorfwiese],
      "village" => ~w[Dorf],
      "warehouse" => ~w[Lagerhalle Lagerhaus],
      "waste_basket" => ~w[Mülleimer Abfalleimer],
      "wastewater_plant" => ~w[Kläranlage],
      "watches" => ~w[Uhrenladen],
      "water_park" => ~w[Wasserpark],
      "water_tank" => ~w[Wasserbecken],
      "water_tower" => ~w[Wasserturm],
      "water_well" => ~w[Wasserbrunnen],
      "water_works" => ~w[Wasserwerk],
      "water" => ~w[Gewässer],
      "watermill" => ~w[Wassermühle],
      "wayside_chapel" => ~w[Kapellenbildstock],
      "wayside_shrine" => ~w[Bildstock],
      "weir" => ~w[Stauanlage Damm],
      "wetland" => ~w[Feuchtgebiet],
      "wholesale" => ~w[Großhandel Großmarkt],
      "windmill" => ~w[Windmühle],
      "wine" => ~w[Weinladen],
      "wood" => ~w[Wald],
      "works" => ~w[Fabrik],
      "zoo" => ~w[Zoo]
    }
end
