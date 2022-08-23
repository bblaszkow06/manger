defmodule Manger.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    port = Application.get_env(:manger, :port, 8000)

    children = [
      {Plug.Cowboy, scheme: :http, plug: Manger, options: [port: port]}
    ]

    opts = [strategy: :one_for_one, name: Manger.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
