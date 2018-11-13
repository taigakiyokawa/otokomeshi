class SetDefaultToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :shogo_first_id, :integer, :default => 0
    change_column :users, :shogo_last_id, :integer, :default => 0
  end
end
