defmodule Sample.MixProject do
  use Mix.Project

  def project do
    [
      app: :sample,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpotion],
      mod: {Sample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.7.1"},
      {:cowboy, "~> 2.4"},
      {:plug_cowboy, "~> 2.0"},
      {:httpoison, "~> 1.5"},
      {:httpotion, "~> 3.1.0"},
      {:distillery, "~> 2.0"}
    ]
  end
end
