defmodule Article do
  @type t() :: module()
  @type color_hex() :: <<_::56>> | nil
  @type article_type() ::
          :construction
          | :planned
          | :finished
          | :outdated
          | :intent
          | :changed_routing
          | :issue
          | :ampel
          | :event
          | nil
  @type language() :: <<_::16>>

  @type assigns() :: %{optional(atom) => any}
  @type link() ::
          {binary(), binary()}
          | {binary(), binary() | Data.RoughDate.t(), binary()}
          | Phoenix.LiveView.Rendered.t()

  @callback id() :: binary() | nil
  @callback display_id() :: binary() | nil
  @callback route_group() :: Layer.route_group() | nil
  @callback color() :: color_hex()
  @callback color_faded() :: color_hex()
  @callback name() :: binary()
  @callback icon() :: :nocargo | :stau | article_type()

  @callback created_at() :: Date.t() | nil
  @callback updated_at() :: Date.t() | nil

  @callback type() :: article_type()

  @callback start() :: Data.RoughDate.t()
  @callback stop() :: Data.RoughDate.t()
  @callback construction_site_id_hh() :: [integer()]

  @callback title() :: binary()
  @callback summary() :: binary()
  @callback summary(language()) :: binary()
  @callback tags() :: [binary()]

  @callback tracks() :: [Video.Track.t()]
  @callback point_of_interest() :: %{lat: float(), lon: float(), zoom: non_neg_integer()} | nil

  @callback text(assigns()) :: Phoenix.LiveView.Rendered.t()
  @callback links(assigns()) :: [link()]

  @callback map_image() :: nil | Data.MapImage.t() | [Data.MapImage.t()]

  @callback languages() :: [language()]

  @module_prefix "Elixir.Data.Article."
  @known_categories ~w/Blog Static/
  @known_prefixes Enum.map(@known_categories, &(@module_prefix <> &1 <> "."))
  def module_name, do: @module_prefix
  def known_categories, do: @known_categories

  @doc """
  Articles are considered released, when their creation date is not in the
  future. Static articles are always considered released. The intended use is to
  hide unfinished articles in production without having to comment them out.
  """
  @spec released?(t()) :: boolean()
  def released?(art) do
    art.created_at() == nil ||
      Date.compare(art.created_at(), Date.utc_today()) != :gt
  end

  def has_category?(art, type) when type in @known_categories do
    art |> Atom.to_string() |> String.starts_with?(Article.module_name() <> type)
  end

  @doc """
  Tries to find the module for the name of the article. It doesn't actually look
  up the matching article, but guesses from the name to the module. It therefore
  might return nil if an article's name doesn't use the auto-generated style.
  """
  @spec module_from_name(binary()) :: nil | t()
  def module_from_name(name) do
    abbrev = String.replace(name, ~r/\brsw\b/, &String.upcase/1)
    camel_case = String.replace(abbrev, ~r/^\w|-\w/, &String.upcase(String.last(&1)))
    no_date = String.slice(camel_case, 8..-1//1)
    candidates = for prefix <- @known_prefixes, mod <- [camel_case, no_date], do: prefix <> mod

    Enum.find_value(candidates, fn str ->
      try do
        mod = String.to_existing_atom(str)
        if mod.name() == name, do: mod
      rescue
        _ -> nil
      end
    end)
  end

  def auto_generate_name(mod) do
    pascalized = module_name_pascalized(mod)
    with_date = has_category?(mod, "Blog")

    if with_date do
      quote location: :keep do
        "#{unquote(mod).created_at()}-#{unquote(pascalized)}"
      end
    else
      pascalized
    end
  end

  def auto_generate_created_at(path) do
    filename = Path.basename(path)

    with [_, y, m, d] <- Regex.run(~r/^(\d{4})-(\d{2})-(\d{2})-/, filename) do
      y = String.to_integer(y)
      m = String.to_integer(m)
      d = String.to_integer(d)
      Date.new!(y, m, d)
    else
      _ -> nil
    end
  end

  defp module_name_pascalized(mod) when is_atom(mod) and not is_nil(mod) do
    mod
    |> Module.split()
    |> List.last()
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1-\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1-\\2")
    |> String.replace(~r/([a-z])(\d)/, "\\1-\\2")
    |> String.downcase()
  end
end
