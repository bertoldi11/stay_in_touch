defmodule StayInTouch.Accounts.Auth do
  alias StayInTouch.Accounts
  alias StayInTouch.Accounts.User

  def login(params) do
    user = Accounts.get_user_by_email(params["email"])
    case authenticate(user, params["password"]) do
      {:ok, user} -> {:ok, user}
      {:error, _} -> :error
    end
  end

  defp authenticate(%User{} = user, password) do
     Bcrypt.check_pass(user, password)
  end

  defp authenticate(_, _),  do: {:error, "User not found"}

  def signed_in?(conn) do
    conn.assigns[:current_user]
  end
end
