defmodule Expenses.PurchaseController do
  use Expenses.Web, :controller

  def index(conn, _params) do
    purchases = Repo.all(Expenses.Purchase)
    render conn, "index.html", purchases: purchases
  end

  def new(conn, _params) do

  end

  def create(conn, _params) do

  end
end
