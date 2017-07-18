Rails.application.routes.draw do
  get '/', to: 'stations#index', as: 'stations'
  get '/stops', to: 'stops#index', as: 'stops'
  post '/stations', to: 'stops#index'
  get '/stops/:id', to: 'stops#show', as:'stops_details'
end
