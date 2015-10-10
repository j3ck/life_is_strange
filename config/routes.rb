Rails.application.routes.draw do
  root 'main#index'


  # Колбэки социальных сетей
  get '/auth/:provider/callback', to: 'session#create'

  # 404
  get '*a', to: redirect('/')

end
