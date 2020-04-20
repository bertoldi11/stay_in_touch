defmodule StayInTouchWeb.SessionController do
  use StayInTouchWeb, :controller

  alias StayInTouch.Accounts
  alias StayInTouch.Accounts.User


  def new(conn, _params) do
    # Carrega formulário de login
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    # Valida informações de login
  end
end
