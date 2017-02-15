defmodule Api.UserController do
  use Api.Web, :controller

  alias Api.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Api.AuthErrorHandler

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json-api", data: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.json-api", data: user)
  end

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Api.UserView, "show.json-api", data: user)
  end
end
