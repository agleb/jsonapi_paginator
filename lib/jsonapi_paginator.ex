defmodule JsonapiPaginator do
  @moduledoc """
  Simple pagination links renderer for the JSON API
  """

  @doc """
  Render links based on the data, given in params map

  ```
        %{
          base_url: base_url,
          page_number: page_number,
          page_size: page_size,
          total_pages: total_pages,
          total_count: total_count
        }

  ```
  Returns map | %{}

  Sample return map:

  ```
  %{
      first: "http://localhost/api/v1/get_page?number=1&size=10",
      last: "http://localhost/api/v1/get_page?number=10&size=10",
      next: "http://localhost/api/v1/get_page?number=3&size=10",
      prev: "http://localhost/api/v1/get_page?number=1&size=10",
      self: "http://localhost/api/v1/get_page?number=2&size=10"
    }
  ```
  """
  def render_links(
        %{
          base_url: _base_url,
          page_number: _page_number,
          page_size: _page_size,
          total_pages: _total_pages,
          total_count: _total_count
        } = params
      ) do
    %{
      self:
        params.base_url <>
          "number=" <>
          to_string(params.page_number) <> "&size=" <> to_string(params.page_size),
      first: params.base_url <> "number=1&size=" <> to_string(params.page_size),
      last:
        params.base_url <>
          "number=" <>
          to_string(params.total_pages) <> "&size=" <> to_string(params.page_size)
    }
    |> put_next_link(params)
    |> put_prev_link(params)
  end

  def render_links(_), do: %{}

  defp put_prev_link(links, params) do
    if params.page_number > 1 do
      Map.put(
        links,
        :prev,
        params.base_url <>
          "number=" <>
          to_string(params.page_number - 1) <> "&size=" <> to_string(params.page_size)
      )
    else
      links
    end
  end

  defp put_next_link(links, params) do
    if params.page_number < params.total_pages do
      Map.put(
        links,
        :next,
        params.base_url <>
          "number=" <>
          to_string(params.page_number + 1) <> "&size=" <> to_string(params.page_size)
      )
    else
      links
    end
  end
end
