defmodule ElAuth.Repo do
  use Ecto.Repo,
    otp_app: :el_auth,
    adapter: Ecto.Adapters.Postgres
end
