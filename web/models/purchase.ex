defmodule Expenses.Purchase do
  use Expenses.Web, :model

  schema "purchases" do
    field :description, :string
    field :price, :decimal
    belongs_to :ticket, Expenses.Ticket

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:ticket_id, :description, :price])
    |> validate_required([:ticket_id, :description, :price])
  end
end
