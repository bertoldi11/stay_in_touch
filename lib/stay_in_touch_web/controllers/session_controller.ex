defmodule StayInTouchWeb.SessionController do
  use StayInTouchWeb, :controller

  alias StayInTouch.Accounts
  alias StayInTouch.Accounts.{User, Auth}


  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"session" => auth_params}) do
    case Auth.login(auth_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Seja Bem vindo.")
        |> redirect(to: Routes.user_path(conn, :index))
      :error ->
        changeset = Accounts.change_user(%User{})
        conn
        |> put_flash(:error, "Ou você não esta cadastrado, ou sua senha está incorreta.")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Você saiu!")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
