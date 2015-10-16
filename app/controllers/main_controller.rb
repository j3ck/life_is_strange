class MainController < ApplicationController

  before_action :auth, except: [:login]

  def login
    # raise current_user.inspect
  end

  def dashboard
    # Временная авторизация в Github, для получения большего количества запросов
    github = Github.new basic_auth: ENV['GITHUB']

    # Вычисляем статистику по milestone Dasboard
      dashboard_milestone = github.issues.milestones.get 'riley-usagi', 'life_is_strange', '2'
      all_dasboard_issues = dashboard_milestone.open_issues + dashboard_milestone.closed_issues
      @dashboard_done = (dashboard_milestone.closed_issues.to_f / (all_dasboard_issues.to_f / 100)).round.inspect

    # Вычисляем статистику по milestone Blogs
      blogs_milestone = github.issues.milestones.get 'riley-usagi', 'life_is_strange', '1'
      all_blogs_issues = blogs_milestone.open_issues + blogs_milestone.closed_issues
      @blogs_done = (blogs_milestone.closed_issues.to_f / (all_blogs_issues.to_f / 100)).round.inspect

    # Вычисляем статистику по milestone Blogs
      gym_milestone = github.issues.milestones.get 'riley-usagi', 'life_is_strange', '4'
      all_gym_issues = gym_milestone.open_issues + gym_milestone.closed_issues
      @gym_done = (gym_milestone.closed_issues.to_f / (all_gym_issues.to_f / 100)).round.inspect


  end

  private

    def auth
      redirect_to :login_path unless current_user
    end

end
