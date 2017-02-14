defmodule Api.RoomChannelTest do
  use Api.ChannelCase

  alias Api.RoomChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(RoomChannel, "room:lobby")

    {:ok, socket}
  end
end
