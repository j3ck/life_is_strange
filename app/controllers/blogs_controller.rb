class BlogsController < ApplicationController

  before_action :auth
  before_action :user, only: [:index, :show]

  def index
    raise user.inspect
  end

  def new
  end

  def create
  end

  private

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
