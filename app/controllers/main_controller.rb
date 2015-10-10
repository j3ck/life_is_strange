class MainController < ApplicationController

  def login
    raise current_user.inspect if current_user
  end

end
