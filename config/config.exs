import Config

version = Mix.Project.config()[:version]

config :learning_elixir,
  ecto_repos: [LearningElixir.Repo],
  version: version

config :phoenix, :json_library, Jason

config :learning_elixir, LearningElixirWeb.Endpoint,
  pubsub_server: LearningElixir.PubSub,
  render_errors: [view: LearningElixirWeb.Errors.View, accepts: ~w(html json)]

config :learning_elixir, LearningElixir.Repo, start_apps_before_migration: [:ssl]

config :learning_elixir, Corsica, allow_headers: :all

config :learning_elixir, LearningElixir.Gettext, default_locale: "en"

config :learning_elixir, LearningElixirWeb.Plus.Security, allow_unsafe_scripts: false

config :esbuild,
  version: "0.14.41",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :sentry,
  root_source_code_path: File.cwd!(),
  release: version

config :logger, backends: [:console, Sentry.LoggerBackend]

# Import environment configuration
import_config "#{Mix.env()}.exs"
