class TodosController < ApplicationController
  before_action :set_todo, except: [:index, :new, :create]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      flash[:success] = "new task created"
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def show
    # => show items inside the task
  end

  def edit
  end

  def update
    if @todo.update_attributes(todo_params)
      flash[:success] = "task updated"
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    if @todo.destroy
      flash[:success] = "task deleted"
      redirect_to action: 'index'
    else
      flash[:error] = "failed to delete task"
      render 'index'
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :description)
    end

    def set_todo
      @todo = Todo.find_by_id(params[:id])
    end
end
