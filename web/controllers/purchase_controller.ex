defmodule Expenses.PurchaseController do
  use Expenses.Web, :controller
  alias Expenses.Router.Helpers
  import Ecto.Query

  alias Expenses.Purchase
  alias Expenses.Ticket

  def index(conn, %{"ticket_id" => ticket_id}) do
    query = from p in Purchase, where: p.ticket_id == ^ticket_id
    purchases = Repo.all(query)
    ticket = Repo.get(Ticket, String.to_integer(ticket_id))
    ticket = Repo.preload(ticket, :market)
    render conn, "index.html", purchases: purchases, ticket: ticket
  end

  def new(conn, %{"ticket_id" => ticket_id}) do
    changeset = Purchase.changeset(%Purchase{}, %{ticket_id: ticket_id})
    IO.puts "++++++++++++++++++"
    IO.inspect changeset
    IO.puts "++++++++++++++++++"
    render conn, "new.html", changeset: changeset, ticket_id: ticket_id
  end

  def create(conn, %{"purchase" => purchase}) do
    IO.puts "++++++++++++++++++"
    IO.inspect purchase
    IO.puts "++++++++++++++++++"
    changeset = Purchase.changeset(%Purchase{}, purchase)
    ticket_id = purchase["ticket_id"]

    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Purchase inserted")
        |> redirect(to: Helpers.ticket_purchase_path(conn, :index, ticket_id))
      {:error, changeset} ->
        IO.inspect changeset
        conn
        |> render("new.html", ticket_id: ticket_id, changeset: changeset)
    end
  end
end
