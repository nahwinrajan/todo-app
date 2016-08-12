class TodoItem < ActiveRecord::Base
  belongs_to :todo

  validates :title, presence: true, length: { minimum: 2, maximum: 140 }
  validates :todo_id, presence: true
end
