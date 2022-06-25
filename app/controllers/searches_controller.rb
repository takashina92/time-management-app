class SearchesController < ApplicationController
  
  before_action :logged_in_user

  def search
    if params[:content].present?
      @tasks = Task.where('content LIKE ?', "%#{params[:content]}%")
    else
      flash[:warning] = "検索ワードを入力してください"
      redirect_to root_path
    end
  end

end
