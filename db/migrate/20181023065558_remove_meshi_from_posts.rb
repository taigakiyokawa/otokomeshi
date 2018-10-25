class RemoveMeshiFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :meshi, :string
  end
end
