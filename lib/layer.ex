defmodule Layer do
  @type route_group() :: :alltag | :freizeit | :rsw

  @type t() :: %Layer{
          name: binary(),
          route_group: route_group() | nil,
          active: boolean(),
          line: [binary()],
          icon: [binary()],
          fill: [binary()],
          outline: [binary()]
        }

  @enforce_keys [:name, :route_group, :active, :line, :icon, :fill, :outline]
  @derive Jason.Encoder
  defstruct @enforce_keys
end
