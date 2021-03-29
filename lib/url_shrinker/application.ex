defmodule UrlShrinker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UrlShrinker.Repo,
      # Start the Telemetry supervisor
      UrlShrinkerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UrlShrinker.PubSub},
      # Start the Endpoint (http/https)
      UrlShrinkerWeb.Endpoint,
      # Start a worker by calling: UrlShrinker.Worker.start_link(arg)
      # {UrlShrinker.Worker, arg},
      {ConCache, name: :link_cache, ttl_check_interval: false},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UrlShrinker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UrlShrinkerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
