defmodule Assets.CssTest do
  use ExUnit.Case, async: true

  # Compiles the stylesheet and runs assets/css_check.mjs over the result. The
  # checks need compiled CSS because Sass variables and interpolation hide both
  # the values and the final selectors.

  @scss "assets/css/app.scss"
  @checker "assets/css_check.mjs"
  @inventory "test/fixtures/css_stacking_contexts.txt"

  setup_all do
    %{report: report()}
  end

  test "every declaration matches the CSS spec grammar", %{report: report} do
    assert report["invalid"] == [], """
    The stylesheet has declarations that browsers drop entirely, because they
    do not match the property's grammar:

    #{Enum.map_join(report["invalid"], "\n", &"  app.css:#{&1["line"]}  #{&1["declaration"]}\n    #{&1["error"]}")}
    """
  end

  test "stacking contexts match the recorded inventory", %{report: report} do
    found = report["stackingContexts"]

    if System.get_env("RECORD") do
      File.write!(@inventory, Enum.map_join(found, &(&1 <> "\n")))
    end

    recorded = @inventory |> File.read!() |> String.split("\n", trim: true)

    added = found -- recorded
    removed = recorded -- found

    assert {added, removed} == {[], []}, """
    The set of declarations that make their element a stacking context changed.

    Gaining or losing a stacking context silently reorders painting: a stacking
    context is painted as a unit, so a static box that gains one moves from the
    in-flow paint step to the positioned one and can start covering absolutely
    positioned siblings and pseudo elements that precede it in tree order.

    Check that nothing is now hidden behind the changed elements, then re-record
    the inventory with:

        RECORD=1 mix test #{__ENV__.file |> Path.relative_to_cwd()}
    #{section("newly creating a stacking context:", added, "+")}#{section("no longer creating a stacking context:", removed, "-")}\
    """
  end

  defp section(_title, [], _sign), do: ""

  defp section(title, lines, sign) do
    "\n" <> title <> "\n" <> Enum.map_join(lines, "\n", &"  #{sign} #{&1}") <> "\n"
  end

  defp report do
    css = Path.join(System.tmp_dir!(), "css_check_#{System.unique_integer([:positive])}.css")

    try do
      compile_sass!(css)
      css |> run_checker!() |> JSON.decode!()
    after
      File.rm(css)
    end
  end

  defp compile_sass!(out) do
    [dart | snapshot] = paths = DartSass.bin_paths()

    if not Enum.all?(paths, &File.exists?/1) do
      raise "Sass is not installed, run `mix sass.install`"
    end

    args = snapshot ++ ["--no-source-map", @scss, out]

    case System.cmd(dart, args, stderr_to_stdout: true) do
      {_, 0} -> :ok
      {output, status} -> raise "#{@scss} failed to compile (#{status}):\n#{output}"
    end
  end

  defp run_checker!(css) do
    case System.cmd("node", [@checker, css], stderr_to_stdout: true) do
      {json, 0} ->
        json

      {output, status} ->
        raise "#{@checker} failed (#{status}), did `npm ci` run in assets/?\n#{output}"
    end
  end
end
