class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update, :show, :destroy]

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.where(user_id: current_user.id, done: 0)
    @tasks_done = Task.where(user_id: current_user.id, done: 1)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録完了"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "編集が完了しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy_page
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.authenticate(params[:user][:password])
      @user.destroy
      flash[:success] = "ユーザーの削除が完了しました"
      redirect_to root_url
    else
      flash.now[:danger] = "パスワードが違います"
      render 'destroy_page'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
