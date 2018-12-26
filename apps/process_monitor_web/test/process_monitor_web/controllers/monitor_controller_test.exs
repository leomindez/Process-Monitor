defmodule ProcessMonitorWeb.MonitorControllerTest do
  use ProcessMonitorWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert conn
  end
end