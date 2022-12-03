defmodule Overpass do
  @akn_operator "Q266805"
  @hochbahn_operator "Q6442"
  @sbahn_operator "Q99869216"
  @base "https://overpass-api.de"
  @path "/api/interpreter"

  use Tesla

  plug Tesla.Middleware.BaseUrl, @base
  plug Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]
  plug Tesla.Middleware.JSON
  plug TeslaCache

  def akn_only_stations do
    akn = query(station_query(@akn_operator))
    hochbahn = query(station_query(@hochbahn_operator))
    sbahn = query(station_query(@sbahn_operator))

    (akn -- hochbahn) -- sbahn
  end

  def query(data) do
    {:ok, resp} = get(@path, query: [data: data])
    resp.body["elements"] |> Enum.map(& &1["tags"]["name"]) |> Enum.uniq()
  end

  def station_icon_data_styling do
    """
    [
      "case",

      ["match", ["get", "maki"], ["bus"], true, false],
      "busstop",

      ["match", ["get", "maki"], ["ferry"], true, false],
      "ferry",

      ["match", ["get", "name"], [#{akn_map_names()}], true, false],
      "akn",

      ["match", ["get", "maki"], ["", "rail-metro"], true, false],
      "de-u-bahn",

      ["match", ["get", "maki"], ["rail", "rail-light"], true, false],
      "de-s-bahn",

      "dot-10"
    ]
    """
  end

  def station_color_map_data_styling do
    """

    [
      "case",

      ["match", ["get", "maki"], ["bus"], true, false],
      "#5d5b5b",

      ["match", ["get", "name"], [#{akn_map_names()}], true, false],
      "#c4840e",

      ["match", ["get", "maki"], ["rail", "rail-light"], true, false],
      "hsl(140, 74%, 37%)",

      "hsl(230, 48%, 44%)"
    ]

    """
  end

  def station_color_sat_data_styling do
    """

    [
      "case",

      ["match", ["get", "maki"], ["bus"], true, false],
      "hsl(0, 0%, 79%)",

      ["match", ["get", "name"], [#{akn_map_names()}], true, false],
      "#f8bb49",

      ["match", ["get", "maki"], ["rail", "rail-light"], true, false],
      "hsl(140, 73%, 76%)",

      "hsl(230, 87%, 86%)"
    ]

    """
  end

  def akn_map_names do
    akn_only_stations()
    |> Enum.map(&String.replace(&1, ~r{ \(.*}, ""))
    |> Enum.map(&"\"#{&1}\"")
    |> Enum.join(",")
  end

  def station_query(operator) do
    [minLon, minLat, maxLon, maxLat] = Settings.bounds()

    """
    [out:json][timeout:25];

    relation["operator:wikidata"="#{operator}"](#{minLat},#{minLon},#{maxLat},#{maxLon});
    node["railway"]["name"](r);


    // print results
    out body;
    >;
    out skel qt;
    """
  end
end
