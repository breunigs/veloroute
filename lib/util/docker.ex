defmodule Util.Docker do
  use Memoize
  require Logger

  @type image_from_git :: {:git, source :: binary(), ref :: binary()}
  @type image_from_remote :: {:remote, docker_img :: binary(), image_tag :: binary()}
  @type image_from_dockerfile :: {:dockerfile, path :: binary()}
  @type image_ref :: image_from_git | image_from_remote | image_from_dockerfile

  @type container_desc :: binary()

  @type full_ref :: {container_desc(), image_ref()}

  defguardp exists(str) when is_binary(str) and str != ""
  defguardp exists(ref, idx) when exists(elem(ref, idx))

  @doc """
  Asserts that the given docker image reference is understood.

  ## Examples

      iex> Util.Docker.is_image_ref({:git, "https://example.com/repo.git", "some-sha"})
      true

      iex> Util.Docker.is_image_ref({:remote, "example.com/repo/some-img", "latest"})
      true

      iex> Util.Docker.is_image_ref({:dockerfile, "some/Dockerfile.foobar"})
      true

      iex> Util.Docker.is_image_ref({:unknown, "hacks!"})
      false
  """
  @doc guard: true
  defguard is_image_ref(ref)
           when (tuple_size(ref) == 3 and elem(ref, 0) in [:remote, :git] and exists(ref, 1) and
                   exists(ref, 2)) or
                  (tuple_size(ref) == 2 and elem(ref, 0) == :dockerfile and
                     exists(ref, 1))

  @doc """
  Asserts that the given term is a valid container description

  ## Examples

      iex> Util.Docker.is_container_desc("some text")
      true

      iex> Util.Docker.is_container_desc(:some_atom)
      false
  """
  @doc guard: true
  defguard is_container_desc(desc) when is_binary(desc) and desc != ""

  @doc """
  Asserts that the given term fully describes a buildable/runnable container

  ## Examples

      iex> Util.Docker.is_full_ref({"some text", {:dockerfile, "some/Dockerfile.foobar"}})
      true
  """
  @doc guard: true
  defguard is_full_ref(ref) when exists(ref, 0) and is_image_ref(elem(ref, 1))

  @type docker_mounts :: %{binary() => binary()}
  @type docker_environment :: %{binary() => binary()}
  @type docker_opts :: %{
          optional(:run_as_local_user) => boolean(),
          optional(:mount_videos_in_dir) => binary(),
          optional(:mounts) => docker_mounts(),
          optional(:environment) => docker_environment(),
          optional(:docker_args) => [binary() | integer()],
          optional(:command_args) => [binary()]
        }
  @known_docker_opts_keys [
    :run_as_local_user,
    :mount_videos_in_dir,
    :mounts,
    :environment,
    :docker_args,
    :command_args
  ]
  defp valid_docker_opts!(opts) when not is_map(opts), do: raise("docker_opts must be a map")

  defp valid_docker_opts!(opts) do
    unknown = Map.keys(opts) -- @known_docker_opts_keys
    if unknown != [], do: raise("unknown docker_opts #{inspect(unknown)}")
  end

  @doc """
  Returns standardized container and image names

    ## Examples

      iex> Util.Docker.names({"desc", {:dockerfile, "some/Dockerfile.foobar"}})
      %{container: "veloroute2-foobar-desc", image: "veloroute.hamburg/docker:foobar"}

      iex> Util.Docker.names({"desc", {:git, "https://example.com/foo/bar.git", "sha"}})
      %{container: "veloroute2-bar-sha-desc", image: "veloroute.hamburg/docker:bar-sha"}

      iex> Util.Docker.names({"desc", {:remote, "example.com/foo/bar", "tag"}})
      %{container: "veloroute2-bar-desc", image: "example.com/foo/bar:tag"}

      iex> Util.Docker.names({:remote, "example.com/foo/bar", "tag"})
      %{image: "example.com/foo/bar:tag"}
  """
  @spec names(container_desc(), image_ref()) :: %{image: binary(), container: binary()}
  def names(container_desc, image_ref), do: names({container_desc, image_ref})

  @spec names(full_ref()) :: %{image: binary(), container: binary()}
  def names({container_desc, image_ref} = ref) when is_full_ref(ref) do
    res =
      case image_ref do
        {:remote, img_name, tag} ->
          %{image: "#{img_name}:#{tag}", container: img_name |> String.split("/") |> List.last()}

        {:git, source, sha} ->
          name = Path.basename(source, ".git") |> String.downcase()
          name = "#{name}-#{sha}"
          img_name = image_name(name)
          %{image: img_name, container: name}

        {:dockerfile, dockerfile} ->
          "." <> name = Path.extname(dockerfile)
          %{image: image_name(name), container: name}
      end

    %{res | container: clean_name(res.container, container_desc)}
  end

  @spec names(image_ref()) :: %{image: binary()}
  def names(image_ref) when is_image_ref(image_ref) do
    %{image: names({"FAKE FAKE FAKE", image_ref}).image}
  end

  defp clean_name(image, description) do
    "veloroute2 #{image} #{description}"
    |> String.trim()
    |> String.replace(~r/[^a-zA-Z0-9]+/, "-")
  end

  @devel_image {:dockerfile, "Dockerfile.devel"}
  def build_devel_image(), do: build(@devel_image)

  def mix(args, mix_env \\ "test")
  def mix(args, mix_env) when is_binary(args), do: args |> String.split() |> mix(mix_env)

  def mix(args, mix_env) when is_list(args) do
    {Enum.join(args, " "), @devel_image}
    |> build_and_run(
      %{
        environment: %{
          "MIX_ENV" => mix_env,
          # erlexec needs a shell to be set, even though it's not used
          "SHELL" => "/bin/sh"
          # debug rebar3 crashes
          # "DIAGNOSTIC" => "1"
        },
        mounts: %{File.cwd!() => "/build"},
        mount_videos_in_dir: "/build",
        command_args: args
      },
      stdout: IO.stream(:stdio, :line),
      slow_warn_message: false
    )
  end

  @spec build_and_run(container_desc(), image_ref(), docker_opts(), Util.Cmd2.exec_opts()) ::
          :ok | {:error, binary()}
  def build_and_run(container_desc, image_ref, docker_opts, exec_opts)
      when is_container_desc(container_desc) and is_image_ref(image_ref),
      do: build_and_run({container_desc, image_ref}, docker_opts, exec_opts)

  @spec build_and_run(full_ref(), docker_opts(), Util.Cmd2.exec_opts()) ::
          :ok | {:error, binary()}
  def build_and_run(full_ref, docker_opts, exec_opts) when is_full_ref(full_ref) do
    with :ok <- build(full_ref),
         :ok <- run(full_ref, docker_opts, exec_opts) do
      :ok
    end
  end

  @doc """
  Builds a docker image from the given reference.

  For images built from git, it checks if the resulting image tag already exists
  locally and avoids building the image if so. Otherwise Docker would always do
  a git clone. As such, callers specifying a branch name instead of a git sha
  might get outdated images.
  """
  @spec build(image_ref() | full_ref()) :: :ok | {:error, reason :: binary()}
  def build(ref)
  def build({_container_desc, image_ref} = ref) when is_full_ref(ref), do: build(image_ref)

  def build({:remote, image}),
    do: {:error, "cannot build remote image #{image}, it will be automatically downloaded on use"}

  defmemo build({:git, source, ref} = image_ref) do
    img_name = names(image_ref).image
    remote_url = "#{source}##{ref}"

    if image_exists?(img_name) do
      :ok
    else
      Util.Cmd2.exec(
        ["docker", "build", remote_url, "-t", img_name],
        env: [{"DOCKER_BUILDKIT", "1"}],
        raise: true,
        stdout: "",
        stderr: "",
        name: "Building \"#{remote_url}\""
      )
      |> Util.Cmd2.result_to_error()
    end
  end

  defmemo build({:dockerfile, dockerfile} = image_ref) do
    img_name = names(image_ref).image
    work_dir = Path.dirname(dockerfile)

    Util.Cmd2.exec(
      [
        "docker",
        "build",
        "-f",
        dockerfile,
        work_dir,
        "--network",
        "host",
        "--build-arg",
        "UID=#{Util.user_id()}",
        "--build-arg",
        "GID=#{Util.group_id()}",
        "--build-arg",
        "RENDER_GID=#{Util.group_id("render")}",
        "--build-arg",
        "ELIXIR_VERSION=#{ToolVersions.get(:elixir)}",
        "--build-arg",
        "ERLANG_VERSION=#{ToolVersions.get(:erlang)}",
        "--build-arg",
        "DEBIAN_VERSION=#{ToolVersions.get(:debian)}",
        "--build-arg",
        "GIT_COMMIT=#{Git.revision()}",
        "-t",
        img_name
      ],
      env: [{"DOCKER_BUILDKIT", "1"}],
      stdout: "",
      stderr: "",
      name: "Building \"#{img_name}\""
    )
    |> Util.Cmd2.result_to_error()
  end

  @spec run(container_desc(), image_ref(), docker_opts(), Util.Cmd2.exec_opts()) ::
          :ok | {:error, binary()}
  def run(_container_desc, image_ref, _docker_opts, _exec_opts) when not is_image_ref(image_ref),
    do: raise("image ref was not understood: #{inspect(image_ref)}")

  def run(container_desc, image_ref, docker_opts, exec_opts),
    do: run({container_desc, image_ref}, docker_opts, exec_opts)

  @spec run(full_ref(), docker_opts(), Util.Cmd2.exec_opts()) :: :ok | {:error, binary()}
  def run(full_ref, docker_opts, exec_opts) when is_full_ref(full_ref) do
    exec_opts = default_exec_opts(full_ref, exec_opts)
    cli = run_docker_cli(full_ref, docker_opts)

    try do
      Util.Cmd2.exec(cli, exec_opts)
    after
      # Docker creates an empty dir when mounting the `mount_videos_in_dir`.
      # Since the outer folder is also mounted, the empty folder shows up on the
      # host. If it's deleted on the host, it disappears from the container as
      # well, breaking the container. Hence we can only delete this folder
      # safely if there are no other containers running that use it. This would
      # need a `flock` mechanism or similar, which is effort, so we just ignore
      # this. File.rmdir(Path.join(cache_dir, "videos"))
    end
    |> Util.Cmd2.result_to_error()
  end

  @doc """
  Converts the arguments into a flat list of arguments suitable to run docker
  """
  @spec run_docker_cli(full_ref(), docker_opts()) :: [binary()]
  def run_docker_cli(full_ref, opts) when is_full_ref(full_ref) do
    valid_docker_opts!(opts)

    %{image: img_name, container: container_name} = names(full_ref)
    opts = opts |> maybe_add_default_mounts() |> maybe_mount_videos()

    [
      "docker",
      "run",
      "--rm",
      "--name",
      container_name,
      run_mounts_to_args(opts[:mounts] || %{}),
      if(File.exists?("/dev/dri"), do: ["--device", "/dev/dri:/dev/dri"]),
      if(supports_gpu(), do: ["--gpus", "all"]),
      run_environment_to_args(opts[:environment]),
      if(opts[:run_as_local_user] != false, do: ["--user", "#{Util.user_id()}"]),
      opts[:docker_args],
      img_name,
      opts[:command_args]
    ]
    |> List.flatten()
    |> Util.compact()
    |> Enum.map(&to_string/1)
  end

  @spec run_mounts_to_args(docker_mounts()) :: [binary()]
  defp run_mounts_to_args(mounts) when is_map(mounts) do
    Enum.flat_map(mounts, fn {from, to} ->
      from = Path.expand(from) |> String.replace(~s|"|, ~s|\\"|)
      to = Path.expand(to) |> String.replace(~s|"|, ~s|\\"|)
      ["--mount", "type=bind,\"source=#{from}\",\"target=#{to}\""]
    end)
  end

  @spec run_environment_to_args(docker_environment()) :: [binary()]
  def run_environment_to_args(nil), do: []

  def run_environment_to_args(map) when is_map(map) do
    Enum.flat_map(map, &["-e", "#{elem(&1, 0)}=#{elem(&1, 1)}"])
  end

  @spec maybe_add_default_mounts(docker_opts()) :: docker_opts()
  defp maybe_add_default_mounts(docker_opts) do
    mounts = Map.merge(%{"data/cache" => "/workdir"}, docker_opts[:mounts] || %{})
    Map.put(docker_opts, :mounts, mounts)
  end

  @spec maybe_mount_videos(docker_opts()) :: docker_opts()

  defp maybe_mount_videos(%{mount_videos_in_dir: container_base_path} = opts)
       when is_binary(container_base_path) do
    video_mount =
      with {:ok, real} <- File.read_link(Settings.video_dir_rel()) do
        target_path = Path.join(container_base_path, Settings.video_dir_rel())
        %{real => target_path}
      else
        _ -> %{}
      end

    mounts = Map.merge(video_mount, opts[:mounts] || %{})
    Map.put(opts, :mounts, mounts)
  end

  defp maybe_mount_videos(opts), do: opts

  @doc """
  Sets default options for Util.Cmd2.exec to improve docker integration.
  """
  @spec default_exec_opts(full_ref(), Util.Cmd2.exec_opts()) :: Util.Cmd2.exec_opts()
  def default_exec_opts(full_ref, exec_opts \\ []) when is_full_ref(full_ref) do
    env = [{"DOCKER_BUILDKIT", "1"}]
    Keyword.merge([kill: docker_kill(full_ref), env: env, name: elem(full_ref, 0)], exec_opts)
  end

  @doc """
  Creates a Docker network
  """
  @spec network_create(name :: binary()) :: {:ok, id :: binary()} | {:error, reason :: binary()}
  def network_create(name) when is_binary(name) do
    {out, code} = System.cmd("docker", ["network", "create", name], stderr_to_stdout: true)

    cond do
      String.contains?(out, "network with name #{name} already exists") ->
        case System.cmd(
               "docker",
               ["network", "ls", "--filter", "name=#{name}", "--format", "{{.ID}}"],
               stderr_to_stdout: true
             ) do
          {out, 0} -> {:ok, out}
          {err, code} -> {:error, "exit_status=#{code} #{err}"}
        end

      code == 0 ->
        {:ok, out}

      true ->
        {:error, "exit_status=#{code} #{out}"}
    end
  end

  @doc """
  Deletes a Docker network
  """
  @spec network_delete(name_or_id :: binary()) ::
          :ok | {:error, reason :: binary()}
  def network_delete(name_or_id) when is_binary(name_or_id) do
    System.cmd("docker", ["network", "rm", name_or_id], stderr_to_stdout: true)
    |> case do
      {_out, 0} -> :ok
      {err, code} -> {:error, "exit_status=#{code} #{err}"}
    end
  end

  @doc """
  Returns the internal IP of a container in the given network
  """
  @spec network_container_ip(full_ref(), binary()) ::
          {:ok, ip :: binary()} | {:error, reason :: binary()}
  def network_container_ip(full_ref, network_name)
      when is_full_ref(full_ref) and is_binary(network_name) do
    %{container: container} = names(full_ref)

    System.cmd(
      "docker",
      [
        "inspect",
        container,
        "--format",
        "{{ $network := index .NetworkSettings.Networks \"#{network_name}\" }}{{ $network.IPAddress}}"
      ],
      stderr_to_stdout: true
    )
    |> case do
      {out, 0} -> {:ok, String.trim(out)}
      {err, code} -> {:error, "exit_status=#{code} #{err}"}
    end
  end

  @doc """
  Returns the time the container was created at in seconds since epoch (posix time)
  """
  @spec container_created_at(full_ref()) ::
          {:ok, posix_time :: non_neg_integer()} | {:error, reason :: binary()}
  def container_created_at(full_ref) when is_full_ref(full_ref) do
    System.cmd(
      "docker",
      [
        "inspect",
        names(full_ref).container,
        "--format",
        "{{.Created}}"
      ],
      stderr_to_stdout: true
    )
    |> case do
      {"", 0} ->
        {:error, "container does not exist"}

      {out, 0} ->
        with {:ok, utc, 0} <- DateTime.from_iso8601(String.trim(out)) do
          {:ok, DateTime.to_unix(utc)}
        else
          err -> {:error, "failed to parse docker timestamp: #{out} (inspect #{err})"}
        end

      {err, code} ->
        {:error, "exit_status=#{code} #{err}"}
    end
  end

  @doc """
  Checks if an image exists. If you omit the image tag, will return true if that
  image has any tag at all.
  """
  @spec image_exists?(binary()) :: boolean()
  def image_exists?(image) when is_binary(image) do
    System.cmd("docker", ["images", "--format", "{{.ID}}", image], stderr_to_stdout: true)
    |> case do
      {out, 0} ->
        out != ""

      err ->
        Logger.warning("Failed to list docker images: #{inspect(err)}")
        false
    end
  end

  @doc """
  Retags an existing image
  """
  @spec retag(image_ref(), binary()) :: :ok | {:error, binary()}
  def retag(image_ref, new_image_or_tag) when is_image_ref(image_ref) do
    old_image = names(image_ref).image

    new_image =
      if String.contains?(new_image_or_tag, ":"),
        do: new_image_or_tag,
        else: String.replace(old_image, ~r/:[^:]+$/, ":#{new_image_or_tag}")

    System.cmd("docker", ["tag", old_image, new_image], stderr_to_stdout: true)
    |> case do
      {_, 0} ->
        :ok

      {out, status} ->
        {:error,
         "failed to re-tag '#{old_image}' to '#{new_image}' with status=#{status}: #{out}"}
    end
  end

  @doc """
  Starts a named container
  """
  @spec start(full_ref()) :: :ok | {:error, binary()}
  def start(full_ref) when is_full_ref(full_ref) do
    Util.Cmd2.exec(
      [
        "docker",
        "start",
        "--attach",
        names(full_ref).container
      ],
      kill: docker_kill(full_ref)
    )
    |> Util.Cmd2.result_to_error()
  end

  @doc """
  Stops a named container
  """
  @spec stop(full_ref()) :: :ok | {:error, binary()}
  def stop(full_ref) when is_full_ref(full_ref) do
    container_name = names(full_ref).container

    System.cmd("docker", ["stop", "--time=0", container_name], stderr_to_stdout: true)
    |> case do
      {_, 0} ->
        :ok

      {out, status} ->
        {:error, "failed to stop '#{container_name}' with status=#{status}: #{String.trim(out)}"}
    end
  end

  @doc """
  Stops and removes a named container
  """
  @spec stop_and_remove(full_ref()) :: :ok | {:error, binary()}
  def stop_and_remove(full_ref) do
    container_name = names(full_ref).container

    System.cmd("docker", ["rm", "--force", container_name], stderr_to_stdout: true)
    |> case do
      {_, 0} ->
        :ok

      {out, status} ->
        {:error,
         "failed to stop and remove '#{container_name}' with status=#{status}: #{String.trim(out)}"}
    end
  end

  @doc """
  Checks if the named container exists. Returns true, regardless if the
  container is running or not.
  """
  @spec container_exists?(full_ref()) :: boolean()
  def container_exists?(full_ref) when is_full_ref(full_ref) do
    container_name = names(full_ref).container

    System.cmd(
      "docker",
      ["ps", "--all", "--filter", "name=#{container_name}", "--format", "{{.ID}}"],
      stderr_to_stdout: true
    )
    |> case do
      {out, 0} ->
        out != ""

      err ->
        Logger.warning("Failed to list docker containers: #{inspect(err)}")
        false
    end
  end

  @doc """
  Returns the tag with the project specific image location prefixed
  """
  def image_name(tag) do
    "veloroute.hamburg/docker:#{tag}"
  end

  defp docker_kill(full_ref) when is_full_ref(full_ref) do
    "docker stop --time 2 #{names(full_ref).container}"
  end

  @doc """
  Checks if the running docker has support to pass through GPUs.
  """
  @spec supports_gpu() :: boolean()
  defmemo supports_gpu do
    {out, status} =
      System.cmd("docker", ["run", "--rm", "--gpus", "all", "hello-world"],
        stderr_to_stdout: true
      )

    cond do
      status == 0 ->
        true

      status == 125 && String.contains?(out, "with capabilities: [[gpu]]") ->
        false

      true ->
        IO.puts(
          :stderr,
          "Looks like Docker cannot pass through a GPU. If nvidia-docker is not installed, this is to be expected, but the error message looks different this time: #{out}}"
        )

        false
    end
  end
end
