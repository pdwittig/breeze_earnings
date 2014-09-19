BreezeEarnings::Application.routes.draw do

  root 'earnings#index'

  get '/earnings', to: 'earnings#calculate'

end
