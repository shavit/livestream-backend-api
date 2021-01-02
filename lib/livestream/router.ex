defmodule Livestream.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/rooms" do
    send_resp(conn, 200, "ok")
  end

  post "/on_publish", do: on_publish(conn)
  def on_publish(conn) do
    case conn do
      %{params: %{"room_id" => room_id}} ->
        on_publish_match_room(conn, room_id)
      _ -> send_resp(conn, 403, "not authorized")
    end
  end

  defp on_publish_match_room(conn, room_id) do
    case :ets.match(:livestream_state, {:rooms, [{room_id, :"$2", :"$3"}]}) do
      [[:active, _room_state]] -> send_resp(conn, 200, "ok")
      _ -> send_resp(conn, 403, "not authorized")
    end
  end

  post "/on_publish_done", do: on_publish_done(conn)
  def on_publish_done(conn), do: send_resp(conn, 200, "ok")

  post "/on_play", do: send_resp(conn, 400, "bad request")
  post "/on_play_done", do: send_resp(conn, 400, "bad request")

  match _, do: send_resp(conn, 404, "404")
end
