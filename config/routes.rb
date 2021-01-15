Rails.application.routes.draw do
  root to: 'albums#index'

  resources :albums do # this gives :albums full CRUD
    resources :songs, except: [:destroy]
  end  
end
