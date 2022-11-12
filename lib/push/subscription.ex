defmodule Push.Subscription do
  @known_params [:browser, :last_sent_timestamp, :error_count]
  @enforce_keys @known_params
  @derive Jason.Encoder
  defstruct @known_params
  require Logger

  @suffix ".sub.json.gz.enc"

  @type ident :: binary()
  @type write_error :: {:error, File.posix() | Jason.EncodeError.t() | Exception.t()}
  @type browser :: %{binary() => binary() | %{binary() => binary()}}

  @type t :: %__MODULE__{
          browser: browser(),
          last_sent_timestamp: pos_integer(),
          error_count: non_neg_integer()
        }

  @spec new(browser() | nil) :: t() | nil
  def new(browser)
  def new(nil), do: nil

  def new(browser) when is_map(browser) do
    %__MODULE__{browser: browser, last_sent_timestamp: now(), error_count: 0}
  end

  @spec list() :: [t()]
  def list() do
    Path.join(storage_dir(), "*" <> @suffix)
    |> Path.wildcard()
    |> Parallel.map(4, &read/1)
    |> Enum.filter(fn {status, _res} -> status == :ok end)
    |> Enum.map(&elem(&1, 1))
  end

  @spec ident(t()) :: ident()
  def ident(%__MODULE__{browser: browser}) do
    endpoint = Map.fetch!(browser, "endpoint")
    :crypto.hash(:sha256, endpoint) |> Base.encode16() |> String.downcase()
  end

  @doc """
  Ensure will verify the subscription is on the disk, or write it if necessary.
  The last sent timestamp is not touched.
  """
  @spec ensure(t()) :: :ok | write_error()
  def ensure(%__MODULE__{browser: current} = subscription) do
    with {:ok, %{browser: disk}} <- read(path(subscription)),
         true <- disk == current do
      :ok
    else
      _ -> write(subscription, false)
    end
  end

  @spec ensure_or_nil(t() | nil) :: t() | nil
  def ensure_or_nil(nil), do: nil

  def ensure_or_nil(%__MODULE__{} = subscription) do
    case ensure(subscription) do
      :ok ->
        subscription

      {:error, _reason} ->
        nil
    end
  end

  @spec write(t(), dry_run :: boolean()) :: :ok | write_error()
  def write(%__MODULE__{} = subscription, dry_run) do
    ident = ident(subscription)

    with {:ok, encoded} <- Jason.encode(subscription),
         compressed <- :zlib.gzip(encoded),
         encrypted <- encrypt(compressed, ident),
         path <- path(subscription),
         :ok <- write_to_disk(path, encrypted, dry_run) do
      :ok
    else
      {:error, reason} ->
        Logger.error("failed write subscription=#{ident} to disk: #{inspect(reason)}")
        {:error, reason}
    end
  end

  defp write_to_disk(path, content, dry_run)
  defp write_to_disk(_path, _content, true), do: :ok
  defp write_to_disk(path, content, false), do: File.write(path, content)

  @spec delete(t() | nil) :: :ok | {:error, File.posix()}
  def delete(nil), do: :ok

  def delete(%__MODULE__{} = subscription) do
    case File.rm(path(subscription)) do
      :ok ->
        :ok

      {:error, reason} ->
        msg = "failed delete subscription=#{ident(subscription)} from disk: #{inspect(reason)}"
        Logger.error(msg)
        {:error, reason}
    end
  end

  @spec read(Path.t()) :: {:ok, t()} | {:error, Jason.DecodeError.t() | File.posix() | binary()}
  def read(path) do
    with {:ok, raw} <- File.read(path),
         {:ok, decrypted} <- decrypt(raw, ident_from_path(path)),
         {:ok, decompressed} <- safe_gunzip(decrypted),
         {:ok, plain} <- Jason.decode(decompressed) do
      # only convert top-level keys into atoms, as we treat "browser" more or less opaque
      plain = Enum.into(plain, %{}, fn {k, v} -> {String.to_existing_atom(k), v} end)
      {:ok, struct(__MODULE__, plain)}
    else
      {:error, reason} ->
        msg = "failed to read subscription from #{path}: #{inspect(reason)}"
        Logger.error(msg)
        {:error, inspect(msg)}
    end
  end

  defp safe_gunzip(input) do
    try do
      {:ok, :zlib.gunzip(input)}
    rescue
      e ->
        {:error, "#{inspect(e)}"}
    end
  end

  @doc """
  Touch updates the last_sent_timestamp on disk.
  """
  @spec touch(t(), dry_run :: boolean()) :: :ok | write_error()
  def touch(%__MODULE__{} = subscription, dry_run) do
    %{subscription | last_sent_timestamp: now()}
    |> write(dry_run)
  end

  @spec to_atom_map(t()) :: %{atom() => binary() | %{atom() => binary()}}
  defp to_atom_map(%__MODULE__{browser: browser}) do
    %{
      endpoint: browser["endpoint"],
      keys: %{
        auth: get_in(browser, ["keys", "auth"]),
        p256dh: get_in(browser, ["keys", "p256dh"])
      }
    }
  end

  @doc """
  Sends the given notification to the subscription, updating the last sent
  timestamp on success
  """
  @spec send(t(), Push.Notification.t(), dry_run :: boolean()) ::
          {:ok, any()} | {:error, atom()} | write_error()
  def send(%__MODULE__{} = subscription, %Push.Notification{ttl_seconds: ttl} = noti, dry_run) do
    noti
    |> Push.Notification.encode()
    |> send_web_push(subscription, ttl, dry_run)
    |> case do
      {:error, reason} ->
        msg = "failed pushing subscription=#{ident(subscription)} to server: #{inspect(reason)}"
        Logger.error(msg)
        {:error, reason}

      {:ok, any} ->
        with :ok <- touch(subscription, dry_run) do
          {:ok, any}
        end
    end
  end

  defp send_web_push(message, subscription, ttl, dry_run)

  defp send_web_push(message, subscription, ttl, false),
    do: WebPushEncryption.send_web_push(message, to_atom_map(subscription), nil, ttl)

  defp send_web_push(message, subscription, _ttl, true) do
    msg = "subscription=#{ident(subscription)}: sending #{message}"
    Logger.debug(msg)
    {:ok, msg}
  end

  defp path(subscription) do
    Path.join(storage_dir(), ident(subscription) <> @suffix)
  end

  defp now(), do: :os.system_time(:seconds)

  @credentials Application.compile_env!(:web_push_encryption, :vapid_details)
  @public_key Keyword.fetch!(@credentials, :public_key)
  @private_key Keyword.fetch!(@credentials, :private_key)
  @spec public_key :: binary()
  def public_key, do: @public_key
  @spec private_key :: binary()
  def private_key, do: @private_key

  defp encrypt(data, ident) do
    Plug.Crypto.encrypt(private_key(), ident, data)
  end

  defp decrypt(data, ident) do
    Plug.Crypto.decrypt(private_key(), ident, data, max_age: 365 * 24 * 60 * 60)
  end

  defp ident_from_path(path) do
    path |> Path.basename() |> String.split(".", parts: 2) |> hd()
  end

  defp storage_dir do
    Path.join(File.cwd!(), "data/user/push/")
  end
end
