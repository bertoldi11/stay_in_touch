defmodule StayInTouchWeb.LayoutView do
  use StayInTouchWeb, :view

  def get_user_id(%{assigns: %{current_user: current_user}}) do
    current_user.id
  end
end
