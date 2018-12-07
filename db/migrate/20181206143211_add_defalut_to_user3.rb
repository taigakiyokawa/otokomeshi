class AddDefalutToUser3 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :shogo_total, :integer, default: 2
  end
end
