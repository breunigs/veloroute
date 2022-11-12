defmodule Push.Notification do
  import Guards

  @known_params [:title, :body, :url, :ttl_seconds, :extra]

  @enforce_keys @known_params -- [:extra]
  defstruct @known_params

  @type t :: %__MODULE__{
          title: binary(),
          body: binary(),
          url: binary(),
          ttl_seconds: pos_integer(),
          extra: %{atom() => any()} | nil
        }

  @spec encode(t()) :: binary()
  def encode(%__MODULE__{title: t, body: b, url: u, extra: e}) do
    Map.merge(e || %{}, %{title: t, body: b, url: u})
    |> Jason.encode!()
  end

  @article_notification_ttl_seconds 7 * 24 * 60 * 60
  @spec for_article(Article.t()) :: t()
  def for_article(art) when is_module(art) do
    %Push.Notification{
      title: art.title(),
      body: art.summary(),
      url: Article.Decorators.url(art),
      ttl_seconds: @article_notification_ttl_seconds
    }
  end
end
