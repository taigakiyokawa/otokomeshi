class RemoveUserIdIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user_id_id, :integer
  end
end
