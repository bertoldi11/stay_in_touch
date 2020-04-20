defmodule StayInTouch.AccountsTest do
  use StayInTouch.DataCase

  alias StayInTouch.Accounts

  describe "users" do
    alias StayInTouch.Accounts.User

    @valid_attrs %{
      avatar: "some avatar",
      bio: "some bio",
      birthday: ~D[2010-04-17],
      email: "some email",
      facebook: "some facebook",
      instagram: "some instagram",
      name: "some name",
      password: "some password"
    }
    @update_attrs %{
      avatar: "some updated avatar",
      bio: "some updated bio",
      birthday: ~D[2011-05-18],
      email: "some updated email",
      facebook: "some updated facebook",
      instagram: "some updated instagram",
      name: "some updated name",
      password: "some updated password"
    }
    @invalid_attrs %{
      avatar: nil,
      bio: nil,
      birthday: nil,
      email: nil,
      facebook: nil,
      instagram: nil,
      name: nil,
      password: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.bio == "some bio"
      assert user.birthday == ~D[2010-04-17]
      assert user.email == "some email"
      assert user.facebook == "some facebook"
      assert user.instagram == "some instagram"
      assert user.name == "some name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.bio == "some updated bio"
      assert user.birthday == ~D[2011-05-18]
      assert user.email == "some updated email"
      assert user.facebook == "some updated facebook"
      assert user.instagram == "some updated instagram"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
