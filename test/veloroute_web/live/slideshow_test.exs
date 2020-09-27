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

  test "slideshow can be reversed", %{conn: conn} do
    # setup
    {:ok, view, _html} = conn |> get("/") |> live()

    click_opts = %{
      "article" => "2020-06-16-ampel-ochsenzoll",
      "lat" => 53.6779,
      "lon" => 10.001143,
      "route" => nil,
      "zoom" => 18
    }

    assert render_hook(view, "map-click", click_opts) =~ ~s|data-img="ocG1AIlhqE9WlQffw2SqNQ"|

    # actual assert
    assert view
           |> element("button[phx-click=sld-reverse]")
           |> render_click() =~ ~s|data-img="ZZ48cmqMqXveDho4-OK7qQ"|
  end
end
