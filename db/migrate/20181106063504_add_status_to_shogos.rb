class AddStatusToShogos < ActiveRecord::Migration[5.2]
  def change
    add_column :shogos, :status, :integer, :default => 0
  end
end
