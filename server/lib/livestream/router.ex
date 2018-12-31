defmodule Livestream.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/on_publish", do: on_publish(conn)
  def on_publish(conn), do: send_resp(conn, 200, "ok")

  get "/on_publish_done", do: on_publish(conn)
  def on_publish_done(conn), do: send_resp(conn, 200, "ok")

  match _, do: send_resp(conn, 404, "404")
end
