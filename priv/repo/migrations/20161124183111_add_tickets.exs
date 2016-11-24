defmodule Expenses.Repo.Migrations.AddTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :market_id, references(:markets)
      add :date_ticket, :datetime

      timestamps
    end
  end
end
