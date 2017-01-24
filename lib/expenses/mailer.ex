defmodule Expenses.Mailer do
  @moduledoc """
    Base mailer.Adds Bamboo mailer for sending mails.
  """
  use Bamboo.Mailer, otp_app: :expenses
end
