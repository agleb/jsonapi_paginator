defmodule JsonapiPaginatorTest do
  use ExUnit.Case

  import JsonapiPaginator

  test "render links basic" do
    result =
      render_links(%{
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

    assert result == expected
  end

  test "render - check last page" do
    result =
      render_links(%{
        base_url: "http://localhost/api/v1/get_page?",
        page_number: 10,
        page_size: 10,
        total_pages: 10,
        total_count: 100
      })

    expected = %{
      first: "http://localhost/api/v1/get_page?page[number]=1&page[size]=10",
      last: "http://localhost/api/v1/get_page?page[number]=10&page[size]=10",
      next: nil,
      prev: "http://localhost/api/v1/get_page?page[number]=9&page[size]=10",
      self: "http://localhost/api/v1/get_page?page[number]=10&page[size]=10"
    }

    assert result == expected
  end

  test "render - check first page" do
    result =
      render_links(%{
        base_url: "http://localhost/api/v1/get_page?",
        page_number: 1,
        page_size: 10,
        total_pages: 10,
        total_count: 100
      })

    expected = %{
      first: "http://localhost/api/v1/get_page?page[number]=1&page[size]=10",
      last: "http://localhost/api/v1/get_page?page[number]=10&page[size]=10",
      next: "http://localhost/api/v1/get_page?page[number]=2&page[size]=10",
      prev: nil,
      self: "http://localhost/api/v1/get_page?page[number]=1&page[size]=10"
    }

    assert result == expected
  end
end
