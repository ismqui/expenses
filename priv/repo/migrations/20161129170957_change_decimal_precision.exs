defmodule Expenses.Repo.Migrations.ChangeDecimalPrecision do
  use Ecto.Migration

  def change do
    alter table(:purchases) do
      modify :price, :decimal
    end
  end
end
