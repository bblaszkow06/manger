defmodule Manger.CLI do
  @moduledoc """
  An entry point for Manger escript
  """

  require Logger

  def main(argv) do
    {options, _argv_rest} =
      OptionParser.parse!(argv,
        strict: [
          dir: :string,
          port: :integer
        ],
        aliases: [d: :dir, p: :port]
      )

    options = Keyword.put_new(options, :port, 8000)

    Application.put_all_env(manger: options)
    Application.ensure_all_started(:manger)

    port = options[:port]
    Logger.info("Started HTTP server at port #{port}. Visit http://localhost:#{port}")

    Process.sleep(:infinity)
  end
end
