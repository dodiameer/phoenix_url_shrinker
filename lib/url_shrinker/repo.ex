defmodule UrlShrinker.Repo do
  use Ecto.Repo,
    otp_app: :url_shrinker,
    adapter: Ecto.Adapters.Postgres
end
