class CreateShogoLasts < ActiveRecord::Migration[5.2]
  def change
    create_table :shogo_lasts do |t|
      t.string :name

      t.timestamps
    end
  end
end
