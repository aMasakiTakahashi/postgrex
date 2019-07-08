defmodule Postgrex.Mixfile do
  use Mix.Project

  @version "0.14.3"

  def project do
    [
      app: :postgrex,
      version: @version,
      elixir: "~> 1.4",
      deps: deps(),
      name: "Postgrex",
      description: "PostgreSQL driver for Elixir",
      source_url: "https://github.com/elixir-ecto/postgrex",
      docs: docs(),
      package: package(),
      xref: [exclude: [Jason]]
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      extra_applications: [:logger, :crypto],
      mod: {Postgrex.App, []},
      env: [type_server_reap_after: 3 * 60_000, json_library: Jason]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.20", only: :docs},
      {:jason, "~> 1.0", optional: true},
      {:decimal, "~> 1.5"},
#      {:db_connection, "~> 2.1"},
      {:db_connection, "2.1.0", [git: "git@github.com:aMasakiTakahashi/db_connection.git", ref: "7c3195d079a56945aec3882b3590c4399c3a21e0"]},
      {:connection, "~> 1.0"}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"],
      groups_for_modules: [
        # Postgrex
        # Postgrex.Notifications
        # Postgrex.Query
        # Postgrex.Result
        "Data Types": [
          Postgrex.Box,
          Postgrex.Circle,
          Postgrex.INET,
          Postgrex.Interval,
          Postgrex.Lexeme,
          Postgrex.Line,
          Postgrex.LineSegment,
          Postgrex.MACADDR,
          Postgrex.Path,
          Postgrex.Point,
          Postgrex.Polygon,
          Postgrex.Range
        ],
        "Custom types and Extensions": [
          Postgrex.Extension,
          Postgrex.TypeInfo,
          Postgrex.Types
        ]
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Eric Meadows-Jönsson", "James Fish"],
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/elixir-ecto/postgrex"}
    ]
  end
end
