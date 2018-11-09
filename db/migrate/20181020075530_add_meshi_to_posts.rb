class AddMeshiToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :meshi, :string
  end
end
