defmodule ElAuthWeb.UserController do
  use ElAuthWeb, :controller

  alias ElAuth.Accounts

  action_fallback ElAuthWeb.FallbackController


  def register(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> text("User successfully created with email #{user.email}")
    end
  end
end
