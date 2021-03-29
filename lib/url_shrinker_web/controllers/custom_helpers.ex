defmodule UrlShrinkerWeb.Controllers.CustomHelpers do
  use UrlShrinkerWeb, :controller
  def link_created(conn, link) do
    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.link_path(conn, :redirect_to_link, link.hash))
    |> render("info.json", short_url: Routes.link_path(conn, :redirect_to_link, link.hash))
  end
end
