defmodule Gas.MixProject do
  use Mix.Project

  def project do
    [
      app: :gas,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "1.6.0"},
      {:hackney, "1.15.2", override: true},
      {:jason, "~> 1.2"}
    ]
  end
end
