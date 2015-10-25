Rails.application.routes.draw do

  get '/:year/:month/:day' => 'main#index'
  get '/about' => 'main#about'
  get '/sample' => 'main#sample'

end
