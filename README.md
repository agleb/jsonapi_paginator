# JsonapiPaginator

Renders links section of the JSONAPI.ORG API's response as a map.

```elixir

  require JsonapiPaginator

    result =
      JsonapiPaginator.render_links(%{
        base_url: "http://localhost/api/v1/get_page?",
        page_number: 2,
        page_size: 10,
        total_pages: 10,
        total_count: 100
      })

    expected = %{
      first: "http://localhost/api/v1/get_page?page[number]=1&page[size]=10",
      last: "http://localhost/api/v1/get_page?page[number]=10&page[size]=10",
      next: "http://localhost/api/v1/get_page?page[number]=3&page[size]=10",
      prev: "http://localhost/api/v1/get_page?page[number]=1&page[size]=10",
      self: "http://localhost/api/v1/get_page?page[number]=2&page[size]=10"
    }

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jsonapi_paginator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jsonapi_paginator, "~> 0.1.0"}
  ]
end
```

