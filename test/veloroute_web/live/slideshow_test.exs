defmodule VelorouteWeb.LiveSlideshowTest do
  use VelorouteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest
  @endpoint VelorouteWeb.Endpoint

  test "slideshow is started on autoplay links", %{conn: conn} do
    {:ok, view, _html} = conn |> get("/") |> live()

    view
    |> element(".icon[phx-click=sld-autoplay]", "7")
    |> render_click() =~ "■"
  end
end
