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
  get 'all_blogs', to: 'blogs#all_blogs', as: :all_blogs

  # Тренажёрный зал
  resources :gym, only: [:index] do
    # Обнуление статистики
    get 'reset', on: :collection
    # Общая информация о том как и что делать
    get 'how_to', on: :collection
  end

  # Форум
  resources :forum



  # 404, используется как входящая страница для всех ссылок из социальных сетей с :UID
  # get '*a', to: redirect('/')

end
