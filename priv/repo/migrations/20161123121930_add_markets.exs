defmodule Expenses.Repo.Migrations.AddMarkets do
  use Ecto.Migration

  def change do
    create table(:markets) do
      add :name, :string
      add :address, :string
      add :city, :string
      add :zipcode, :integer
      add :country, :string

      timestamps
    end
  end
end
