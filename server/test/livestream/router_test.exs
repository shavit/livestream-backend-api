defmodule Livestream.RouterTest do
  use ExUnit.Case
  doctest Livestream
  alias Livestream.Router

  test "on_publish/1 valid response" do
    conn = Plug.Adapters.Test.Conn.conn(%Plug.Conn{private: %{}}, :post, "/on_publish", nil)
    resp = Router.on_publish conn
    assert resp.status == 200
    assert resp.resp_body == "ok"
  end

  test "on_publish_done/1 valid response" do
    conn = Plug.Adapters.Test.Conn.conn(%Plug.Conn{private: %{}}, :post, "/on_publish_done", nil)
    resp = Router.on_publish conn
    assert resp.status == 200
    assert resp.resp_body == "ok"
  end

end
