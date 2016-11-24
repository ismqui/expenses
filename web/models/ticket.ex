defmodule Expenses.Ticket do
  use Expenses.Web, :model

  schema "tickets" do
    belongs_to :market, Expenses.Market
    field :date_ticket, Ecto.DateTime

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:market_id, :date_ticket])
    |> validate_required([:market_id, :date_ticket])
  end

end
