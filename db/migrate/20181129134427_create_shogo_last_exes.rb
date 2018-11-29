class CreateShogoLastExes < ActiveRecord::Migration[5.2]
  def change
    create_table :shogo_last_exes do |t|
      t.string :name

      t.timestamps
    end
  end
end
