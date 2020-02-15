defmodule LearnChat.Courses.TextBlock do
  use Ecto.Schema
  import Ecto.Changeset
  alias LearnChat.Courses.CourseSection

  schema "text_blocks" do
    field :body, :string
    field :heading, :string

    belongs_to :course_section, CourseSection

    timestamps()
  end

  @doc false
  def changeset(text_block, attrs) do
    text_block
    |> cast(attrs, [:heading, :body, :course_section_id])
    |> validate_required([:heading, :body, :course_section_id])
  end
end
