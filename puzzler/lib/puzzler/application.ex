defmodule Puzzler.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Puzzler.Worker.start_link(arg)
      # {Puzzler.Worker, arg}
      # {Puzzler.Server, :batman},
      # {Puzzler.Server, :flash},
      # {Puzzler.Server, :spiderman},
      # {Puzzler.Server, :superman}
      {DynamicSupervisor, strategy: :one_for_one, name: :sup}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Puzzler.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
