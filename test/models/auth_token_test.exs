defmodule Expenses.AuthTokenTest do
  use Expenses.ModelCase

  alias Expenses.AuthToken

  @valid_attrs %{value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AuthToken.changeset(%AuthToken{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AuthToken.changeset(%AuthToken{}, @invalid_attrs)
    refute changeset.valid?
  end
end
