class AddUserToShogos < ActiveRecord::Migration[5.2]
  def change
    add_reference :shogos, :user, foreign_key: true
  end
end
