class BlogsController < ApplicationController

  before_action :user

  def index
    raise user.inspect
  end

  private

    def user
      if params[:username]
        @user = User.find_by(name: params[:name])
      else
        @user = current_user
      end
    end

end
