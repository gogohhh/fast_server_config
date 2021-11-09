defmodule People.MixProject do
  use Mix.Project

  def project do
    [
      app: :fast_server_config,
      version: "1.1.2",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      aliases: aliases()
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:plug_cowboy, "2.4.1"},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end

  defp description() do
    """
    Libreria de configuracion rapida de servidor local de aplicaciones elixir
    """
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "fast_server_config",
      # These are the default files included in the package
      files: ~w(lib src .formatter.exs mix.exs README* src),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/gogohhh/fast_server_config"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd --cd assets npm install"],
      "assets.deploy": [
        "cmd --cd assets npm run deploy",
        "esbuild default --minify",
        "cmd cp -r assets/static priv",
        "phx.digest"
      ]
    ]
  end
end
