defmodule StayInTouch.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :birthday, :date
      add :email, :string
      add :facebook, :string
      add :instagram, :string
      add :password, :string
      add :bio, :string
      add :avatar, :string

      timestamps()
    end
  end
end
