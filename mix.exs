defmodule Livestream.MixProject do
  use Mix.Project

  def project do
    [
      app: :livestream,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Livestream, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:cowboy, "~> 2.6.1"},
      {:plug, "~> 1.7.1"},
      {:plug_cowboy, "~> 2.0.1"},
      {:poison, "~> 4.0.1"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
