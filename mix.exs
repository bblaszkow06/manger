defmodule Manger.MixProject do
  use Mix.Project

  @version "0.1.0"
  @github_url "https://github.com/bblaszkow06/manger"

  def project do
    [
      app: :manger,
      version: @version,
      elixir: "~> 1.12",
      escript: escript(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "A CLI tool spawning ad-hoc Cowboy HTTP server",
      package: package(),

      # Docs
      name: "Manger",
      source_url: @github_url,
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Manger.Application, []}
    ]
  end

  defp escript() do
    [main_module: Manger.CLI, app: nil]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["Bartosz Błaszków"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @github_url
      }
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: ["README.md", "LICENSE"],
      formatters: ["html"],
      source_ref: "v#{@version}"
    ]
  end
end
