defmodule Api.RoomChannel do
  use Phoenix.Channel
  require Logger

  def join("rooms:" <> room_id, message, socket) do
    Process.flag(:trap_exit, true)
    send(self, {:after_join, message})

    {:ok, socket}
  end

  def handle_info({:after_join, msg}, socket) do
    broadcast! socket, "user:entered", %{user: msg["user"]}
    push socket, "join", %{status: "connected"}
    {:noreply, socket}
  end

  def terminate(reason, _socket) do
    Logger.debug"> leave #{inspect reason}"
    :ok
  end
end
