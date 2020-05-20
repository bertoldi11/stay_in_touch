defmodule StayInTouchWeb.LayoutView do
  use StayInTouchWeb, :view

  @default_gravatar "https://saudeemeulugar.com/avatar/319"

  def get_user_id(%{assigns: %{current_user: current_user}}) do
    current_user.id
  end

  def get_gravatar_url(email, size \\ 200) do
    "https://www.gravatar.com/avatar/"
      <> get_gravatar_hash(email)
      <> "?s=#{size}"
      <> "&d=#{URI.encode(@default_gravatar)}"
  end

  def get_gravatar_hash(email) do
    email = email
    |> String.trim
    |> String.downcase

    :crypto.hash(:md5, email)
    |> Base.encode16(case: :lower)
  end
end
