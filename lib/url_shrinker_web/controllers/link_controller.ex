defmodule UrlShrinkerWeb.LinkController do
  use UrlShrinkerWeb, :controller

  alias UrlShrinker.Links
  alias UrlShrinker.Links.Link
  alias UrlShrinkerWeb.Controllers.CustomHelpers

  action_fallback UrlShrinkerWeb.FallbackController

  # def index(conn, _params) do
  #   links = Links.list_links()
  #   render(conn, "index.json", links: links)
  # end

  def create(conn, %{"url" => url}) do
    with {:ok, %Link{} = link} <- Links.create_link(%{url: url}) do
      CustomHelpers.link_created(conn, link)
    end
  end

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

  # def update(conn, %{"id" => id, "link" => link_params}) do
  #   link = Links.get_link!(id)

  #   with {:ok, %Link{} = link} <- Links.update_link(link, link_params) do
  #     render(conn, "show.json", link: link)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   link = Links.get_link!(id)

  #   with {:ok, %Link{}} <- Links.delete_link(link) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
