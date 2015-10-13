class BlogsController < ApplicationController

  before_action :auth
  before_action :user, only: [:index, :show]

  def index
    # raise user.inspect
  end

  def show
    @post = Article.last
  end

  def new
  end

  def create
    post = Article.create(post_params)
    if post.save
      flash["alert alert-success"] = 'Запись удачно сохранена'
    else
      flash["alert alert-danger"] = @message.errors.to_a.join('. ')
    end
    redirect_to blog_path(post)
  end

  private


    def post_params
      params.require(:blog_article).permit(:user_id, :title, :desc, :content)
    end

    def user
      if params[:username]
        @user = User.find_by(name: params[:name])
      else
        @user = current_user
      end
    end

    def auth
      redirect_to :login_path unless current_user
    end

end
