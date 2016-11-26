defmodule Expenses.TicketView do
  use Expenses.Web, :view

  def get_market(markets, id) do
    %{name: name} = markets
                    |> Enum.filter(fn x -> x.id == id end)
                    |> List.first
    name
  end

  def market_to_select(markets) do
    markets
    |> Enum.map(fn x -> {String.to_atom(x.name), x.id} end)
  end
end
