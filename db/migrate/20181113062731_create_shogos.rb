class CreateShogos < ActiveRecord::Migration[5.2]
  def change
    create_table :shogos do |t|
      t.string :name

      t.timestamps
    end
  end
end
