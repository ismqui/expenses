defmodule Expenses.TicketController do
  use Expenses.Web, :controller

  alias Expenses.Ticket
  alias Expenses.Market

  def index(conn, _params) do
    tickets = Repo.all(Ticket)
    tickets = Repo.preload(tickets, :market)
    render conn, "index.html", tickets: tickets
  end

  def new(conn, _params) do
    changeset = Ticket.changeset(%Ticket{}, %{})
    markets = Repo.all(Market)
    render conn, "new.html", changeset: changeset, markets: markets
  end

  def create(conn, %{"ticket" => ticket}) do

    ecto_datetime = format_date(ticket["date_ticket"])

    numeric_ticket = Map.update!(ticket,"market_id", &String.to_integer(&1))
     |> Map.put("date_ticket", ecto_datetime)

    changeset = Ticket.changeset(%Ticket{}, numeric_ticket)

    case Repo.insert(changeset) do
      {:ok, _ticket} ->
        conn
        |> put_flash(:info, "Ticket created")
        |> redirect(to: ticket_path(conn, :index))
      {:error, changeset} ->
        markets = Repo.all(Market)
        conn
        |> render("new.html", changeset: changeset, markets: markets)
    end
  end

  defp format_date("") do
    ""
  end

  defp format_date(date) do
    {:ok, ecto_date} = date |> Ecto.Date.cast
    Ecto.DateTime.from_date(ecto_date)
  end

end
