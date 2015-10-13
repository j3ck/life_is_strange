Rails.application.routes.draw do
  root 'main#dashboard'

  # Колбэки социальных сетей
  get '/auth/:provider/callback', to: 'session#create'

  # Главная промо-страница
  get 'login', to: 'main#login', as: :login_path

  # Главная страница пользователя
  get 'dashboard', to: 'main#dashboard', as: :dashboard

  # Блоги пользователей
  resources :blogs

  # Страницы пользователей
  resources :users

  get ':name/:controller/(:action)'




  # 404, используется как входящая страница для всех ссылок из социальных сетей с :UID
  # get '*a', to: redirect('/')

end
