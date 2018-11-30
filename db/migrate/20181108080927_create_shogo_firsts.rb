class CreateShogoFirsts < ActiveRecord::Migration[5.2]
  def change
    create_table :shogo_firsts do |t|
      t.references :user, foreign_key: true
      t.integer :status
      t.string :shogo_first_name

      t.timestamps
    end
  end
end
