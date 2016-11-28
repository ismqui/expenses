defmodule Expenses.PurchaseController do
  use Expenses.Web, :controller

  alias Expenses.Purchase
  alias Expenses.Ticket

  def index(conn, %{"id" => id}) do
    purchases = Repo.get_by(Purchase, ticket_id: String.to_integer(id))||[]
    ticket = Repo.get(Ticket, String.to_integer(id))
    ticket = Repo.preload(ticket, :market)
    render conn, "index.html", purchases: purchases, ticket: ticket
  end

  def new(conn, _params) do
    changeset = Purchase.changeset(%Purchase{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"purchase" => purchase}) do
    changeset = Purchase.changeset(%Purchase{}, purchase)

    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Purchase inserted")
        |> redirect(to: purchase_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
