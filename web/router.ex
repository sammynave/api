defmodule Api.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Api do
    pipe_through :api
    # Registration
    post "/register", RegistrationController, :create
    # Route stuff to our SessionController
    resources "/session", SessionController, only: [:index]
    post "/token", SessionController, :create, as: :login
  end
end
