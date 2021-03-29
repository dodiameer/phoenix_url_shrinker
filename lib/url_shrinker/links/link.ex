defmodule UrlShrinker.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :hash, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:hash, :url])
    |> validate_required([:url])
    |> unique_constraint(:url)
    |> put_hash()
  end

  defp put_hash(%Ecto.Changeset{valid?: true} = changeset) do
    changeset
    |> put_change(:hash, HashGenerator.gen_hash())
  end

  defp put_hash(changeset), do: changeset
end
