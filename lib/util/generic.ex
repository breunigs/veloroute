defmodule Util do
  @doc """
  Given a module, it returns the path where the module is defined

      iex> Util.module_source_path(Util)
      File.cwd!() <> "/lib/util/generic.ex"
  """
  @spec module_source_path(module()) :: binary()
  def module_source_path(module) when is_atom(module) and not is_nil(module) do
    module.__info__(:compile) |> Keyword.get(:source) |> to_string()
  end

  @doc """
  Returns a list of shell commands to make the run command lowest prio
  """
  @spec low_priority_cmd_prefix(non_neg_integer()) :: [binary()]
  def low_priority_cmd_prefix(niceness \\ 19) when niceness >= 1 and niceness <= 19,
    do: [
      "/usr/bin/nice",
      "-n#{niceness}",
      "/usr/bin/chrt",
      "--idle",
      "0",
      "/usr/bin/ionice",
      "--class",
      "idle"
    ]

  @doc """
  Shortens path to the given length, trying to smartly abbreviate directories or
  drop them to fit the constraint.

  ## Examples

      iex> Util.shorten_path("lib/mix/tasks/velo.gpx.generate.ex")
      "l/m/tasks/velo.gpx.generate.ex"

      iex> Util.shorten_path("lib/mix/tasks/velo.map.static_renderer.ex")
      "ta/velo.map.static_renderer.ex"

      iex> Util.shorten_path("lib/veloroute_web/live/video_state.ex")
      "l/velorout/live/video_state.ex"

      iex> Util.shorten_path("short.ex")
      "short.ex"

      iex> Util.shorten_path(nil)
      ""
  """
  @spec shorten_path(binary() | nil, pos_integer()) :: binary()
  def shorten_path(path, path_length \\ 30) do
    path = to_string(path)
    segments = Path.split(path)
    {base, dirs} = List.pop_at(segments, -1)
    base = base || ""

    base_len = String.length(base)

    if base_len >= path_length - 1 || dirs == [] do
      String.slice(base, -path_length..-1)
    else
      max_dirs_len = path_length - base_len
      # guaranteed to be larger than 0, since the if condition checks that we
      # have at least two characters available
      max_dirs_count = floor(max_dirs_len / 2)
      dirs = Enum.slice(dirs, -max_dirs_count..-1)
      cur_dirs_len = String.length(Path.join(dirs)) + 1

      {dirs, _cur_dirs_len} =
        Enum.reduce(dirs, {[], cur_dirs_len}, fn
          dir, {shortened, cur_dirs_len} ->
            old_len = String.length(dir)
            new_len = max(0, max_dirs_len - cur_dirs_len + old_len - 1)
            dir = String.slice(dir, 0..new_len)
            {[dir | shortened], cur_dirs_len - old_len + new_len + 1}
        end)

      dirs = Enum.reverse(dirs)
      Path.join(dirs) |> Path.join(base)
    end
  end

  def present?(nil), do: false
  def present?(""), do: false
  def present?(_o), do: true

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

  def user_id() do
    {out, 0} = System.cmd("id", ["-u"])
    String.trim(out)
  end

  def group_id() do
    {out, 0} = System.cmd("id", ["-g"])
    String.trim(out)
  end

  def group_id(group_name) when is_binary(group_name) do
    {out, 0} = System.cmd("getent", ["group", group_name])
    out |> String.split(":") |> Enum.at(2)
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

  @spec compact(Enumerable.t() | map()) :: Enumerable.t()
  def compact(%{} = map) do
    Enum.reject(map, fn {_k, v} -> is_nil(v) end)
    |> Enum.into(%{})
  end

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
  @spec ordered_group_by(Enumerable.t(), (Enum.element() -> any())) :: [{any(), [any()]}]
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

  @spec modules_with_prefix(binary()) :: [module()]
  use Memoize

  defmemo modules_with_prefix("Elixir." <> _rest = namespace) do
    {:ok, list} = :application.get_key(:veloroute, :modules)
    Enum.filter(list, &(&1 |> Atom.to_string() |> String.starts_with?(namespace)))
  end

  def md5(input) do
    :crypto.hash(:md5, input) |> Base.encode16(case: :lower)
  end

  def md5_file(path) do
    path |> File.read!() |> md5()
  end

  @doc """
  Returns true if the module implements the behaviour.
  """
  @spec has_behaviour?(nil | module(), module()) :: boolean()
  def has_behaviour?(nil, _behaviour), do: false

  def has_behaviour?(module, behaviour) when is_atom(module) do
    function_exported?(module, :__info__, 1) &&
      module.__info__(:attributes) |> Keyword.get(:behaviour, []) |> Enum.member?(behaviour)
  end

  @doc """
  Given a HEEX string, will extract all HTML links from it.
  """
  @spec extract_links_from_heex(Phoenix.LiveView.Rendered.t()) :: [binary()]
  def extract_links_from_heex(%Phoenix.LiveView.Rendered{} = heex) do
    heex
    |> Util.render_heex()
    |> Util.extract_href_from_html()
  end

  @doc """
  Finds <a href="x"> in an HTML document. It ignores base tags even if present.

  ## Examples

      iex> Util.extract_href_from_html(~s|<a href="hi">I'm a link</a>|)
      ["hi"]
  """
  @spec extract_href_from_html(binary()) :: [binary()]
  def extract_href_from_html(html) when is_binary(html) do
    {:ok, document} = Floki.parse_document(html)

    Floki.find(document, "a")
    |> Enum.map(fn {_tag, attrs, _body} ->
      Enum.find_value(attrs, fn
        {"href", val} -> val
        _other -> nil
      end)
    end)
    |> compact()
    |> Enum.uniq()
  end

  @spec render_heex(Phoenix.LiveView.Rendered.t()) :: binary()
  def render_heex(heex) do
    heex
    |> Phoenix.HTML.html_escape()
    |> Phoenix.HTML.safe_to_string()
  end

  @doc """
  Writes auto generated source code to disk and ensures it can be compiled. It
  silences the warning about redefining the module while doing so.
  """
  @spec write_autogenerated_file(binary, iodata) :: :ok | {:error, any} | {:error, any, any}
  def write_autogenerated_file(path, content) do
    try do
      with :ok <- File.write(path, content),
           Code.compiler_options(ignore_module_conflict: true),
           {:ok, _modules, _warnings} <- Kernel.ParallelCompiler.compile([path], []) do
        :ok
      end
    after
      # re-enabling this causes warning still to be shown :(
      # Code.compiler_options(ignore_module_conflict: false)
    end
  end

  @doc """
  Takes a command as a list and applies some heuristics for shell copy&paste

  ## Examples

      iex> Util.cli_printer(["some", ~s|funny "arg's"|])
      ~s|some 'funny "arg'"'"'s"'|
  """
  @spec cli_printer(Enum.t()) :: binary
  def cli_printer(cmd) do
    Enum.map_join(cmd, " ", fn arg ->
      arg = to_string(arg)

      if String.match?(arg, ~r/^[a-zA-Z0-9_=.-]+$/) || arg == "|",
        do: arg,
        else: "'#{String.replace(arg, ~s|'|, ~s|'"'"'|)}'"
    end)
  end

  @doc """
  Converts a string in the form of "1/2" or "0.5" to a proper float. Meant to
  parse metadata output from ffprobe and the like.
  """
  @spec fraction_to_float(binary()) :: float()
  def fraction_to_float(str) do
    str
    |> String.split("/", parts: 2)
    |> case do
      [num, denom] -> String.to_integer(num) / String.to_integer(denom)
      [decimal] -> String.to_float(decimal)
    end
  end
end
