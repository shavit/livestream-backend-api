defmodule Livestream.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/on_publish", do: on_publish(conn)
  def on_publish(conn), do: send_resp(conn, 200, "ok")

  post "/on_publish_done", do: on_publish(conn)
  def on_publish_done(conn), do: send_resp(conn, 200, "ok")

  post "/on_play", do: send_resp(conn, 400, "bad request")
  post "/on_play_done", do: send_resp(conn, 400, "bad request")

  match _, do: send_resp(conn, 404, "404")
end
