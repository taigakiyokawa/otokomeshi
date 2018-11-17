class DropTableShogo < ActiveRecord::Migration[5.2]
  def change
    drop_table :shogos
  end
end
