defmodule UrlShrinkerWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use UrlShrinkerWeb, :controller

  alias UrlShrinkerWeb.Controllers.CustomHelpers
  alias UrlShrinker.Links

  @doc """
  Error handlers
  """
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(UrlShrinkerWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{valid?: false, errors: [url: {"has already been taken", _}], changes: %{url: url}}}) do
    link = Links.get_link_by_url(url)
    CustomHelpers.link_created(conn, link)
  end
end
