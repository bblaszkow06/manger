defmodule Manger.CLI do
  @moduledoc """
  An entry point for Manger escript
  """

  def main(argv) do
    {options, _argv_rest} =
      OptionParser.parse!(argv,
        strict: [
          dir: :string,
          port: :integer
        ],
        aliases: [d: :dir, p: :port]
      )

    Application.put_all_env(manger: options)
    Application.ensure_all_started(:manger)

    Process.sleep(:infinity)
  end
end
