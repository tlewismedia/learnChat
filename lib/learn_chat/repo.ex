defmodule LearnChat.Repo do
  use Ecto.Repo,
    otp_app: :learn_chat,
    adapter: Ecto.Adapters.Postgres
end
