class SessionController < ApplicationController
# Класс отвечает за создание сессий пользователей на сайте

   def create
     # Находим пользователя через метод в модели User
       @user = User.find_or_create_from_auth_hash(auth_hash)
     # Создаём сессию
       session[:user_id] = @user.id
     # Переходим обратно на главную страницу
       redirect_to root_path
   end

   private

     # Приватный метод для получения данных о пользователях из социальных сетей
       def auth_hash
         request.env['omniauth.auth']
       end



end
