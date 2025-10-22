defmodule TailwindBootcamp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TailwindBootcampWeb.Telemetry,
      TailwindBootcamp.Repo,
      {DNSCluster, query: Application.get_env(:tailwind_bootcamp, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TailwindBootcamp.PubSub},
      # Start a worker by calling: TailwindBootcamp.Worker.start_link(arg)
      # {TailwindBootcamp.Worker, arg},
      # Start to serve requests, typically the last entry
      TailwindBootcampWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TailwindBootcamp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TailwindBootcampWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
