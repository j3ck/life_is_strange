Rails.application.routes.draw do
  root 'users#index'

  # Авторизация через Slack
  get 'oauth/authorize', as: :authorize
  get 'oauth/deauthorize', as: :deauthorize
  get 'oauth/request_access_token'

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
  # Страница конкретной темы
  get '/forum/theme/:title', to: 'forum#theme', as: :theme

  # Контакты
  match '/contacts', to: 'main#contacts', via: :all

  # 404, используется как входящая страница для всех ссылок из социальных сетей с :UID
  # get '*a', to: redirect('/')

end
