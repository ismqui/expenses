defmodule Expenses.CategoryController do
  use Expenses.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
