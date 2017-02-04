defmodule Api.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Api do
    pipe_through :api
    resources "session", SessionController, only: [:index]
  end
end
