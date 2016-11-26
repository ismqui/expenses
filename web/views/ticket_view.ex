defmodule Expenses.TicketView do
  use Expenses.Web, :view

  def get_market(markets, id) do
    %{name: name} = markets
                    |> Enum.filter(fn x -> x.id == id end)
                    |> List.first
    name
  end
end
