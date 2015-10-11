class TimersController < ApplicationController

  before_action :auth

  def index
    # raise current_user.inspect
  end

  private

    def auth
      redirect_to :login_path unless current_user
    end

end
