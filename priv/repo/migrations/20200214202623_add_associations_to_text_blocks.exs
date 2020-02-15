defmodule LearnChat.Repo.Migrations.AddAssociationsToTextBlocks do
  use Ecto.Migration

  def change do
    alter table(:text_blocks) do
      add :course_section_id, references(:course_sections)
    end

    create index(:text_blocks, [:course_section_id])
  end
end
