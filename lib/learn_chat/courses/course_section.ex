import EctoEnum
# defenum BlockTypeEnum, text: 0, video: 1, image: 2, quiz: 3, nope: 4

defmodule LearnChat.Courses.CourseSection do
  use Ecto.Schema
  import Ecto.Changeset
  alias LearnChat.Courses.TextBlock


  schema "course_sections" do
    field :title, :string
    field :type, :string

    has_many :text_blocks, TextBlock

    timestamps()
  end

  @doc false
  def changeset(course_section, attrs) do
    course_section
    |> cast(attrs, [:type, :title])
    |> validate_required([:type, :title])
  end
end
