defmodule Expenses.InputHelpers do
  use Phoenix.HTML

  def input_date(form, field, opts \\ []) do
    type = Phoenix.HTML.Form.date_select(form, field, opts)
    apply(Phoenix.HTML.Form, type, [form, field])
  end
end
