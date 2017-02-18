use Mix.Config

config :api, Api.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  http: [port: {:system, "PORT"}],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  url: [host: "rocky-beach-94063.herokuapp.com", port: 443],
  check_origin: ["https://rocky-beach-94063.herokuapp.com", "https://floating-peak-86565.herokuapp.com"],
  cache_static_manifest: "priv/static/manifest.json"


config :api, Api.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

config :logger, level: :info
