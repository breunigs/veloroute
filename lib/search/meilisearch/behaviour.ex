defmodule Search.Meilisearch.Behaviour do
  @callback id() :: atom()
  @callback documents() ::
              [%{atom => any}]
              | {content_type :: binary(), payload :: binary()}
              | {content_type :: binary(), content_encoding :: binary(), payload :: binary()}
  @callback params(binary(), float(), float()) :: %{atom => list(binary) | binary | integer}
  @callback format(%{binary => any}) :: Search.Result.t() | nil
  @callback config() :: %{atom => list(binary) | %{atom => list(binary)} | binary}
  @callback updated_at() :: DateTime.t()

  @callback maybe_merge([%{required(binary) => any()}]) :: [%{required(binary) => any()}]

  @optional_callbacks maybe_merge: 1
end
