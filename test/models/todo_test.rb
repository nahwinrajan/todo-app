require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup
    @todo = Todo.new(title: "New Task Title",
      description: "here goes the descripion")
  end

  test "task should be valid" do
    assert @todo.valid?
  end

  test "title should be present" do
    @todo.title = "    "
    assert_not @todo.valid?
  end

  test "title should be at least 3 character" do
    @todo.title = "ab"
    assert_not @todo.valid?
  end

  test "title must not be to long" do
    @todo.title = "n"*76
    assert_not @todo.valid?
  end

  test "description must not be to long" do
    @todo.description = "i"*251
    assert_not @todo.valid?
  end
end
