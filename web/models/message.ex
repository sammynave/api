defmodule Api.Message do
  use Api.Web, :model

  schema "messages" do
    field :body, :string
    belongs_to :owner, Api.User
    belongs_to :room, Api.Room

    timestamps()
  end

  @required_fields [:body, :owner_id, :room_id]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:body, min: 1) # Body is 1+ characters
    |> assoc_constraint(:owner) # Author exists
    |> assoc_constraint(:room) # Room exists
  end
end
