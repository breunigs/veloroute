defmodule Util do
  @spec map_first(map()) :: {any(), any()} | nil
  def map_first(map) when is_map(map) do
    map |> Enum.find(& &1)
  end

  def banner(text) do
    IO.puts("")
    IO.puts("###########################################")
    IO.puts(text)
    IO.puts("###########################################")
    IO.puts("")
  end

  def user_id(), do: cmd(["id", "-u"]) |> String.trim()
  def group_id(), do: cmd(["id", "-g"]) |> String.trim()

  def cmd([cmd | args], opts \\ []) do
    System.cmd(cmd, args, opts)
    |> case do
      {out, 0} ->
        out

      {_, code} ->
        env =
          Keyword.get(opts, :env)
          |> List.wrap()
          |> Enum.map(fn {k, v} -> "export #{k}=\"#{v}\"" end)
          |> Enum.join("\n")

        args = args |> Enum.map(fn arg -> "\"#{arg}\"" end) |> Enum.join(" ")

        raise("FAILED (exit code #{code}):\n#{env}\n#{cmd} #{args}")
    end
  end

  @spec overlap?(Enumerable.t(), Enumerable.t()) :: bool()
  @doc """
  Returns true if enum1 and enum2 have at least one element in common
  """
  def overlap?(enum1, enum2) do
    Enum.any?(enum1, fn el1 ->
      Enum.member?(enum2, el1)
    end)
  end

  @spec compact(Enumerable.t()) :: Enumerable.t()
  def compact(list) do
    Enum.reject(list, &is_nil(&1))
  end

  @doc """
  Works like Enum.group_by, but keeps the group order the same as the elements come in. For this
  to work the elements need to already be sorted by the key being grouped by.

  ## Examples

      iex> Util.ordered_group_by([{1, "a"}, {1, "b"}, {2, "c"}], &elem(&1, 1))
      [{"a", [{1, "a"}]}, {"b", [{1, "b"}]}, {"c", [{2, "c"}]}]
  """
  @spec ordered_group_by(Enumerable.t(), (Enumerable.element() -> any())) :: [{any(), [any()]}]
  def ordered_group_by(enum, key_fun) do
    enum
    |> Enum.reverse()
    |> Enum.reduce([], fn
      art, [] ->
        [{key_fun.(art), [art]}]

      art, [{prev_key, prev_list} | rest] = all ->
        key = key_fun.(art)

        if prev_key == key,
          do: [{key, [art | prev_list]} | rest],
          else: [{key, [art]} | all]
    end)
  end
end
