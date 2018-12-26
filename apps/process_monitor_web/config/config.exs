# Since configuration is shared in umbrella projects, this file
# should only configure the :process_monitor_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :process_monitor_web,
  generators: [context_app: :process_monitor]

# Configures the endpoint
config :process_monitor_web, ProcessMonitorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xrDauWT4TXLInxBz8RdrpsaJjyQ6SUCPA9Ml+pAP2n4u8TlegCoFx/pF1qhzp1pW",
  render_errors: [view: ProcessMonitorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProcessMonitorWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
