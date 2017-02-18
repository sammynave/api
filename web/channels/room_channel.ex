defmodule Api.RoomChannel do
  use Phoenix.Channel
  require Logger
  import Guardian.Phoenix.Socket

  def join("rooms:" <> room_id, message, socket) do
    user = Guardian.Phoenix.Socket.current_resource(socket)

    Process.flag(:trap_exit, true)
    send(self, {:after_join, %{email: user.email} })

    if user do
      {:ok, "Hello #{user.email}! Joined Room:#{room_id}", socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_info({:after_join, message}, socket) do
    broadcast! socket, "user:entered", %{user: message.email}
    push socket, "join", %{status: "connected"}
    {:noreply, socket}
  end

  def terminate(reason, _socket) do
    Logger.debug"> leave #{inspect reason}"
    :ok
  end
end
