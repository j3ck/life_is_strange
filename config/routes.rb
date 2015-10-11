Rails.application.routes.draw do
  root 'timers#index'

  # Колбэки социальных сетей
  get '/auth/:provider/callback', to: 'session#create'

  # Таймеры
  resources :timers

  get 'login', to: 'main#login', as: :login_path

  # 404, используется как входящая страница для всех ссылок из социальных сетей с :UID
  # get '*a', to: redirect('/')

end
