class BlogsController < ApplicationController

  before_action :auth
  before_action :user, only: [:index, :show]

  # Страница со всеми записями всех блогов
  def all_blogs
    @articles = Article.all.order('id desc').page(params[:page]).per(5)
    @best_author = User.all.sample
  end

  # Главная страница блогов конкретного пользователя
  def index
    @user = user
    @articles = Article.where(user_id: @user.id).order('id desc').page(params[:page]).per(5)
  end

  # Страница конкретной записи
  def show
    @article = Article.friendly.find(params[:id])
  end

  # Форма создания записи в блоге
  def new
  end

  # Процесс создания записи
  def create
    post = Article.create(post_params)
    if post.save
      flash["alert alert-success"] = 'Запись удачно сохранена'
      redirect_to(blogs_url(subdomain: current_user.name))
    else
      flash["alert alert-danger"] = post.errors.to_a.join('. ')
      redirect_to :back
    end
  end

  private

    def post_params
      params.require(:blog_article).permit(:user_id, :title, :desc, :content, :image)
    end

    # Метод определяет пользователя по адресу страницы
    # Если в адресе не указан пользователь, то берётся текущий (current_user)
    def user
      if params[:username]
        @user = User.find_by(name: params[:name])
      else
        @user = current_user
      end
    end

    # Перекидываем на главную, если пользователь не авторизован
    def auth
      redirect_to :login_path unless current_user
    end

end
