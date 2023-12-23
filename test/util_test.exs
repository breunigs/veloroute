defmodule UtilTest do
  use ExUnit.Case, async: true
  doctest Util
  doctest Util.Compress
  doctest Util.Docker
end
