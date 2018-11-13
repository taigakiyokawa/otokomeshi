class AddShogoLastIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shogo_last_id, :integer, default: 0
  end
end
