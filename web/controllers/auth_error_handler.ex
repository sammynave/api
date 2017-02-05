defmodule Api.AuthErrorHandler do
 use Api.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(Api.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(Api.ErrorView, "403.json")
 end
end
