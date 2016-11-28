defmodule Expenses.Market do
  use Expenses.Web, :model

  schema "markets" do
    field :name, :string
    field :address, :string
    field :city, :string
    field :zipcode, :integer
    field :country, :string
    has_many :tickets, Expenses.Ticket

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :address, :city, :zipcode, :country])
    |> validate_required([:name, :address, :city, :zipcode, :country])
  end
end
