class Todo < ActiveRecord::Base
  # => we've set the fk constraint to be on db level
  # => https://robots.thoughtbot.com/referential-integrity-with-foreign-keys
  has_many :todo_items
  validates :title, presence: true, length: { minimum: 3, maximum: 75 }
  validates :description, length: { maximum: 250 }
end
