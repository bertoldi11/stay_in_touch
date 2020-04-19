defmodule StayInTouch.Repo do
  use Ecto.Repo,
    otp_app: :stay_in_touch,
    adapter: Ecto.Adapters.Postgres
end
