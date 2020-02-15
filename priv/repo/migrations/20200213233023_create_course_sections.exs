defmodule LearnChat.Repo.Migrations.CreateCourseSections do
  use Ecto.Migration

  def change do
    create table(:course_sections) do
      add :type, :string
      add :title, :string

      timestamps()
    end

  end
end
