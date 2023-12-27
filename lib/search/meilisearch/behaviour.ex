defmodule Search.Meilisearch.Behaviour do
  @callback id() :: atom()
  @callback documents() :: [%{atom => any}] | {binary(), binary()}
  @callback params(binary(), float(), float()) :: %{atom => list(binary) | binary | integer}
  @callback format(%{binary => any}) :: Search.Result.t() | nil
  @callback config() :: %{atom => list(binary) | %{atom => list(binary)}}

  @callback maybe_merge([%{required(binary) => any()}]) :: [%{required(binary) => any()}]

  @optional_callbacks maybe_merge: 1
end
