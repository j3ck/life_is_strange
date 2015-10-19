class ForumController < ApplicationController

  # Главная страница форума
  def index
    @society = Forum.society
    @science = Forum.science
  end

  # Страница форума со списком тем
  def show
    @pin = Theme.where(forum_id: Forum.find_by(name: params[:id]).id).pin
    @unpin = Theme.where(forum_id: Forum.find_by(name: params[:id]).id).unpin
    @forum  = Forum.find_by_name(params[:id])
  end

end
