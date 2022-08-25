# Manger
A tool spawning ad-hoc HTTP server. Written in Elixir, using Plug and Cowboy.

## Installation

1. Run `mix escript.install github bblaszkow06/manger`
2. Ensure `$MIX_HOME/escripts` is added to your `PATH` environment variable (see [`mix escript.install` docs](https://hexdocs.pm/mix/1.13/Mix.Tasks.Escript.Install.html))
and restart your shell

## Usage

Run `manger` and visit `http://locahost:8000`. You should see the contents of the current directory.
Optionally, you can pass the following arguments:

* `-p PORT_NUMBER` - port number used by the HTTP server, defaults to `8000`
* `-d DIRECTORY` - directory from which the files will be served, defaults to current directory
