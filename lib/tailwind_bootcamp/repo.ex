defmodule TailwindBootcamp.Repo do
  use Ecto.Repo,
    otp_app: :tailwind_bootcamp,
    adapter: Ecto.Adapters.Postgres
end
