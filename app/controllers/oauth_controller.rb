class OauthController < ApplicationController
  def authorize
    client = OAuth2::Client.new(SLACK[:client_id],
                                SLACK[:client_secret],
                                site: SLACK[:authorize_uri])
    redirect_to client.auth_code.authorize_url(redirect_uri: SLACK[:redirect_uri])
  end

  def deauthorize
    session[:access_token] = nil
    session[:team] = nil
    session[:user] = nil
    redirect_to root_url, notice: 'You have logged out of Slack.'
  end

  def request_access_token
    if params[:code]
      client = OAuth2::Client.new(SLACK[:client_id],
                                  SLACK[:client_secret],
                                  site: SLACK[:authorize_uri],
                                  token_url: SLACK[:token_uri])
      session[:access_token] = client.auth_code.get_token(params[:code], redirect_uri: SLACK[:redirect_uri]).token
      response = HTTParty.get('https://slack.com/api/auth.test', query: { token: session[:access_token] })
      session[:team] = response.parsed_response["team"]
      session[:user] = response.parsed_response["user"]


      # Находим пользователя через метод в модели User (или создаём)
        @user = User.find_or_create(session[:access_token], response.parsed_response["user_id"])
      # Создаём сессию
        session[:user_id] = @user.id


      redirect_to root_url, notice: 'Successfully logged in with Slack!'
    else
      redirect_to root_url, notice: "Fail. #{params}"
    end

  end
end
