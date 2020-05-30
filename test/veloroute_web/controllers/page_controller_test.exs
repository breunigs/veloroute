defmodule VelorouteWeb.PageControllerTest do
  use VelorouteWeb.ConnCase, async: true

  test "GET /quality/13-alsenplatz", %{conn: conn} do
    conn = get(conn, "/quality/13-alsenplatz")
    assert "/article/2018-12-18-alsenplatz" = redirected_to(conn, 301)
  end

  test "GET /quality/this-never-existed", %{conn: conn} do
    conn = get(conn, "/quality/this-never-existed")
    assert html_response(conn, 404) =~ "<meta http-equiv"
  end
end
