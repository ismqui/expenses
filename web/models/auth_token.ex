defmodule Expenses.AuthToken do
  use Expenses.Web, :model

  alias Expenses.{Endpoint, User}
  alias Phoenix.Token

  schema "auth_tokens" do
    field :value, :string
    belongs_to :user, Expenses.User

    timestamps(updated_at: false)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, user) do
    struct
    |> cast(%{}, [])
    |> put_assoc(:user, user)
    |> put_change(:value, generate_token(user))
    |> validate_required([:value, :user])
    |> unique_constraint(:value)
  end

  # generate a random and url-encoded token of given length
  defp generate_token(nil), do: nil
  defp generate_token(user) do
    Token.sign(Endpoint, "user", user.id)
  end
  # defp generate_token(length) do
  #   random = :crypto.strong_rand_bytes(length)
  #   random
  #   |> Base.url_encode64
  #   |> binary_part(0, length)
  # end
end
