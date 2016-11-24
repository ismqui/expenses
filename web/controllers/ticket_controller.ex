defmodule Expenses.TicketController do
  use Expenses.Web, :controller

  alias Expenses.Ticket

  def index(conn, _params) do
    tickets = Repo.all(Ticket)
    render conn, "index.html", tickets: tickets
  end

  def new(conn, _params) do
    changeset = Ticket.changeset(%Ticket{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"ticket" => ticket}) do
    changeset = Ticket.changeset(%Ticket{}, ticket)

    case Repo.insert(changeset) do
      {:ok, _ticket} ->
        conn
        |> put_flash(:info, "Ticket created")
        |> redirect(to: ticket_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
