defmodule Api.RoomView do
  use Api.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name]
  has_one :owner, link: :user_link

  def user_link(room, conn) do
    user_url(conn, :show, room.owner_id)
  end
end
