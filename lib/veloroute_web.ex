defmodule VelorouteWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use VelorouteWeb, :controller
      use VelorouteWeb, :html

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """

  def static_paths, do: ~w(assets fonts images geo favicons robots.txt)

  def router do
    quote do
      use Phoenix.Router, helpers: false

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: VelorouteWeb.Layouts]

      import Plug.Conn

      unquote(verified_routes())
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {VelorouteWeb.Layouts, :app}

      unquote(html_helpers())
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(html_helpers())
    end
  end

  def html do
    quote do
      use Phoenix.Component

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      # HTML escaping functionality
      import Phoenix.HTML

      # Shortcut for generating JS commands
      alias Phoenix.LiveView.JS

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: VelorouteWeb.Endpoint,
        router: VelorouteWeb.Router,
        statics: VelorouteWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end

# defmodule VelorouteWeb do
#   @moduledoc """
#   The entrypoint for defining your web interface, such
#   as controllers, views, channels and so on.

#   This can be used in your application as:

#       use VelorouteWeb, :controller
#       use VelorouteWeb, :view

#   The definitions below will be executed for every view,
#   controller, etc, so keep them short and clean, focused
#   on imports, uses and aliases.

#   Do NOT define functions inside the quoted expressions
#   below. Instead, define any helper function in modules
#   and import those modules here.
#   """

#   def controller do
#     quote do
#       use Phoenix.Controller, namespace: VelorouteWeb

#       import Plug.Conn
#       alias VelorouteWeb.Router.Helpers, as: Routes
#       import Phoenix.LiveView.Controller
#     end
#   end

#   def live_view do
#     quote do
#       use Phoenix.LiveView
#       unquote(view_helpers())
#     end
#   end

#   def live_component do
#     quote do
#       use Phoenix.LiveComponent

#       unquote(view_helpers())
#     end
#   end

#   def router do
#     quote do
#       use Phoenix.Router
#       import Plug.Conn
#       import Phoenix.Controller
#       import Phoenix.LiveView.Router
#     end
#   end

#   def channel do
#     quote do
#       use Phoenix.Channel
#     end
#   end

#   defp view_helpers do
#     quote do
#       # Use all HTML functionality (forms, tags, etc)
#       use Phoenix.HTML

#       # Import LiveView and .heex helpers (live_render, live_patch, <.form>, etc)
#       import Phoenix.LiveView.Helpers

#       # Import basic rendering functionality (render, render_layout, etc)
#       import Phoenix.View

#       alias VelorouteWeb.Router.Helpers, as: Routes
#     end
#   end

#   @doc """
#   When used, dispatch to the appropriate controller/view/etc.
#   """
#   defmacro __using__(which) when is_atom(which) do
#     apply(__MODULE__, which, [])
#   end
# end
