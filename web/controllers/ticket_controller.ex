defmodule Expenses.TicketController do
  use Expenses.Web, :controller

  alias Expenses.Repo

  def index(conn, _params) do
    tickets = Repo.all(Ticket)
    render conn, "index.html", tickets: tickets
  end
end
