# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :el_auth,
  ecto_repos: [ElAuth.Repo]

# Configures the endpoint
config :el_auth, ElAuthWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElAuthWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ElAuth.PubSub,
  live_view: [signing_salt: "Y2VmRprN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :el_auth, ElAuth.Guardian,
 issuer: "el_auth_service",
 secret_key: "secret"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
