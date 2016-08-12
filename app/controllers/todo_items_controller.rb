class TodoItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo.todo_items.build(todo_item_params)
    if @todo_item.save
      flash[:success] = "new todo item added"
      redirect_to todo_path(@todo)
    else
      render 'todos/show'
    end
  end

  #mark task as complete
  def complete
    if @todo_item.update_attribute(:completed, 1)
      flash[:success] = "todo item marked as completed"
      redirect_to todo_path(@todo)
    else
      flash[:error] = "failed to mark item as completed"
      render 'todos/show'
    end
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "todo item deleted"
      redirect_to @todo
    else
      flash[:error] = "failed to delete todo item"
      render 'todos/show'
    end
  end

  private
    def set_todo
      @todo = Todo.find_by_id(params[:todo_id])
    end

    def set_todo_item
      @todo_item = @todo.todo_items.find_by_id(params[:id])
    end

    def todo_item_params
      params[:todo_item].permit(:title, :completed)
    end
end
