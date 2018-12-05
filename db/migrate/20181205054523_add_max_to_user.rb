class AddMaxToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :max_shogo_first, :integer, default: 1
    add_column :users, :max_shogo_last, :integer, default: 1
  end
end
