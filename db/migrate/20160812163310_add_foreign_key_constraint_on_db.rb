class AddForeignKeyConstraintOnDb < ActiveRecord::Migration
  def change
    # => explanation: putting fk constraint on db level
    # => not gonna work for polymorphic association
    # => https://robots.thoughtbot.com/referential-integrity-with-foreign-keys
    add_foreign_key :todo_items, :todos, dependent: :delete
  end
end
