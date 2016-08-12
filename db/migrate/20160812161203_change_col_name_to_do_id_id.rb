class ChangeColNameToDoIdId < ActiveRecord::Migration
  def change
    rename_column :todo_items, :todo_id_id, :todo_id
  end
end
