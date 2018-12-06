class AddDefalutToUser2 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :max_shogo_first, :integer, default: 1
    change_column :users, :max_shogo_last, :integer, default: 1
  end
end
