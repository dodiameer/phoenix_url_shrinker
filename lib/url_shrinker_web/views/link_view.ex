defmodule UrlShrinkerWeb.LinkView do
  use UrlShrinkerWeb, :view
  # alias UrlShrinkerWeb.Router
  # alias UrlShrinkerWeb.LinkView

  # def render("index.json", %{links: links}) do
  #   %{data: render_many(links, LinkView, "link.json")}
  # end

  # def render("redirect.json", %{link: link}) do
  #   %{data: render_one(link, LinkView, "link.json")}
  # end

  def render("info.json", %{short_url: link}) do
    %{link: link}
  end
end
