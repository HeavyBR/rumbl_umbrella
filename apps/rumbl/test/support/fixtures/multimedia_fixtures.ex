defmodule Rumbl.MultimediaFixtures do
  alias Rumbl.Accounts
  alias Rumbl.Multimedia
  alias Rumbl.Multimedia.Category

  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rumbl.Multimedia` context.
  """

  @doc """
  Generate a video.
  """
  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do

    %Category{id: category_id} = create_category("Test")

    attrs =
      Enum.into(attrs, %{
        title: "A Title",
        url: "http://example.com",
        description: "a description",
        category_id: category_id
      })

    {:ok, video} = Multimedia.create_video(user, attrs) |> IO.inspect(label: "RESLTADOO")
    video
  end

  defp create_category(name) do
    Multimedia.create_category!(name)
  end
end
