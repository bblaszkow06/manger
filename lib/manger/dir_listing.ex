defmodule Manger.DirListing do
  @moduledoc """
  Plug generating HTML directory listing if requested path is a directory.
  Otherwise the connection is forwarded to the rest of the pipeline

  Requires one option:
  * `:relative_to` - MFA tuple allowing to obtain the file system path used as a base of requested path
  """
  @behaviour Plug

  import Plug.Conn

  @impl true
  def init(opts), do: opts

  @impl true
  def call(conn, opts) do
    {module, fun, args} = opts[:relative_to]
    served_dir = apply(module, fun, args)
    requested_path = Path.join(served_dir, conn.request_path)

    if File.dir?(requested_path) do
      contents_list =
        requested_path
        |> File.ls!()
        |> Enum.map_join("\n", fn item ->
          ~s[<li><a href="#{Path.join(conn.request_path, item)}">#{item}</a></li>]
        end)

      response_html = """
      <html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <title>Directory listing for #{conn.request_path}</title>
      </head>
      <body>
      <ul>
      #{contents_list}
      </ul>
      </body
      </html
      """

      conn
      |> put_resp_header("content-type", "text/html")
      |> send_resp(200, response_html)
      |> halt()
    else
      conn
    end
  end
end
