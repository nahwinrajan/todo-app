require 'test_helper'

class TodoItemTest < ActiveSupport::TestCase
  def setup
    @todo_item = TodoItem.new(title: "New Task Title",
      todo_id: 1)
  end

  test "should be valid" do
    assert @todo_item.valid?
  end

  test "todo_id should be present" do
    @todo_item.todo_id = nil
    assert_not @todo_item.valid?
  end

  test "todo item should have name" do
    @todo_item.title = "     "
    assert_not @todo_item.valid?
  end

  test "todo item name should at least 2 char" do
    @todo_item.title = "a"
    assert_not @todo_item.valid?
  end

  test "todo item name should not be to long" do
    @todo_item.title = "a"*141
    assert_not @todo_item.valid?
  end
end
