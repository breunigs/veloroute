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
  @check_interval 5000

  defp shutdown_on_zero_connections() do
    Process.sleep(@check_interval)

    count = VelorouteWeb.ConnectionTracker.count()

    cond do
      count == 0 ->
        Logger.info("shutdown: all connections dropped, exiting")
        System.stop(0)

      true ->
        Logger.info("shutdown: waiting for #{count} connections to drop")
        shutdown_on_zero_connections()
    end
  end
end
