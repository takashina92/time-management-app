class ApplicationController < ActionController::Base
include SessionsHelper

private
#beforeアクション
#ログイン済みのユーザーのみ
def logged_in_user
  unless logged_in?
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end
end

#正しいユーザーのみ
def correct_user
  @user = User.find(params[:id])
  unless @user == current_user
    flash[:danger] = "違うユーザーです。アクセスできません"
    redirect_to root_url
  end
end


end
