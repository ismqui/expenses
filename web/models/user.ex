defmodule Expenses.User do
  use Expenses.Web, :model

  schema "users" do
    field :email, :string
    has_many :auth_tokens, Expenses.AuthToken

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
  end
end
