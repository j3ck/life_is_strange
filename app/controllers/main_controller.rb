class MainController < ApplicationController

  before_action :auth, except: [:login, :wip]

  def login
    # raise current_user.inspect
  end

  def dashboard
  end

  def wip
  end

  private

    def auth
      redirect_to :login_path unless current_user
    end

end
