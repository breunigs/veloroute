defmodule Push.Sendout do
  require Logger

  @spec send_all([Article.t()], dry_run :: boolean()) :: :ok | {:error, [binary()]}
  def send_all(articles, dry_run) do
    {okays, fails, errors} =
      Enum.reduce(Push.Subscription.list(), {0, 0, []}, fn sub, {okays, fails, errors} ->
        case send_single(sub, articles, dry_run) do
          :ok -> {okays + 1, fails, errors}
          {:error, msg} -> {okays, fails + 1, [msg | errors]}
        end
      end)

    Logger.info("Finished sendout. #{okays} subscriptions were fine, #{fails} had issues")
    if fails == 0, do: :ok, else: {:error, errors}
  end

  @spec send_single(Push.Subscription.t(), [Article.t()], dry_run :: boolean()) ::
          :ok | {:error, binary}
  def send_single(subscription, articles, dry_run) do
    notifications =
      subscription
      |> relevant_articles(articles)
      |> Enum.map(&Push.Notification.for_article/1)

    errors =
      Enum.reduce(notifications, [], fn art, errors ->
        Push.Subscription.send(subscription, art, dry_run)
        |> case do
          {:ok, _any} -> errors
          {:error, reason} -> [reason | errors]
        end
      end)

    case errors do
      [] ->
        :ok

      errors ->
        msg = """
        failed to send #{length(errors)} out of #{length(notifications)} notifications"
          ident: #{Push.Subscription.ident(subscription)}
          errors: #{inspect(errors)}
        """

        Logger.error(msg)
        {:error, msg}
    end
  end

  # keep all articles whose date is the same day (or newer) than we last
  # updated the subscription. This means that articles with updated_at=X
  # before the sendout on day X, will be sent again on the day X+1. We'd need
  # to store already sent articles to combat this, or increase the timestamp
  # resolution of articles. Currently this is unhandled and relies on the
  # timing of article creation and cronjob sendout to not overlap.
  defp relevant_articles(subscription, articles) do
    {:ok, last_update_day} = DateTime.from_unix(subscription.last_sent_timestamp, :second)

    Enum.reject(articles, fn art ->
      Date.compare(art.updated_at(), last_update_day) == :lt
    end)
  end
end
