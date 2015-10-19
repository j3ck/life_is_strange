class ForumController < ApplicationController

  before_action :auth, only: [:new, :edit, :create, :update]
  before_action :theme, only: :theme_name

  # Главная страница форума
  def index
    @society = Forum.society
    @science = Forum.science
  end

  # Страница форума со списком тем
  def show
    # Прикреплённые темы (идут первыми)
    @pin   = Theme.where(forum_id: Forum.find_by(name: params[:id]).id).pin
    # Все остальные темы (идут за прикреплёнными)
    @unpin = Theme.where(forum_id: Forum.find_by(name: params[:id]).id).unpin
    # Данные о текущем форуме
    @forum = Forum.find_by_name(params[:id])
  end

  # Форма создания темы
  def new
  end

  # Процесс создания темы
  def create
    theme = Theme.create(theme_params)
    if theme.save
      flash[:success] = 'Тема создана'
      redirect_to(blogs_url(subdomain: current_user.name))
    else
      flash[:error] = theme.errors.to_a.join('. ')
      redirect_to :back
    end
  end

  # Страница конкретной темы
  def theme
    @messages = theme_name.messages
  end

  private

    def theme_name
      theme_name = Theme.find_by(name: params[:title])
    end

    def theme_params
      params.require(:blog_article).permit(:forum_id, :title, :desc, :content, :user_id)
    end

    # Перекидываем на главную, если пользователь не авторизован
    def auth
      redirect_to :login_path unless current_user
    end

end
