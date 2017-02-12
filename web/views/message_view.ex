defmodule Api.MessageView do
  use Api.Web, :view
  use JaSerializer.PhoenixView

  attributes [:body, :inserted_at, :updated_at]
  has_one :owner, link: :owner_link
  has_one :room, link: :room_link

  def owner_link(message, conn) do
    user_url(conn, :show, message.owner_id)
  end

  def room_link(message, conn) do
    room_url(conn, :show, message.room_id)
  end
end
