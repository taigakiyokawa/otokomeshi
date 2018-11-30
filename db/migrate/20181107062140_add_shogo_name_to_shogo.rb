class AddShogoNameToShogo < ActiveRecord::Migration[5.2]
  def change
    add_column :shogos, :shogo_name, :string
  end
end
