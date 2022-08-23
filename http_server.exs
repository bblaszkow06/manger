Mix.install([
  {:plug_cowboy, "~> 2.0"}
])

defmodule StaticRouter do
  use Plug.Builder

  plug Plug.Logger

  plug Plug.Static,
    at: "/",
    from: File.cwd!()

  plug :not_found

  def not_found(conn, _args) do
    IO.inspect(conn)

    send_resp(conn, 404, "Not found")
  end
end

Plug.Cowboy.http(StaticRouter, [], port: 8899)

receive do
  :ok -> :ok
end
