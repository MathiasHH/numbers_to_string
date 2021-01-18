defmodule NumbersToString.MixProject do
  use Mix.Project

  def project do
    [
      app: :numbers_to_string,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NumbersToString.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # requires inotify-tools.  apt-get install inotify-tools
      {:mix_test_watch, "~> 1.0", only: :dev},
      {:poison, "~> 3.0"},
      {:plug, "~> 1.6"},
      # {:cowboy, "~> 2.4"}
      {:plug_cowboy, "~> 2.4"}

    ]
  end
end
