defmodule Expenses.Category do
  use Expenses.Web, :model

  schema "categories" do
    field :name, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,[:name])
    |> validate_required([:name]) 
  end

end
