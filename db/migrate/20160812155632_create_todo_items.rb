class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title
      t.references :todo_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
