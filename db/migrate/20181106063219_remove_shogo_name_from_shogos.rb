class RemoveShogoNameFromShogos < ActiveRecord::Migration[5.2]
  def change
    remove_column :shogos, :shogo_name, :string
  end
end
