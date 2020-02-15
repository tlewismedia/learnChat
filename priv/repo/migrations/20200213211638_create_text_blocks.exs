defmodule LearnChat.Repo.Migrations.CreateTextBlocks do
  use Ecto.Migration

  def change do
    create table(:text_blocks) do
      add :heading, :string
      add :body, :string

      timestamps()
    end

  end
end
