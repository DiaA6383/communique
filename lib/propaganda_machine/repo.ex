defmodule PropagandaMachine.Repo do
  use Ecto.Repo,
    otp_app: :propaganda_machine,
    adapter: Ecto.Adapters.Postgres
end
