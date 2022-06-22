class TasksController < ApplicationController

before_action :logged_in_user
before_action :correct_user, only: [:index_complete, :index]

  def index
    @tasks = Task.where(user_id: current_user.id, done: 0).page(params[:page])
  end

  def index_completed
    @tasks = Task.where(user_id: current_user.id, done: 1).page(params[:page])
  end

  def show 
    @task = Task.find_by(id: params[:id], user_id: current_user.id)
    @working_hour = '00:00:00'
  end

  def complete
    @task = Task.find_by(id: params[:id], user_id: current_user.id)
    @task.update(done: 1, complete_date: Date.today)
    flash[:success] = "タスクを完了しました"
    redirect_to tasks_show_path(@task.user_id)
  end

  def incomplete
    @task = Task.find_by(id: params[:id], user_id: current_user.id)
    @task.update(done: 0)
    flash[:success] = "タスクを未完了にしました"
    redirect_to tasks_completed_show_path(@task.user_id)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました"
      redirect_to tasks_show_path(@task.user_id)
    else
      flash[:danger] = "無効な投稿です"
      redirect_to tasks_show_path(@task.user_id) #renderだとタスク一覧が読み込めず表示エラーになる
    end
  end

  def start
    @task = Task.find_by(id: params[:id])
    @task.update(doing: 1)
    redirect_to tasks_index_path(@task.user_id)
  end

  def stop
    @task = Task.find_by(id: params[:id])
    @task.update(doing: 0)
    redirect_to tasks_index_path(@task.user_id)
  end

  def destroy
    @task = Task.find_by(id: params[:id], user_id: current_user.id)
    @task.destroy
    flash[:success] = "タスクを削除しました"
    path = Rails.application.routes.recognize_path(request.referer) #遷移直前のアクション、コントローラーを取得
    if path[:action] == 'show'
      redirect_to tasks_show_path(@task.user_id)
    elsif path[:action] == 'show_completed'
      redirect_to tasks_completed_show_path(@task.user_id)
    else
      redirect_to root_url
    end
  end

  private

    def task_params  #.require(:task)必要なし
      params.permit(:content, :user_id)
    end
end
