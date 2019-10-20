class TasksController < ApplicationController
  #全アクションでログインを要求
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    if logged_in?
      @tasks = current_user.tasks
    end
  end
  
  def show
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  #correct_userの定義
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to login_url
    end
  end
end
