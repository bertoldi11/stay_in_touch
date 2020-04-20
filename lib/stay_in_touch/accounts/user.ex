defmodule StayInTouch.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :bio, :string
    field :birthday, :date
    field :email, :string
    field :facebook, :string
    field :instagram, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :birthday, :email, :facebook, :instagram, :password, :bio, :avatar])
    |> validate_required([
      :name,
      :birthday,
      :email,
      :facebook,
      :instagram,
      :password,
      :bio,
      :avatar
    ])
  end
end
