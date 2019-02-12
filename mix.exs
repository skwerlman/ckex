defmodule CKEX.MixProject do
  use Mix.Project

  def project do
    [
      app: :ckex,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CKEX.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.19", runtime: false},
      {:credo, "~> 1.0", runtime: false, only: [:dev, :test]},
      {:dialyxir, ">= 1.0.0-rc.4", runtime: false, only: [:dev, :test]},
      {:rustler, "~> 0.19"}
    ]
  end

  defp rustler_crates do
    [
      ckex_vulkano: [
        path: "native/ckex_vulkano",
        mode: rustc_mode(Mix.env())
      ]
    ]
  end

  defp rustc_mode(:prod), do: :release
  defp rustc_mode(_), do: :debug
end
