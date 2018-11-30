class RenameShogosToShogoFirst < ActiveRecord::Migration[5.2]
  def change
    rename_table :ShogoFirsts, :shogo_firsts
  end
end
