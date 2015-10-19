class ForumController < ApplicationController

  # Главная страница форума
  def index
    @society = Forum.society
  end

  # Страница форума со списком тем
  def show
    @themes = Theme.where(forum_id: Forum.find_by(name: params[:id]).id)
  end

end
