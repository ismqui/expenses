defmodule Expenses.Ticket do
  use Expenses.Web, :model

  schema "tickets" do
    belongs_to :market, Expenses.Market

    timestamps
  end

end
