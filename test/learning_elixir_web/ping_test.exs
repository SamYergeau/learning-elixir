defmodule LearningElixirWeb.PingTest do
  use LearningElixirWeb.ConnCase

  test "GET /ping", %{conn: conn} do
    conn = get(conn, "/ping")

    assert response(conn, 200)
  end
end
