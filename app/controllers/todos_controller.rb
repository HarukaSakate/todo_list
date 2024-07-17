class TodosController < ApplicationController
    before_action :set_todo, only: %i[ show edit update destroy ]

    def index
        @todos = Todo.all
    end

    def new 
        @todo = Todo.new
    end

    def show
    end

    def edit 
    end

    def create 
        @todo = Todo.new(todo_params)
        if @todo.save
            redirect_to todos_path, notice: 'Todo was successfully created.'
        else 
            render :new
        end
    end

    def update
        if @todo.update(todo_params)
            head :no_content
        else
            render json: @todo.errors, status: :unprocessable_entity
        end 
    end

    def destroy
        @todo.destroy
        redirect_to todos_path, notice: 'Todo was successfully destroyed.'
    end
    
    private
        def set_todo
            @todo = Todo.find(params[:id])
        end

        def todo_params
            params.require(:todo).permit(:title, :completed)
        end
end
