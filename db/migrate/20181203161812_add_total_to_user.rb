class AddTotalToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shogo_total, :integer, default: 0
  end
end
