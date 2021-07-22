defmodule VelorouteWeb.FeedControllerTest do
  use VelorouteWeb.ConnCase, async: true

  test "GET /updates.atom", %{conn: conn} do
    conn = get(conn, "/updates.atom")
    body = response(conn, 200)
    assert response_content_type(conn, :"atom+xml")
    assert body =~ "<?xml"
  end
end
