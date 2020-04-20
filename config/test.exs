use Mix.Config

# Configure your database
config :stay_in_touch, StayInTouch.Repo,
  username: "backend_dev",
  password: "backend_dev",
  database: "stay_in_touch_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :stay_in_touch, StayInTouchWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
