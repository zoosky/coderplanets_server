defmodule MastaniServer.Repo.Migrations.CreatePostsTagsJoinTable do
  use Ecto.Migration

  def change do
    create table(:posts_tags) do
      add(:tag_id, references(:tags, on_delete: :delete_all), null: false)
      add(:post_id, references(:cms_posts, on_delete: :delete_all), null: false)
    end

    create(unique_index(:posts_tags, [:tag_id, :post_id]))
  end
end
