class AddShogoFirstIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shogo_first_id, :integer
  end
end
