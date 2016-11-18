defmodule Expenses.PageController do
  use Expenses.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
