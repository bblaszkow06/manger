defmodule Manger do
  @moduledoc false
  use Plug.Builder

  plug Plug.Logger

  plug Plug.Static,
    at: "/",
    from: {__MODULE__, :get_dir_at_runtime, []}

  plug :not_found

  def not_found(conn, _args) do
    send_resp(conn, 404, "Not found")
  end

  def get_dir_at_runtime() do
    Application.get_env(:manger, :dir) || File.cwd!()
  end
end
