defmodule Expenses.PurchaseController do
  use Expenses.Web, :controller
  import Ecto.Query

  alias Expenses.Purchase
  alias Expenses.Ticket

  def index(conn, %{"id" => id}) do
    query = from p in Purchase, where: p.ticket_id == ^id
    purchases = Repo.all(query)
    ticket = Repo.get(Ticket, String.to_integer(id))
    ticket = Repo.preload(ticket, :market)
    render conn, "index.html", purchases: purchases, ticket: ticket
  end

  def new(conn, %{"id" => id}) do
    changeset = Purchase.changeset(%Purchase{}, %{})
    render conn, "new.html", changeset: changeset, id: id
  end

  def create(conn, %{"purchase" => purchase}) do
    changeset = Purchase.changeset(%Purchase{}, purchase)
    id = purchase["ticket_id"]

    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Purchase inserted")
        |> redirect(to: purchase_path(conn, :index, id))
      {:error, changeset} ->
        IO.inspect changeset
        conn
        |> render("new.html", id: id, changeset: changeset)
    end
  end
end
