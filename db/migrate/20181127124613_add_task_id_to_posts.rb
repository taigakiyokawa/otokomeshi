class AddTaskIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :task_id, :integer
  end
end
