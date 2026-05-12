defmodule Veloroute do
  @moduledoc """
  Veloroute keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  require Logger

  def health_ok() do
    Application.put_env(:veloroute, :health, "ok")
  end

  def health_shutdown() do
    Application.put_env(:veloroute, :health, "shutdown")
    shutdown_on_zero_connections()
    :ok
  end

  # 5 seconds
  @check_interval 5 * 1000
  # 10 minutes
  @max_wait 10 * 60 * 1000

  defp shutdown_on_zero_connections(remaining \\ @max_wait) do
    Process.sleep(@check_interval)

    count = VelorouteWeb.ConnectionTracker.count()
    remaining = remaining - @check_interval

    cond do
      count == 0 ->
        Logger.info("shutdown: all connections dropped, exiting")
        System.stop(0)

      remaining <= 0 ->
        Logger.info(
          "shutdown: timed out waiting for #{count} connections to drop, exiting anyway"
        )

        System.stop(0)

      true ->
        ips = VelorouteWeb.ConnectionTracker.list_ips() |> inspect()
        Logger.info("shutdown: waiting for #{count} connections to drop (IPs: #{ips})")
        shutdown_on_zero_connections(remaining)
    end
  end
end
