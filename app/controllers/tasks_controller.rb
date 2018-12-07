class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    include UsersHelper

    def index
      @tasks = Task.all.includes(:posts)
      @user = User.find_by(id: current_user.id)
      @shogo_first = ShogoFirst.find_by(id: set_shogo_first(@user))
      @shogo_last = ShogoLast.find_by(id: set_shogo_last(@user))
      @shogo_first_ex = ShogoFirstEx.find_by(id: @user.shogo_first_ex_id)
      @shogo_last_ex = ShogoLastEx.find_by(id: @user.shogo_last_ex_id)
      render partial: 'tasks/taskIndex'
    end
    
    def show
    end
   
    def new
      @task = Task.new
    end
   
    def edit
    end
   
    def create
      @task = Task.new(task_params)
   
      respond_to do |format|
        if @task.save
          format.html { redirect_to @task, notice: 'Task was successfully created.' }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
   
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to @task, notice: 'Banana was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
   
    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
   
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end
   
      # Never trust parameters from the scary internet, only allow the white list through.
      def task_params
        params.require(:task).permit(:body)
      end
        
end
