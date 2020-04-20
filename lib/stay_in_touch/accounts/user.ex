defmodule StayInTouch.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name email)a
  @optional_fields ~w(birthday facebook instagram password bio avatar)a

  schema "users" do
    field :avatar, :string
    field :bio, :string
    field :birthday, :date
    field :email, :string
    field :facebook, :string
    field :instagram, :string
    field :name, :string
    field :encrypted_password, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> encrypt_password 
  end


  defp encrypt_password(changeset) do
    password = get_change(changeset, :password)
    if password do
      encrypted_password = Bcrypt.hash_pwd_salt(password)
      put_change(changeset, :encrypted_password, encrypted_password)
    else
      changeset
    end
  end
end
