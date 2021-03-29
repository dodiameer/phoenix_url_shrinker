# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :url_shrinker,
  ecto_repos: [UrlShrinker.Repo]

# Configures the endpoint
config :url_shrinker, UrlShrinkerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wpzZGs3vVq2Y/hrrtxgzbYh/wviEnY0OoQHhRXUfCWthVYpN4GoYU1fJ7wRNOk2/",
  render_errors: [view: UrlShrinkerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: UrlShrinker.PubSub,
  live_view: [signing_salt: "LMg6dm49"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
