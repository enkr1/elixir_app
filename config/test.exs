import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :elixir_app, ElixirApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "elixir_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_app, ElixirAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "uCAy4GqVShHo/vbg39o07J71lFhXarVnR5fc/WJMTzVqCkVLRzRJWOTJ40rJOROf",
  server: false

# In test we don't send emails.
config :elixir_app, ElixirApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
