Rails.application.routes.draw do
  root 'main#login'

  # Колбэки социальных сетей
    get '/auth/:provider/callback', to: 'session#create'

    # 404, используется как входящая страница для всех ссылок из социальных сетей с :UID
    # get '*a', to: redirect('/')

end
