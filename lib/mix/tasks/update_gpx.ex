defmodule Mix.Tasks.UpdateGpx do
  use Mix.Task

  alias Data.Map.Relation

  @tag "veloroute-geoconverter"
  @out File.cwd!() <> "/assets/static/geo/"
  # 120 seconds
  @convert_timeout 120_000

  @shortdoc "Update GPX/KML tracks from map data."
  def run(_) do
    {_, 0} =
      System.cmd(
        "docker",
        [
          "build",
          "-t",
          @tag,
          "-f",
          "tools/geoconverter.dockerfile",
          "tools/"
        ],
        into: IO.stream(:stdio, :line)
      )

    user = user()

    Data.MapCache.relations()
    |> Map.values()
    |> Enum.map(fn rel ->
      {Relation.gpx_name(rel), Relation.osm_relation_id(rel)}
    end)
    |> Enum.reject(fn {_, rel_id} -> is_nil(rel_id) end)
    |> Enum.uniq()
    |> Task.async_stream(
      fn {id, relation_id} ->
        convert(user, id, relation_id)
      end,
      timeout: @convert_timeout,
      ordered: false
    )
    |> Enum.to_list()
    |> Enum.all?(fn exit_code -> exit_code == 0 end)
  end

  defp convert(user, id, relation_id) do
    System.cmd(
      "docker",
      [
        "run",
        "-u",
        user,
        "--mount",
        "type=bind,source=#{@out},target=/out",
        @tag,
        to_string(relation_id),
        to_string(id)
      ],
      into: IO.stream(:stdio, :line)
    )
    |> elem(1)
  end

  defp user() do
    name = System.get_env("USER", "root")

    {user, 0} = System.cmd("id", ["-u", name])
    {group, 0} = System.cmd("id", ["-g", name])

    "#{String.trim(user)}:#{String.trim(group)}"
  end
end
