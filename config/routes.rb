Rails.application.routes.draw do
  get '/stations', to: 'stations#index', as: 'stations'
  get '/stops', to: 'stops#index'
end
