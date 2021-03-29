defmodule UrlShrinkerWeb.Controllers.CustomHelpers do
  @moduledoc """
  Custom helper controller

  Do not use this in the main router.
  Instead call these functions from your other controllers
  """
  use UrlShrinkerWeb, :controller

  @doc """
  Link successfully created handler

  Used in fallback controller and link controller
  """
  def link_created(conn, link) do
    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.link_path(conn, :redirect_to_link, link.hash))
    |> render("info.json", short_url: Routes.link_path(conn, :redirect_to_link, link.hash))
  end
end
