defmodule LivestreamWeb.RoomController do
  use LivestreamWeb, :controller
  require Logger
  alias Livestream.Repo

  def index(conn, params) do
    render(conn, "index.json", params)
  end

  def on_publish(conn, params) do
    Logger.debug("on_publish #{inspect(params)}")
    case conn do
      %{params: %{"room_id" => room_id}} ->
        on_publish_match_room(conn, room_id)
      _ -> send_resp(conn, 403, "not authorized")
    end

    render(conn, "index.json")
  end

  defp on_publish_match_room(conn, room_id) do
    case :ets.match(:livestream_state, {:rooms, [{room_id, :"$2", :"$3"}]}) do
      [[:active, _room_state]] -> send_resp(conn, 200, "ok")
      _ -> send_resp(conn, 404, "room not found")
    end
  end

  def on_publish_done(conn, params) do
    Logger.debug("on_publish_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_play(conn, params) do
    Logger.debug("on_play #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_play_done(conn, params) do
    Logger.debug("on_play_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_update(conn, params) do
    Logger.debug("on_update #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_record_done(conn, params) do
    Logger.debug("on_record_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_done(conn, params) do
    Logger.debug("on_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def rooms(conn, params) do
    rooms = Repo.all()
    render(conn, "rooms.json", rooms: rooms)
  end
end
