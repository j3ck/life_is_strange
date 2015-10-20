class MainController < ApplicationController

  before_action :auth, except: [:login, :contacts]

  def login
  end

  # Метод страницы контактов. Выводит форму и сам же принимает параметры из формы
  def contacts
    if params[:support_message]
      support = Support.create(support_message_params)
      if support.save
        flash[:success] = 'Сообщение отправлено'
        redirect_to :back
      else
        flash[:error] = support.errors.to_a.join('. ')
        redirect_to :back
      end
    end
  end

  private

    def auth
      redirect_to :login_path unless current_user
    end

    # Параметры для формы контактов
    def support_message_params
      params.require(:support_message).permit(:name, :email, :message)
    end

end
