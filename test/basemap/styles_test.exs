defmodule Basemap.StylesTest do
  use ExUnit.Case, async: true

  @validator "assets/map/validate_style.mjs"

  for path <- Path.wildcard("assets/map/styles/*.json") do
    name = Path.basename(path, ".json")

    test "#{name} style has valid MapLibre expressions" do
      {output, exit_code} =
        System.cmd("node", [@validator, unquote(path)], stderr_to_stdout: true)

      assert exit_code == 0, """
      MapLibre style expression errors in #{unquote(path)}:
      #{output}
      """
    end
  end
end
