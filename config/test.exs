import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rumbl, Rumbl.Repo,
  username: "postgres",
  password: "postgres",
  database: "rumbl_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rumbl_web, RumblWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NU9dqiL/B+odW0tapSYuZdvGOZG4pUmzkGtidWEbZpEZZtdXY9jsJYloQE1TfmtO",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :rumbl, Rumbl.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :pbkdf2_elixir, :rounds, 1

wolfram_app_id =
  System.get_env("WOLFRAM_APP_ID") ||
  raise """
  environment variable WOLFRAM_APP_ID is missing.
  """

config :info_sys, :wolfram, app_id: wolfram_app_id
