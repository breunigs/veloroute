defmodule Basemap.IgnorePbfDigester do
  @moduledoc """
  Fake compressor to trick Phoenix into not creating hash digest versions for
  *.pbf files. Since file extensions need to be explicitely set to be
  compressed, this is only necessary to avoid copying files and adding a hash to
  them.
  """
  @behaviour Phoenix.Digester.Compressor

  def compress_file(_file_path, _content) do
    :error
  end

  def file_extensions do
    [".pbf"]
  end
end
