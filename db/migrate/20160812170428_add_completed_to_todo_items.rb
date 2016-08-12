class AddCompletedToTodoItems < ActiveRecord::Migration
  def change
    # => set default value to false
    add_column :todo_items, :completed, :boolean, default: 0
  end
end
