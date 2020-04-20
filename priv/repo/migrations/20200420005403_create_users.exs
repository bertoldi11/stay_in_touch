defmodule StayInTouch.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :birthday, :date
      add :email, :string, null: false
      add :facebook, :string
      add :instagram, :string
      add :encrypted_password, :string, null: false
      add :bio, :string
      add :avatar, :string

      timestamps()
    end
  end
end
