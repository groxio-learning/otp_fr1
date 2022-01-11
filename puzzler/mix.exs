defmodule Puzzler.MixProject do
  use Mix.Project

  def project do
    [
      app: :puzzler,
      version: "0.1.0",
<<<<<<< HEAD
      elixir: "~> 1.11",
=======
      elixir: "~> 1.13",
>>>>>>> 6c00a20 (Add score module to calculate reds and whites)
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Puzzler.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
