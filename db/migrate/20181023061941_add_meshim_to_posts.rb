class AddMeshimToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :meshim, :json
  end
end
