defmodule UrlShrinkerWeb.LinkView do
  use UrlShrinkerWeb, :view

  @doc """
  Link info renderer

  ## Return data
  ```json
  {
    "link": "<Short link url>"
  }
  ```
  """
  def render("info.json", %{short_url: link}) do
    %{link: link}
  end
end
