-- Data processing based on openmaptiles.org schema
-- https://openmaptiles.org/schema/
-- Copyright (c) 2016, KlokanTech.com & OpenMapTiles contributors.
-- Used under CC-BY 4.0

-- Enter/exit Tilemaker
function init_function() end
function exit_function() end

-- Implement Sets in tables
function Set(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

-- includes extra fields into the map, which are not needed for styling
DEBUG = false

-- Meters per pixel if tile is 256x256
ZRES5  = 4891.97
ZRES6  = 2445.98
ZRES7  = 1222.99
ZRES8  = 611.5
ZRES9  = 305.7
ZRES10 = 152.9
ZRES11 = 76.4
ZRES12 = 38.2
ZRES13 = 19.1

MIN = math.min
MAX = math.max

-- Process node tags
node_keys = { "addr:housenumber","aerialway","aeroway","amenity","highway","historic","leisure","natural","office","place","railway","shop","sport","tourism","waterway" }
function node_function(node)
  -- Write 'housenumber'
  local housenumber = node:Find("addr:housenumber")
  if housenumber~="" then
    node:Layer("housenumber", false)
    node:Attribute("housenumber", housenumber)
  end

  -- Write 'place'
  local place = node:Find("place")
  if place ~= "" then
    local mz = 13
    local pop = tonumber(node:Find("population")) or 0

    if     place == "continent"     then mz=0
    elseif place == "country"       then
      if     pop>50000000 then            mz=1
      elseif pop>20000000 then            mz=2
      else                                mz=3
      end
    elseif place == "state"         then mz=4
    elseif place == "city"          then mz=5
    elseif place == "town" and pop>8000 then mz=7
    elseif place == "town"          then mz=8
    elseif place == "village" and pop>2000 then mz=9
    elseif place == "village"       then mz=10
    elseif place == "suburb"        then mz=9
    elseif place == "hamlet"        then mz=12
    -- remove noisy names
    elseif place == "neighbourhood" then return
    elseif place == "locality"      then return
    elseif place == "borough"       then return
    elseif place == "square"        then return
    end

    node:Layer("place", false)
    node:Attribute("class", place)
    SetMinZoom(node, mz)
    SetNameAttributes(node)
    return
  end

  MaybeWritePOI(node)
end

-- Process way tags
MAJOR_ROAD_VALUES = Set { "motorway", "trunk", "motorway_link", "trunk_link" }
MAIN_ROAD_VALUES  = Set { "primary" }
MID_ROAD_VALUES   = Set { "tertiary", "secondary", "primary_link" }
MINOR_RAOD_VALUES = Set { "tertiary_link", "secondary_link", "unclassified", "residential", "road", "living_street" }
TRACK_VALUES     = Set { "cycleway", "byway", "bridleway", "track" }
PATH_VALUES      = Set { "footway", "path", "pedestrian" }
LINK_VALUES      = Set { "motorway_link", "trunk_link", "primary_link", "secondary_link", "tertiary_link" }
CONSTRUCTION_VALUES = Set { "primary", "secondary", "tertiary", "motorway", "service", "trunk", "track" }

AEROWAY_BUILDINGS = Set { "terminal", "gate", "tower" }

-- map values from various OSM keys to a known subset of classes
LANDCOVER_MAPPING = {
  -- sand
  beach="sand", sand="sand",
  -- ice
  glacier="ice", ice_shelf="ice",
  -- edu
  school="edu", university="edu", kindergarten="edu", college="edu",
  -- wood
  wood="wood", forest="wood", scrub="wood",
  -- commercial
  retail="commercial", commercial="commercial", stadium="commercial",
  -- grass
  grassland="grass", grass="grass", meadow="grass", park="grass", village_green="grass", recreation_ground="grass", garden="grass", golf_course="grass", zoo = "grass",
  -- farmland
  farmland="farmland", farm="farmland", orchard="farmland", vineyard="farmland", field="farmland",
  plant_nursery = "farmland",
  -- one offs
  allotments="allotments",
  cemetery="cemetery",
  hospital="hospital",
  industrial="industrial",
  military="military",
  pitch="pitch",
  playground="playground",
  quarry="rock",
  railway="railway",
  residential="residential",
  sports_centre="sports_centre",
  wetland = "wetland"
}
-- which of the classes are usually large and should be drawn below
LANDCOVER_DEMOTE = Set { "residential", "hospital", "commercial", "edu", "industrial", "sports_centre", "military" }

-- POI
POI_ALLOWED_OSM_TAGS = {
  aeroway = Set { "aerodrome" },
  aerialway = Set { "station" },
  amenity = Set { "arts_centre", "bank", "bar", "bbq", "bicycle_rental", "biergarten", "bus_station", "cafe", "cinema", "clinic", "college", "community_centre", "courthouse", "dentist", "doctors", "embassy", "fast_food", "ferry_terminal", "fire_station", "food_court", "fuel", "grave_yard", "hospital", "ice_cream", "kindergarten", "library", "marketplace", "nightclub", "nursing_home", "pharmacy", "place_of_worship", "police", "post_box", "post_office", "prison", "pub", "public_building", "recycling", "restaurant", "school", "swimming_pool", "telephone", "theatre", "toilets", "townhall", "university", "veterinary", "compressed_air", "drinking_water" },
  building = Set { "dormitory" },
  highway = Set { "bus_stop" },
  natural = Set { "beach", "peak", "bay" },
  historic = Set { "monument", "castle", "ruins" },
  landuse = Set { "basin", "brownfield", "cemetery", "reservoir", "winter_sports", "allotments", "farmland" },
  leisure = Set { "dog_park", "escape_game", "garden", "golf_course", "ice_rink", "hackerspace", "marina", "miniature_golf", "park", "pitch", "playground", "sports_centre", "stadium", "swimming_area", "swimming_pool", "water_park" },
  railway = Set { "halt", "station", "tram_stop" },
  shop = Set { "*" },
  sport = Set { "american_football", "archery", "athletics", "australian_football", "badminton", "baseball", "basketball", "beachvolleyball", "billiards", "bmx", "boules", "bowls", "boxing", "canadian_football", "canoe", "chess", "climbing", "climbing_adventure", "cricket", "cricket_nets", "croquet", "curling", "cycling", "disc_golf", "diving", "dog_racing", "equestrian", "fatsal", "field_hockey", "free_flying", "gaelic_games", "golf", "gymnastics", "handball", "hockey", "horse_racing", "horseshoes", "ice_hockey", "ice_stock", "judo", "karting", "korfball", "long_jump", "model_aerodrome", "motocross", "motor", "multi", "netball", "orienteering", "paddle_tennis", "paintball", "paragliding", "pelota", "racquet", "rc_car", "rowing", "rugby", "rugby_league", "rugby_union", "running", "sailing", "scuba_diving", "shooting", "shooting_range", "skateboard", "skating", "skiing", "soccer", "surfing", "swimming", "table_soccer", "table_tennis", "team_handball", "tennis", "toboggan", "volleyball", "water_ski", "yoga" },
  tourism = Set { "alpine_hut", "aquarium", "attraction", "bed_and_breakfast", "camp_site", "caravan_site", "chalet", "gallery", "guest_house", "hostel", "hotel", "information", "motel", "museum", "picnic_site", "theme_park", "viewpoint", "zoo" },
  waterway = Set { "dock" }
}

-- map OSM *values* to min zooms
POI_MIN_ZOOM = {
  -- bicycle related amenities
  bicycle=14,
  compressed_air=15, drinking_water=15,
  bicycle_rental=15,

  -- greenery/nature
  zoo=12,
  peak=15,
  park="byArea", forest="byArea",
  grave_yard="byArea", cemetery="byArea",
  golf="byArea", golf_course="byArea", miniature_golf="byArea",

  -- food and drink
  bar=17, nightclub=17,
  fast_food=17, food_court=17,
  restaurant=17,

  -- shopping
  greengrocer=15, marketplace=15, supermarket=15, deli=15, delicatessen=15,
  bag=17, clothes=17, shop=17,
  department_store=17,

  -- edu
  school=15, kindergarten=15,
  university="byArea", college="byArea",

  -- transport
  marina=14, dock=14, ferry_terminal=14,
  halt=14, station=14, tram_stop=14,
  bus_stop=17, bus_station=17,

  -- others
  hospital=12, nursing_home=12, clinic=12,
  townhall=12, public_building=12, courthouse=12,
  aerodrome=12,
  stadium=12,
  police=15,
  books=15, library=15,
  camp_site=15, caravan_site=15,
  viewpoint=16,
  post_box=17, post_office=17,
  attraction=18,
  place_of_worship="byArea",
}

-- map OSM *values* to specific icons
POI_ICON_MAPPER = {
  aerodrome="airport",
  alcohol="alcohol_shop", beverages="alcohol_shop", wine="alcohol_shop",
  american_football="stadium", stadium="stadium", soccer="stadium",
  art="art_gallery", artwork="art_gallery", gallery="art_gallery", arts_centre="art_gallery",
  bag="clothing_store", clothes="clothing_store",
  bbq="bbq",
  biergarten="beer", pub="beer",
  books="library",
  bus_stop="bus_stop", bus_station="bus_stop",
  camp_site="campsite", caravan_site="campsite",
  chocolate="ice_cream",
  dry_cleaning="laundry",
  farmland="farm",
  ferry_terminal="ferry",
  food_court="fast_food",
  forest="park",
  golf_course="golf", miniature_golf="golf",
  grave_yard="cemetery",
  hotel="lodging", motel="lodging", bed_and_breakfast="lodging", guest_house="lodging", hostel="lodging", chalet="lodging", alpine_hut="lodging", dormitory="lodging",
  kindergarten="school",
  marina="harbor", dock="harbor",
  musical_instrument="music",
  nursing_home="hospital", clinic="hospital",
  peak="mountain",
  post_box="post",  post_office="post",
  ruins="castle",
  supermarket="grocery", deli="grocery", delicatessen="grocery", department_store="grocery", greengrocer="grocery", marketplace="grocery",
  swimming_area="swimming",
  townhall="town_hall", public_building="town_hall", courthouse="town_hall",
  university="college", college="college",
  bicycle_rental="bicycle_share",
}

-- Used to put "dot" as an icon whenver we don't have a more specific image.
-- Replaced by the build process.
KNOWN_ICONS = "%%REPLACE_WITH_ICONS%%"

WATER_CLASSES    = Set { "river", "riverbank", "stream", "canal", "drain", "ditch", "dock" }
WATERWAY_CLASSES = Set { "stream", "river", "canal", "drain", "ditch" }

-- Scan relations for use in ways

function relation_scan_function(relation)
  if relation:Find("type")=="boundary" and relation:Find("boundary")=="administrative" then
    relation:Accept()
  end
end

-- Process way tags

function way_function(way)
  local route    = way:Find("route")
  local highway  = way:Find("highway")
  local waterway = way:Find("waterway")
  local water    = way:Find("water")
  local building = way:Find("building")
  local natural  = way:Find("natural")
  local landuse  = way:Find("landuse")
  local leisure  = way:Find("leisure")
  local amenity  = way:Find("amenity")
  local aeroway  = way:Find("aeroway")
  local railway  = way:Find("railway")
  local tourism  = way:Find("tourism")
  local man_made = way:Find("man_made")
  local boundary = way:Find("boundary")
  local isClosed = way:IsClosed()
  local isArea = isClosed and SetToYes(way, "area")
  local housenumber = way:Find("addr:housenumber")
  local write_name = false

  -- Miscellaneous preprocessing
  if SetToYes(way, "disused") then return end
  if highway == "proposed" then return end
  if AEROWAY_BUILDINGS[aeroway] then building="yes"; aeroway="" end
  if landuse == "meadow" and way:Find("meadow")=="agricultural" then landuse="farmland" end

  -- Boundaries within relations
  local admin_level = 11
  local isBoundary = false
  while true do
    local rel = way:NextRelation()
    if not rel then break end
    isBoundary = true
    admin_level = MIN(admin_level, tonumber(way:FindInRelation("admin_level")) or 11)
  end

  -- Boundaries in ways
  if boundary=="administrative" then
    admin_level = MIN(admin_level, tonumber(way:Find("admin_level")) or 11)
    isBoundary = true
  end

  -- Administrative boundaries
  -- https://openmaptiles.org/schema/#boundary
  if isBoundary and admin_level >= 4 and admin_level <= 6 and not SetToYes(way, "maritime") then
    way:Layer("boundary",false)
    if DEBUG then way:AttributeNumeric("DEBUG_admin_level", admin_level) end
    SetMinZoom(way, 0)
  end

  -- Roads ('transportation')
  if highway~="" and building=="" then
    local construction = false
    if highway == "construction" then
      construction = true
      highway = way:Find("construction")
    end

    local h = highway
    local minzoom = nil
    if MAJOR_ROAD_VALUES[highway] then              minzoom = 4 end
    if highway == "trunk"         then              minzoom = 5
    elseif highway == "primary"   then              minzoom = 7 end
    if MAIN_ROAD_VALUES[highway]  then              minzoom = 9 end
    if MID_ROAD_VALUES[highway]   then              minzoom = 10 end
    if MINOR_RAOD_VALUES[highway] then h = "minor"; minzoom = 11 end
    if TRACK_VALUES[highway]      then h = "track"; minzoom = 12 end
    if PATH_VALUES[highway]       then h = "path" ; minzoom = 13 end
    if highway == "steps"         then              minzoom = 14 end
    if h=="service"               then              minzoom = 14 end
    local access = way:Find("access")
    if access=="private" or access=="no" then     minzoom = 14 end

    -- Links (ramp)
    local ramp=false
    if LINK_VALUES[highway] then
      local splitHighway, _, _ = Cut(highway, "_")
      highway = splitHighway
      h = highway
      ramp = true
      minzoom = 11
    end

    -- Write to layer
    if minzoom then
      if construction then
        way:Layer("transportation_construction", isArea)
      else
        way:Layer("transportation", isArea)
      end
      SetMinZoom(way, minzoom)
      SetZOrder(way)
      way:Attribute("class", h)
      SetBrunnelAttributes(way)
      if ramp then way:AttributeNumeric("ramp", 1) end
      SetOnewayForBicycles(way)
      SetNameAttributes(way)

      if DEBUG then
        local ref = way:Find("ref")
        if ref~="" then way:Attribute("DEBUG_ref",ref) end
        way:Attribute("DEBUG_highway",highway)
      end
    end
  end

  -- Railways ('transportation')
  if railway~="" then
    way:Layer("transportation", isArea)
    way:Attribute("class", railway)
    SetZOrder(way)
    SetBrunnelAttributes(way)
    -- SetNameAttributes(way)
    if way:Holds("service") then
      way:AttributeNumeric("service", 1)
      SetMinZoom(way, 12)
    else
      SetMinZoom(way, 9)
    end
  end

  -- Pier
  if man_made=="pier" or man_made=="bridge" then
    way:Layer("transportation", isClosed)
    SetZOrder(way)
    way:Attribute("class", man_made)
    SetMinZoomByArea(way)
  end

  -- 'Ferry'
  if route=="ferry" then
    way:Layer("transportation", false)
    way:Attribute("class", "ferry")
    SetZOrder(way)
    SetMinZoom(way, 9)
    SetBrunnelAttributes(way)
    SetNameAttributes(way)
  end

  -- 'Aeroway'
  if aeroway~="" then
    way:Layer("aeroway", isClosed)
    way:Attribute("class", aeroway)
    write_name = true
  end

  -- Set 'waterway' and associated
  if WATERWAY_CLASSES[waterway] and not isClosed then
    if waterway == "river" and way:Holds("name") then
      way:Layer("waterway", false)
    else
      way:Layer("waterway_detail", false)
    end
    way:Attribute("class", waterway)
    SetNameAttributes(way)
    SetBrunnelAttributes(way)
  elseif waterway == "boatyard"  then way:Layer("landcover", isClosed); way:Attribute("class", "commercial"); way:Attribute("subclass", waterway); SetMinZoom(way, 12)
  elseif waterway == "dam"       then way:Layer("building", isClosed)
  elseif waterway == "fuel"      then way:Layer("landcover", isClosed); way:Attribute("class", "commercial"); way:Attribute("subclass", waterway); SetMinZoom(way, 14)
  end
  -- Set names on rivers
  if WATERWAY_CLASSES[waterway] and not isClosed then
    way:Layer("water_name", false)
    way:Attribute("class", waterway)
    SetNameAttributes(way)
  end

  -- Set 'building' and associated
  if building~="" then way:Layer("building", true) end

  -- Set 'housenumber'
  if housenumber~="" then
    way:LayerAsCentroid("housenumber", false)
    way:Attribute("housenumber", housenumber)
  end

  -- Set 'water'
  if natural=="water" or natural=="bay" or leisure=="swimming_pool" or landuse=="reservoir" or landuse=="basin" or WATER_CLASSES[waterway] then
    if SetToYes(way, "covered") or not isClosed then return end
    local class="lake"; if natural=="bay" then class="ocean" elseif waterway~="" then class="river" end
    if class=="ocean" and isClosed and (way:AreaIntersecting("ocean")/way:Area() > 0.98) then return end
    way:Layer("water",true)
    SetMinZoomByArea(way)
    way:Attribute("class",class)

    -- we only want to show the names of actual lakes not every man-made basin that probably doesn't even have a name other than "basin"
    -- examples for which we don't want to show a name:
    --  https://www.openstreetmap.org/way/25958687
    --  https://www.openstreetmap.org/way/27201902
    --  https://www.openstreetmap.org/way/25309134
    --  https://www.openstreetmap.org/way/24579306
    if way:Holds("name") and natural=="water" and water ~= "basin" and water ~= "wastewater" then
      way:LayerAsCentroid("water_name")
      SetNameAttributes(way)
      SetMinZoomByArea(way)
      way:Attribute("class", class)
    end

    return -- in case we get any landuse processing
  end

  -- Set 'landcover' (from landuse, natural, leisure)
  local l = landuse
  if l=="" then l=natural end
  if l=="" then l=leisure end
  if l=="" then l=amenity end
  if l=="" then l=tourism end
  if l=="" then l=aeroway end
  if LANDCOVER_MAPPING[l] then
    local class = LANDCOVER_MAPPING[l]
    way:Layer("landcover", true)
    -- need to keep areas at relatively high zoom level to ensure "green areas"
    -- get combined properly and don't vanish when zooming out.
    local minZoom = GetMinZoomByArea(way)-1
    SetMinZoom(way, minZoom)
    way:Attribute("class", class)

    -- promote small objects on high zooms only. This should hopefully allow
    -- merging polygons at low zooms where it's not noticable.
    if not LANDCOVER_DEMOTE[class] and minZoom >= 10 then
      way:ZOrder(1)
      if DEBUG then way:AttributeNumeric("DEBUG_zorder", 1) end
    end
    if DEBUG then way:AttributeNumeric("minZoom", minZoom) end
    write_name = true
  end

-- POIs
  if MaybeWritePOI(way) then return end

  -- Catch-all
  if way:Holds("name") and (write_name or (building~="" and building~="apartments"))  then
    local area = way:Area()
    local minZoom = 18
    if      area > 2500 then minZoom = 15
    elseif area > 2000 then minZoom = 16
    elseif area > 1500 then minZoom = 17
    else                    minZoom = 18
    end
    if write_name then minZoom = minZoom - 1 end

    way:LayerAsCentroid("poi")
    SetNameAttributes(way)
    SetMinZoom(way, minZoom)
    way:AttributeNumeric("minzoom", minZoom)
    -- intentionally no icon for ways, so that there's no "dot" when we mean an area
    way:Attribute("icon", "")

    if DEBUG then
      way:Attribute("DEBUG_catchall", "yes")
      local str = "no"
      if write_name then str = "yes" end
      way:Attribute("DEBUG_write_name", str)
    end
  end
end

-- Remap coastlines
function attribute_function(attr,layer)
  if attr["featurecla"]=="Glaciated areas" then
    return { subclass="glacier" }
  elseif attr["featurecla"]=="Antarctic Ice Shelf" then
    return { subclass="ice_shelf" }
  elseif attr["featurecla"]=="Urban area" then
    return { class="residential" }
  else
    return { class="ocean" }
  end
end

-- ==========================================================
-- Common functions

-- Write a way centroid to POI layer
function MaybeWritePOI(obj)
  local key, val = FindPOIKeyVal(obj)
  if not key then return false end

  local minZoom = POI_MIN_ZOOM[val] or 18
  if minZoom == "byArea" then minZoom = GetMinZoomByArea(obj)+1 end

  local icon = POI_ICON_MAPPER[val] or val
  if icon == "restaurant" then
    local detail = "restaurant_"..obj:Find("cuisine")
    if KNOWN_ICONS[detail] then
      icon = detail
    end
  elseif icon == "airport" then
    if obj:Find("aerodrome:type") ~= "international" then
      icon = "airfield"
    end
  elseif icon == "pitch" then
    local sport = obj:Find("sport")
    if KNOWN_ICONS[sport] then icon = sport end
  elseif key == "railway" then
    icon = FindTrainOperatorIcon(obj) or icon
  elseif icon == "bicycle_share" and IsStadtrad(obj) then
    icon = "stadtrad"
  end

  if not KNOWN_ICONS[icon] then icon = "dot" end

  obj:LayerAsCentroid("poi")
  SetMinZoom(obj, minZoom)
  SetNameAttributes(obj)
  obj:AttributeNumeric("minzoom", minZoom)
  obj:Attribute("icon", icon)

  if DEBUG then
    obj:Attribute("DEBUG_KEY", key)
    obj:Attribute("DEBUG_VAL", val)
  end

  return true
end

function IsStadtrad(obj)
  local network = string.lower(obj:Find("network"))
  if network == "call a bike" or string.starts_with(network, "stadtrad") then return true end

  local operator = string.lower(obj:Find("operator"))
  if string.starts_with(operator, "deutsche bahn connect") then return true end

  local brand = string.lower(obj:Find("brand"))
  if brand == "stadtrad hamburg" or brand == "call a bike" then return true end

  return false
end

function string.starts_with(str, prefix)
  return string.sub(str, 1, string.len(prefix)) == prefix
end


function SetMinZoom(obj, minZoom)
  -- don't exceed the maxZoom as per config.json or the object will be dropped completely
  obj:MinZoom(MIN(14, minZoom))
end

function FindPOIKeyVal(obj)
  for key, allowed_values in pairs(POI_ALLOWED_OSM_TAGS) do
    local val = obj:Find(key)
    if allowed_values[val] or (val ~= "" and allowed_values["*"]) then
      return key, val
    end
  end
  return nil, nil
end

-- Set name attributes on any object
function SetNameAttributes(obj)
  local name = obj:Find("name")
  if name == "" then name = obj:Find("name:de") end
  if name ~= "" then obj:Attribute("name", name) end
end

function SetBrunnelAttributes(obj)
  if     SetToYes(obj, "bridge") then obj:Attribute("brunnel", "bridge")
  elseif SetToYes(obj, "tunnel") then obj:Attribute("brunnel", "tunnel")
  elseif SetToYes(obj, "ford")   then obj:Attribute("brunnel", "ford")
  end
end

function SetOnewayForBicycles(way)
  if DEBUG then
    way:Attribute("DEBUG_oneway:bicycle", way:Find("oneway:bicycle"))
    way:Attribute("DEBUG_oneway", way:Find("oneway"))
    way:Attribute("DEBUG_cycleway", way:Find("cycleway"))
  end

  if SetToYes(way, "oneway:bicycle") then
    way:AttributeNumeric("oneway", 1)
    return
  end

  if SetToYes(way, "oneway") and
     (not SetToNo(way, "oneway:bicycle")) and
     (not (way:Find("cycleway") == "opposite"))
     then
    way:AttributeNumeric("oneway", 1)
  end
end



function SetMinZoomByArea(way)
  SetMinZoom(way, GetMinZoomByArea(way))
end

function GetMinZoomByArea(way)
  local area=way:Area()
  if area>ZRES5^2  then return 6  end
  if area>ZRES6^2  then return 7  end
  if area>ZRES7^2  then return 8  end
  if area>ZRES8^2  then return 9  end
  if area>ZRES9^2  then return 10 end
  if area>ZRES10^2 then return 11 end
  if area>ZRES11^2 then return 12 end
  if area>ZRES12^2 then return 13 end
  return 14
end


-- unfortunately tilemaker doesn't yet allow us to lookup nodes in relations,
-- which we need for this. The following list is ODbL licensed:
-- https://wiki.osmfoundation.org/wiki/Licence
-- generated via "iex -S mix" and "Overpass.station_icon_process_lua()"
STATION_ICONS = {
  akn = Set { "Hörgensweg","Boostedt","Meeschensee","Bönningstedt","Quickborn","Haslohfurth","Neumünster Süd","Holstentherme","Nützen","Sparrieshoop","Barmstedt","Moorbekhalle (Schulzentrum Nord)","Großenaspe","Bad Bramstedt","Bad Bramstedt Kurhaus","Lentföhrden","Neumünster","Friedrichsgabe","Quickborner Straße","Ulzburg Süd","Ellerau","Kaltenkirchen Süd","Wiemersdorf","Quickborn Süd","Henstedt-Ulzburg","Kaltenkirchen","dodenhof","Hasloh","Tanneneck","Burgwedel","Schnelsen","Elmshorn","Langenmoor","Bokholt","Voßloch","Barmstedt Brunnenstraße","Langeln","Alveslohe","Eidelstedt Zentrum" },
  sbahn = Set { "Neuwiedenthal","Veddel","Hammerbrook","Berliner Tor","Friedrichsberg","Hasselbrook","Bahrenfeld","Klein Flottbek (Botanischer Garten)","Hochkamp","Heimfeld","Harburg","Wilhelmsburg","Neukloster","Rübenkamp (City Nord)","Langenfelde","Wedel","Rissen","Iserbrook","Fischbek","Neu Wulmstorf","Halstenbek","Stellingen","Eidelstedt","Billwerder-Moorfleet","Bergedorf","Reinbek","Blankenese","Buxtehude","Harburg Rathaus","Poppenbüttel","Wellingsbüttel","Hoheneichen","Kornweg (Klein Borstel)","Ohlsdorf","Landwehr","Krupunder","Hamburg Airport (Flughafen)","Sternschanze (Messe)","Holstenstraße","Hamburg-Altona","Königstraße","Reeperbahn","Neugraben","Hamburg Hauptbahnhof","Jungfernstieg","Elbgaustraße","Wandsbeker Chaussee","Barmbek","Stadthausbrücke","Rothenburgsort","Aumühle","Othmarschen","Landungsbrücken","Alte Wöhr (Stadtpark)","Hamburg Dammtor / Universität","Tiefstack","Nettelnburg","Allermöhe","Mittlerer Landweg","Wohltorf","Agathenburg","Dollern","Horneburg","Pinneberg","Thesdorf","Sülldorf","Stade","Elbbrücken" },
  hochbahn = Set { "Hamburger Straße","Dehnhaide","Kiwittsmoor","Meiendorfer Weg","Wandsbek-Gartenstadt","Uhlandstraße","Barmbek","Baumwall (Elbphilharmonie)","Rödingsmarkt","Hagendeel","Großhansdorf","Hagenbecks Tierpark","Legienstraße","Rennbahnstraße","Billstedt","Bauerberg","Lübecker Straße","Berliner Tor","Neubertstraße","U Hamburger Straße","Rathausstraße","Alsterarkaden","Alstertor/Hermannstraße","Buckhorn","Hoisbüttel","Horner Rennbahn","U/S Landungsbrücken","Burgstraße","Rauhes Haus","Schlump","Eppendorfer Baum","Sierichstraße","Borgweg (Stadtpark)","Ochsenzoll","Mümmelmannsberg","Merkenstraße","Steinfurther Allee","Habichtstraße","Norderstedt Mitte","Sternschanze (Messe)","Klosterstern","Hammer Straße","Brauhausstraße","Mundsburg","Mühlendamm","Berlinertordamm","Lutterothstraße","Christuskirche","Osterstraße","Emilienstraße","Messehallen","Gänsemarkt (Oper)","Feldstraße (Heiligengeistfeld)","Lohmühlenstraße","Wartenau","Ritterstraße","Straßburger Straße","Alter Teichweg","Dammtorstraße","Plan","Saarlandstraße","Sengelmannstraße (City Nord)","Alsterdorf","Hudtwalckerstraße","Langenhorn Nord","Langenhorn Markt","Fuhlsbüttel Nord","Fuhlsbüttel","Klein Borstel","Meßberg","Rathaus","Steinstraße","Buschweg","HafenCity Universität","Mühlendamm / Lübeckertordamm","Kleine Rosenstraße","Goernestraße","Kleine Reichenstraße / Brandstwiete","Brandstwiete / Speicherstadt","Rathausmarkt","Petrikirche","Mönckebergstraße","Stephansplatz (Oper/CCH)","Alsterhaus","Alsterpavillion","Reesendamm","Ballindamm","Petrikirche/Bergstraße","Rathausmarkt/Alter Wall","Jungfernstieg","Alsterufer","Alstertor/Ferdinandsstraße","Gänsemarkt","Valentinskamp","Finanzbehörde","ABC-Straße","Neue ABC-Straße","Drehbahn","Johannes-Brahms-Platz","Caffamacherreihe","Schmalenbeck","Westphalensweg","Hallerstraße","Ahrensburg West","Kiekut","Buchenkamp","Landungsbrücken","Hauptbahnhof Süd","Farmsen","U-Stephansplatz","Joachim-Mähl-Straße","Richtweg","Klosterwall","Lange Mühren","Johanniswall","BeimStrohhause/Berliner Tor","Beim Strohhause","Kurt-Schill-Weg","U-Rödingsmarkt","Borgweg","Wandsbeker Chaussee","Rückertstraße","Ohlsdorf","Lattenkamp","Lattenkamp (Sporthalle)","Börnestraße","Menckesallee","Seumestraße","Ohlstedt","Lübeckertordamm","Lübeckertordamm Steinhauerdamm","Hauptbahnhof Nord","Ruckteschellweg","Wagnerstraße","Wandsbek Markt","Trabrennbahn","Berne","Volksdorf","Ahrensburg Ost","Niendorf Markt","Alter Teichweg / Tondernstieg","Alter Teichweg / Gravensteiner Weg","Tondernstraße / Gravensteiner Weg","St. Pauli","Steintorwall","Garstedt","Beim Strohhause / Hammerbrookstraße","Niendorf Nord","Schippelsweg","Überseequartier","Hoheluftbrücke","Loogeplatz","Kriegkamp","Berner Heerweg","Markthalle","Elbbrücken","Kandinskyallee","Lindenplatz","Beim Berliner Tor","Helma-Steinbach-Weg","Fibigerstraße","Speckstraße","Staatsoper","Lübecker Straße / Mühlendamm","U-Bahn Steinfurther Allee","Wandrahmsteg","TriBühne Norderstedt","Baakenwerder Straße","Hammer Kirche","Versmannstraße","Rathausmarkt/Schleusenbrücke","Oldenfelde","Kellinghusenstraße" }
}
function FindTrainOperatorIcon(obj)
  local name = obj:Find("name")
  for operator, stations in pairs(STATION_ICONS) do
    if stations[name] then return operator end
  end
  return nil
end

-- Implement z_order as calculated by Imposm
-- See https://imposm.org/docs/imposm3/latest/mapping.html#wayzorder for details.
-- See https://github.com/omniscale/imposm3/blob/53bb80726ca9456e4a0857b38803f9ccfe8e33fd/mapping/columns.go#L251
HIGHWAY_CLASS = { motorway=9, trunk=8, primary=6, secondary=5, tertiary=4 }
function SetZOrder(way)
  local zOrder = 0

  local bridge = way:Find("bridge")
  local tunnel = way:Find("tunnel")
  if bridge ~= "" and bridge ~= "no" then
    zOrder = zOrder + 10
  elseif tunnel ~= "" and tunnel ~= "no" then
    zOrder = zOrder - 10
  end

  local layer = tonumber(way:Find("layer")) or 0
  layer = MIN(layer, 7)
  layer = MAX(layer, -7)
  zOrder = zOrder + layer * 10

  local highway = way:Find("highway")
  local hwClass = HIGHWAY_CLASS[highway] or 3
  zOrder = zOrder + hwClass
  way:ZOrder(zOrder)
end

function Cut(input, sep)
  local idx = string.find(input, sep)
  if idx then
    local before = string.sub(input, 1, idx-1)
    local after = string.sub(input, idx+1)
    return before, after, true
  end
  return input, "", false
end

function SetToYes(obj, key)
  local value = obj:Find(key)
  return value == "1" or value == "yes"
end


function SetToNo(obj, key)
  local value = obj:Find(key)
  return value == "0" or value == "no"
end
