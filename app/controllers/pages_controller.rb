class PagesController < ApplicationController
  def top
    @tasks = Task.where(user_id: current_user.id, done: 0).first(8)
    @tasks_doing = Task.where(user_id: current_user.id, done: 0, doing: 1).first(8)
    @tasks_done  = Task.where(user_id: current_user.id, done: 1).first(8)
  end

  def help
  end

  def contact
  end

  def sample
  end
end
