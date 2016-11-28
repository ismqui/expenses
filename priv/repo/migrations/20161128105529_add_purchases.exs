defmodule Expenses.Repo.Migrations.AddPurchases do
  use Ecto.Migration

  def change do
    create table(:purchases) do
      add :description, :string
      add :ticket_id, references(:tickets)
      add :price, :decimal, precision: 2

      timestamps
    end
  end
end
