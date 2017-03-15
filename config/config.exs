# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :expenses,
  ecto_repos: [Expenses.Repo]

# Configures the endpoint
config :expenses, Expenses.Endpoint,
  url: [host: "192.168.1.34"],
  secret_key_base: "JtZ/cBYG9s8S0gLsOve4yUiC5/S8ay6Teb0MwyWn0MaLEpKM2Is8DjV/RZDnIGXS",
  render_errors: [view: Expenses.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Expenses.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Bamboo Mailer
config :expenses, Expenses.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465,
  username: System.get_env("SMTP_MAIL"),
  password: System.get_env("SMTP_MAIL_PASS"),
  tls: :if_available,
  ssl: true,
  retries: 1


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
