class AddExToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shogo_first_ex_id, :integer, default: 0
    add_column :users, :shogo_last_ex_id, :integer, default: 0
    add_column :users, :shogo_first_ex_flag, :boolean, default: false
    add_column :users, :shogo_last_ex_flag, :boolean, default: false
    
  end
end
