defmodule Api.UserController do
  use Api.Web, :controller

  alias Api.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Api.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Api.UserView, "show.json", user: user)
  end
end
