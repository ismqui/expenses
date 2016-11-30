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

  def create(conn, %{"market" => market}) do
    changeset = Market.changeset(%Market{}, market)

    case Repo.insert(changeset) do
      {:ok, _market} ->
        conn
        |> put_flash(:info, "New market created!")
        |> redirect(to: market_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    market = Repo.get!(Market, id)
    render conn, "edit.html", market: market
  end
end
