defmodule Util.CompressTest do
  use ExUnit.Case, async: true

  @moduletag :tmp_dir

  # needs to be compressible, otherwise nothing is written at all
  @data String.duplicate("some tile like content ", 50)

  setup %{tmp_dir: tmp_dir} do
    old = Path.join(tmp_dir, "old")
    new = Path.join(tmp_dir, "new")
    File.mkdir_p!(Path.join(old, "sub"))
    File.mkdir_p!(Path.join(new, "sub"))
    {:ok, old: old, new: new}
  end

  defp compress(new, old) do
    Util.Compress.file_glob(Path.join(new, "**/*.pbf"), "test tiles", reuse_from: {new, old})
  end

  test "reuses artifacts for unchanged files and compresses changed ones", %{old: old, new: new} do
    # compressed with a different quality, so the bytes differ from what a fresh
    # compression would produce. That way the assertions below can tell apart
    # reusing the old artifact from compressing again.
    {:ok, old_br} = :brotli.encode(@data, %{quality: 1})
    File.write!(Path.join(old, "sub/same.pbf.gz"), Util.Compress.gzip(@data))
    File.write!(Path.join(old, "sub/same.pbf.br"), old_br)
    old_gz = File.read!(Path.join(old, "sub/same.pbf.gz"))
    refute old_br == Util.Compress.brotli(@data)

    File.write!(Path.join(old, "sub/changed.pbf.gz"), Util.Compress.gzip("previous content"))
    File.write!(Path.join(old, "sub/changed.pbf.br"), Util.Compress.brotli("previous content"))

    File.write!(Path.join(new, "sub/same.pbf"), @data)
    File.write!(Path.join(new, "sub/changed.pbf"), @data)

    assert :ok = compress(new, old)

    assert File.read!(Path.join(new, "sub/same.pbf.gz")) == old_gz
    assert File.read!(Path.join(new, "sub/same.pbf.br")) == old_br

    assert Util.Compress.gunzip(File.read!(Path.join(new, "sub/changed.pbf.gz"))) == @data

    assert File.read!(Path.join(new, "sub/changed.pbf.br")) !=
             File.read!(Path.join(old, "sub/changed.pbf.br"))

    # sources are removed by default
    refute File.exists?(Path.join(new, "sub/same.pbf"))
    refute File.exists?(Path.join(new, "sub/changed.pbf"))
  end

  test "reused files get a fresh mtime", %{old: old, new: new} do
    File.write!(Path.join(old, "same.pbf.gz"), Util.Compress.gzip(@data))
    File.write!(Path.join(old, "same.pbf.br"), Util.Compress.brotli(@data))
    File.touch!(Path.join(old, "same.pbf.gz"), 0)
    File.touch!(Path.join(old, "same.pbf.br"), 0)

    File.write!(Path.join(new, "same.pbf"), @data)

    assert :ok = compress(new, old)

    {:ok, %{mtime: mtime}} = File.stat(Path.join(new, "same.pbf.gz"), time: :posix)
    assert mtime > 0
  end

  test "compresses when the old brotli file is missing", %{old: old, new: new} do
    File.write!(Path.join(old, "a.pbf.gz"), Util.Compress.gzip(@data))
    File.write!(Path.join(new, "a.pbf"), @data)

    assert :ok = compress(new, old)

    assert Util.Compress.gunzip(File.read!(Path.join(new, "a.pbf.gz"))) == @data
    assert File.exists?(Path.join(new, "a.pbf.br"))
  end

  test "compresses when the old gzip file is corrupt", %{old: old, new: new} do
    File.write!(Path.join(old, "a.pbf.gz"), "not actually gzipped")
    File.write!(Path.join(old, "a.pbf.br"), Util.Compress.brotli(@data))
    File.write!(Path.join(new, "a.pbf"), @data)

    assert :ok = compress(new, old)

    assert Util.Compress.gunzip(File.read!(Path.join(new, "a.pbf.gz"))) == @data
  end

  test "compresses when there is no previous version at all", %{old: old, new: new} do
    File.write!(Path.join(new, "a.pbf"), @data)

    assert :ok = compress(new, old)

    assert Util.Compress.gunzip(File.read!(Path.join(new, "a.pbf.gz"))) == @data
    assert File.exists?(Path.join(new, "a.pbf.br"))
  end

  test "without reuse_from everything is compressed", %{new: new} do
    File.write!(Path.join(new, "a.pbf"), @data)

    assert :ok = Util.Compress.file_glob(Path.join(new, "**/*.pbf"), "test tiles")

    assert Util.Compress.gunzip(File.read!(Path.join(new, "a.pbf.gz"))) == @data
    refute File.exists?(Path.join(new, "a.pbf"))
  end
end
