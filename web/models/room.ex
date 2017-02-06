defmodule Api.Room do
  use Api.Web, :model

  schema "rooms" do
    field :name, :string
    belongs_to :owner, Api.Owner

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
