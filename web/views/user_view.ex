defmodule Api.UserView do
  use Api.Web, :view
  use JaSerializer.PhoenixView

  attributes [:email]
  has_many :rooms, link: :rooms_link
  has_many :messages, link: :messages_link

  def rooms_link(user, conn) do
    user_rooms_url(conn, :index, user.id)
  end

  def messages_link(user, conn) do
    user_messages_url(conn, :index, user.id)
  end
end
