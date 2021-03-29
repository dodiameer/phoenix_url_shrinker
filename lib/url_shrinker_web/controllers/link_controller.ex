defmodule UrlShrinkerWeb.LinkController do
  use UrlShrinkerWeb, :controller

  alias UrlShrinker.Links
  alias UrlShrinker.Links.Link
  alias UrlShrinkerWeb.Controllers.CustomHelpers

  action_fallback UrlShrinkerWeb.FallbackController

  @doc """
  Controller action to create a link
  """
  def create(conn, %{"url" => url}) do
    with {:ok, %Link{} = link} <- Links.create_link(%{url: url}) do
      CustomHelpers.link_created(conn, link)
    end
  end

  @doc """
  Controller action to redirect to a link based on a hash
  """
  def redirect_to_link(conn, %{"hash" => hash}) do
    case Links.get_link_by_hash(hash) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{message: "Link not found"})
      link ->
        conn
        |> redirect(external: link.url)
    end
  end
end
