defmodule Expenses.MarketController do
  use Expenses.Web, :controller

  alias Expenses.Market

  def index(conn, _params) do
    markets = Repo.all(Market)
    render conn, "index.html", markets: markets
  end

  def new(conn, _params) do
    changeset =  Market.changeset(%Market{}, %{})
    render conn, "new.html", changeset: changeset
  end
end
