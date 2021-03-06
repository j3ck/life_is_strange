class OauthController < ApplicationController
  # Класс отвечает за создание сессий пользователей на сайте

  def authorize
    client = OAuth2::Client.new(SLACK[:client_id], SLACK[:client_secret], site: SLACK[:authorize_uri])
    redirect_to client.auth_code.authorize_url(redirect_uri: SLACK[:redirect_uri])
  end

  def deauthorize
    session[:access_token] = nil
    session[:user_id]      = nil
    redirect_to root_url, notice: 'You have logged out of Slack.'
  end

  def request_access_token
    if params[:code]
      client   = OAuth2::Client.new(SLACK[:client_id], SLACK[:client_secret], site: SLACK[:authorize_uri], token_url: SLACK[:token_uri])
      token    = client.auth_code.get_token(params[:code], redirect_uri: SLACK[:redirect_uri]).token
      response = HTTParty.get('https://slack.com/api/auth.test', query: { token: token })

      # Находим пользователя через метод в модели User (или создаём)
      @user             = User.find_or_create(token, response.parsed_response["user_id"])
      # Создаём сессию
      session[:user_id] = @user.id

      redirect_to root_url, notice: 'Successfully logged in with Slack!'
    else
      redirect_to root_url, notice: "Fail. #{params}"
    end

  end
end
