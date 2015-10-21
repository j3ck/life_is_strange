class BlogsController < ApplicationController

  before_action :auth
  before_action :article, only: [:show, :edit, :update]
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
  end

  # Форма создания статьи в блоге
  def new
  end

  # Процесс создания статьи
  def create
    post = Article.create(post_params)
    if post.save
      flash[:success] = 'Запись удачно сохранена'
      redirect_to(blogs_url(subdomain: current_user.name))
    else
      flash[:error] = post.errors.to_a.join('. ')
      redirect_to :back
    end
  end

  # Форма изменения статьи
  def edit
  end

  # Процесс обновления статьи
  def update
    post = @article.update(post_params)
    redirect_to(blogs_url(subdomain: current_user.name))
  end

  private

    # Ищем текущую запись в блогах
    def article
      @article = Article.friendly.find(params[:id])
    end

    # Rails Strong parameters
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
