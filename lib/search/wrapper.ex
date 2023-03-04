defmodule Search.Wrapper do
  @typep generic_bbox :: nil | maybe_improper_list | Geo.BoundingBox.like()

  @spec query(module() | [module()], binary | nil, generic_bbox) :: [Search.Result.t()]
  def query(searchers, query, bounds)
  def query(_searcher, nil, _), do: []
  def query(_searchers, "", _), do: []
  def query(searchers, query, nil), do: query(searchers, query, Settings.initial())

  def query(searchers, query, bbox) do
    query = String.trim(query)
    bbox = Geo.BoundingBox.parse(bbox)

    searchers
    |> List.wrap()
    |> Task.async_stream(& &1.query(query, bbox),
      ordered: false,
      timeout: 1_000,
      on_timeout: :kill_task
    )
    |> Stream.flat_map(fn
      {:ok, list} -> list
      {:exit, :timeout} -> []
    end)
    |> Stream.reject(&is_nil/1)
    |> Search.Result.sort()
  end
end
