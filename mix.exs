defmodule JsonapiPaginator.MixProject do
  use Mix.Project

  def project do
    [
      app: :jsonapi_paginator,
      version: "0.1.1",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      deps: deps(),
      name: "jsonapi_paginator",
      source_url: "https://github.com/agleb/jsonapi_paginator"
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
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end

  defp description() do
    "Renders links section of the JSONAPI.ORG API's response as a map."
  end

  defp package() do
    [
      name: "jsonapi_paginator",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Gleb Andreev"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/agleb/jsonapi_paginator"}
    ]
  end
end
