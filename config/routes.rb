Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get '/', to: 'stations#index', as: 'stations'
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/stops', to: 'stops#index', as: 'stops'
  post '/stations', to: 'stops#index'
  get '/stops/:id', to: 'stops#show', as:'stops_details'

  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create', as:'create_favorite'
  delete '/favorites/:id', to: 'favorites#destroy', as: 'delete_favorite'
end
