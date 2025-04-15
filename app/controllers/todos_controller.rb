class TodosController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end

  def create
    
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :completed)
  end
end
