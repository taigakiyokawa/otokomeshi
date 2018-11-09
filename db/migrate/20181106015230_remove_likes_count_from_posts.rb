class RemoveLikesCountFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :likes_count, :integer
  end
end
