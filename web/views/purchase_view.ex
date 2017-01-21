defmodule Expenses.PurchaseView do
  use Expenses.Web, :view

  def datetime_to_string(date) do
    date
    |> Ecto.DateTime.to_date
    |> Ecto.Date.to_string
  end

  def total_price(purchases) do
    purchases
    |> Enum.reduce(Decimal.new(0), fn(x, acc) -> Decimal.add(x.price, acc) end)
  end
end
