defmodule Expenses.PurchaseView do
  use Expenses.Web, :view

  def datetime_to_string(date) do
    date
    |> Ecto.DateTime.to_date
    |> Ecto.Date.to_string 
  end
end
