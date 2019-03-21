class CreateShogoFirstExes < ActiveRecord::Migration[5.2]
  def change
    create_table :shogo_first_exes do |t|
      t.string :name

      t.timestamps
    end
  end
end
