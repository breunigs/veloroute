defmodule Mix.Tasks.EditMap do
  use Mix.Task

  @josm_home File.cwd!() <> "/data/josmhome/"
  @josm_default_prefs File.cwd!() <> "/data/josm_default_prefs.xml"
  @session_path File.cwd!() <> "/data/cache/map_session.jos"
  @map_path File.cwd!() <> "/data/map.osm"
  @style_debug_path File.cwd!() <> "/data/style_debug.osm"

  @shortdoc "Prepares data for viewing and opens map in JOSM"
  def run(_) do
    # ensure images are up to date if there have been edits outside this helper
    Mix.Tasks.UpdateImages.run(nil)

    write_josm_session()

    {_stream, 0} =
      System.cmd(
        "josm",
        [
          "--offline=osm_api,josm_website,certificates",
          "--load-preferences=#{@josm_default_prefs}",
          @session_path
        ],
        env: [{"JAVA_OPTS", "-Djosm.home=#{@josm_home}"}]
      )

    # run in extra process to ensure we recompile after map update
    IO.puts("Updating images…")
    {_stream, 0} = System.cmd("mix", ["update_images"], into: IO.stream(:stdio, :line))
    IO.puts("Updating GPX…")
    {_stream, 0} = System.cmd("mix", ["update_gpx"], into: IO.stream(:stdio, :line))
  end

  defp write_josm_session do
    xml = """
      <?xml version="1.0" encoding="utf-8"?>
      <josm-session version="0.1">
          <projection>
              <projection-choice>
                  <id>core:mercator</id>
                  <parameters/>
              </projection-choice>
              <code>EPSG:3857</code>
          </projection>
          <layers active="1">
              <layer index="1" name="Map" type="osm-data" version="0.1" visible="true">
                  <file>file:#{@map_path}</file>
              </layer>
              <layer index="2" name="Images (read only)" type="osm-data" version="0.1" visible="true">
                  <file>file:#{Mix.Tasks.UpdateImages.imgpath()}</file>
              </layer>
              <layer index="3" name="Style Debug" type="osm-data" version="0.1" visible="false">
                  <file>file:#{@style_debug_path}</file>
              </layer>
              <layer index="4" name="OpenStreetMap (Standard Black &amp; White)" type="imagery" version="0.1" visible="true">
                  <name>OpenStreetMap (Standard Black &amp; White)</name>
                  <id>osm-mapnik-black_and_white</id>
                  <type>tms</type>
                  <url>https://tiles.wmflabs.org/bw-mapnik/{zoom}/{x}/{y}.png</url>
                  <attribution-text>© OpenStreetMap contributors, CC-BY-SA</attribution-text>
                  <attribution-url>https://www.openstreetmap.org/</attribution-url>
                  <max-zoom>18</max-zoom>
                  <valid-georeference>true</valid-georeference>
                  <modTileFeatures>true</modTileFeatures>
                  <customHttpHeaders>{}</customHttpHeaders>
                  <transparent>true</transparent>
                  <minimumTileExpire>3600</minimumTileExpire>
                  <category>osmbasedmap</category>
                  <show-errors>true</show-errors>
                  <automatic-downloading>true</automatic-downloading>
                  <automatically-change-resolution>true</automatically-change-resolution>
              </layer>
          </layers>
      </josm-session>
    """

    File.write!(@session_path, String.trim(xml))
  end
end
